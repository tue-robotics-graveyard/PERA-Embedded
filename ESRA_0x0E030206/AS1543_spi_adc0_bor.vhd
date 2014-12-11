library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity AS1543_spi_adc0 is
    port (
        clk          : in    std_logic;
        spi_adc_sclk : out   std_logic;
        spi_adc_mosi : out   std_logic;
        spi_adc_miso : in    std_logic;
        spi_adc_cs   : out   std_logic;
        adc_addr     : in    std_logic_vector(7 downto 0);
        adc_data     : out   std_logic_vector(15 downto 0)
    );
end AS1543_spi_adc0;

architecture rtl of AS1543_spi_adc0 is
  type state_type is (idle, wait_adc, read_adc);
  signal current_s, next_s  : state_type := idle;
  signal start_spi          : std_logic := '0';
  signal busy_spi           : std_logic := '0';
  constant ctrlhi           : std_logic_vector(0 to 1 ) := "10";
  constant ctrllo           : std_logic_vector(0 to 9 ) := "1100111000";
  begin
  clk_gen: process (clk)
  variable clk_cnt   : integer range 0 to 17 := 0;
  variable cnt       : integer range 0 to 4 := 0;
  variable ctrl      : std_logic_vector (0 to 15);
  begin
    if rising_edge(clk) then
      current_s <= next_s;   --state change.
      adc_data(15) <= start_spi;
      if start_spi='1' then
        if busy_spi='0' then
          ctrl := ctrlhi & adc_addr(3 downto 0) & ctrllo;
          busy_spi <= '1';
          spi_adc_cs <= '0';
          clk_cnt := 0;
          spi_adc_mosi<=ctrl(clk_cnt);
          cnt := 0;
        elsif clk_cnt<16 then
          cnt := cnt + 1;
          if cnt=2 then -- falling edge
            spi_adc_sclk<='0';
            adc_data(15-clk_cnt)<=spi_adc_miso;
--            adc_data(15-clk_cnt)<='1';
            spi_adc_mosi<=ctrl(clk_cnt);
          elsif cnt=4 then -- rising edge
            spi_adc_sclk<='1';
            cnt := 0;
            clk_cnt := clk_cnt + 1;
          end if;
        elsif clk_cnt=16 then
--          adc_data(15) <= '1';
          cnt := cnt + 1;
          if cnt=2 then -- falling edge
            spi_adc_sclk<='0';
          elsif cnt=4 then -- rising edge
            spi_adc_sclk<='1';
            clk_cnt := clk_cnt + 1;
          end if;
        elsif clk_cnt=17 then
          spi_adc_cs <= '1';
          busy_spi <= '0';
        end if;
      end if;
    end if;
  end process;
  adc_get: process (current_s, adc_addr(7), busy_spi)
  begin
    case current_s is
    when idle =>
      start_spi <= '0';
      if adc_addr(7)='1' then
        next_s <= wait_adc;
      else
        next_s <= idle;
      end if;
    when wait_adc =>
      if adc_addr(7)='0' then
        start_spi <= '1';
        next_s <= read_adc;
      else
        start_spi <= '0';
        next_s <= wait_adc;
      end if;
    when read_adc =>
      if busy_spi='1' then
        start_spi <= '1';
        next_s <= read_adc;
      else
        start_spi <= '0';
        next_s <= idle;
      end if;
    end case;
  end process;
end architecture;


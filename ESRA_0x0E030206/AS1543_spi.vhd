library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

--library work;
--  use work.adc_def;

entity AS1543_spi is
    port (
        clk          : in    std_logic;
        reset        : in    std_logic;
        spi_adc_sclk : out   std_logic;
        spi_adc_mosi : out   std_logic;
        spi_adc_miso : in    std_logic;
        spi_adc_cs   : out   std_logic;
        adc_addr     : in    std_logic_vector(7 downto 0);
        adc_data     : out   std_logic_vector(15 downto 0)
    );
end AS1543_spi;


architecture rtl of AS1543_spi is

  type state_type is (idle, wait_adc, read_adc);
  signal current_s, next_s: state_type := idle;
  signal cnt_rst   : std_logic;
  signal reset_spi_clk : std_logic := nto 0);
  constant ctrlhi  :  std_logic_vector(0 to 1 ) := "10";
  constant ctrllo  :  std_logic_vector(0 to 9 ) := "1100011000";


  begin

  clk_gen: process (clk, reset, start_spi)
  variable clk_spi   : std_logic := '1';
  variable clk_cnt   :  integer range 0 to 32 := 0;
  variable cnt: integer range 0 to 65535 := 0;
  variable ctrl    :  std_logic_vector (0 to 15);

  begin

    if (reset='1') then
      clk_cnt := 0;
      cnt:=0;
      current_s <= idle;  --default state on reset.
    elsif (rising_edge(clk)) then
        current_s <= next_s;   --state change.

        ctrl := ctrlhi & adc_addr(3 downto 0) & ctrllo;

        if (start_spi = '1') then
          if (clk_cnt = 0) then
            spi_busy <= '1';
            spi_adc_cs <= '0';
            adc_data(15) <= '1';
            clk_cnt := 1;
          elsif (clk_cnt <= 16) then
            cnt := cnt + 1;
            if (cnt = 2) then
              clk_spi := '0';
              spi_adc_mosi <= ctrl(clk_cnt);
              adc_x(16-clk_cnt) <= spi_adc_miso;
              adc_x(15) <= '0';
            elsif (cnt >= 4) then                -- clock low
              clk_spi := '1';
              cnt := 0;
              clk_cnt := clk_cnt + 1;
            end if;
            spi_adc_sclk <= clk_spi;
          elsif (clk_cnt > 16) then
            spi_busy <= '0';
            clk_cnt := 17;
            cnt := 0;
          end if;
        else
          adc_data <= "1000" & adc_x(11 downto 0);
          spi_adc_cs <= '1';
          spi_busy <= '0';
          clk_cnt := 0;
          cnt := 0;
        end if;

    end if;
  end process;


  adc_get: process (current_s, adc_addr, spi_busy, adc_x)
  begin

--   start := adc_addr(7);

   case current_s is

     when idle =>
--       spi_adc_mosi  <=  '0';
       start_spi <= '0';
       if (adc_addr(7) = '1') then
         next_s <= wait_adc;
       else
         next_s <= idle;
       end if;

     when wait_adc =>
       if (adc_addr(7) = '0') then
         start_spi <= '1';
         next_s <= read_adc;
       else
         next_s <= wait_adc;
       end if;

     when read_adc =>
--       spi_adc_mosi <= '1';
       if (spi_busy = '1') then
         next_s <= read_adc;
       else
         next_s <= idle;
       end if;

   end case;

  end process;
end architecture;









--begin
--  process (clk, reset)
--    variable cnt: integer range 0 to 65535;
--    variable clk_cnt :  integer range 0 to 32;
--    constant ctrlhi  :  std_logic_vector(0 to 2 ) := "010";
--    constant ctrllo  :  std_logic_vector(0 to 9 ) := "1100011000";
--    variable ctrl    :  std_logic_vector (0 to 16);
--    variable addr    :  std_logic_vector (0 to 3);
--    variable adc_x   :  std_logic_vector(0 to 15);








  -- begin
  --  ctrl(14 to 15) := "11";
  --  ctrl(0 to 9)   := "1111001000";
  --  addr   := "0001";
  --  ctrl(10 to 13) := addr;
  --  ctrl(0 to 15) := "1011001110001111";


  -- if (reset='1') then
  --    clk_cnt := 0;
  --    cnt := 0;
  --  elsif rising_edge(clk) then
  --    cnt := cnt +1;
  --    if (cnt = 10) then
  --      if (clk_cnt <= 16) then
  --        spi_adc_mosi <= ctrl(clk_cnt);
  --        spi_adc_cs <= '0';               -- chip select active
  --        spi_adc_sclk <= '1';             -- clock high
  --        adc_data(16-clk_cnt) <= spi_adc_miso;
  --      elsif (clk_cnt = 17) then
  --        spi_adc_cs <= '1';               -- chip select high
  --        spi_adc_mosi <= '0';
  --      elsif (clk_cnt = 32) then
  --        clk_cnt := 0;
  --          addr := addr + 1;
  --          if (addr = 8) then
  --            addr := 0;
  --          end if;
  --        addr := adc_channel(3 downto 0);
  --        ctrl := ctrlhi & addr & ctrllo;
  --      end if;

  --      clk_cnt := clk_cnt + 1;

  --    elsif (cnt = 20) then                -- clock low
  --      spi_adc_sclk <= '0';
  --      cnt := 0;
  --    end if;
  --  end if;
  --end process;


  --end rtl;


library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity AS1543_spi_adc0 is
    port (
        clk            : in  std_logic;
        reset          : in  std_logic;
        spi_adc_sclk   : out std_logic;
        spi_adc_mosi   : out std_logic;
        spi_adc_miso_0 : in  std_logic;
        spi_adc_miso_1 : in  std_logic;
        spi_adc_cs     : out std_logic;
        adc_addr       : in  std_logic_vector(7 downto 0);
        adc_data       : out std_logic_vector(15 downto 0)
    );
end AS1543_spi_adc0;

architecture rtl of AS1543_spi_adc0 is
  type mem_t is array (0 to 15) of std_logic_vector(15 downto 0);
  signal mem              : mem_t;
  signal adc_0            : std_logic_vector(15 downto 0);
  signal adc_1            : std_logic_vector(15 downto 0);
  begin
  cpu_com:process(clk)
  begin
    if rising_edge(clk) then
      adc_data<=mem(to_integer(unsigned(adc_addr(3 downto 0))));
    end if;
  end process cpu_com;
  adc_state_machine:process(reset,clk,adc_addr(3))
  type adc_state_t is (wait_mux,clk_conversion);
  variable adc_state      : adc_state_t:=wait_mux;
  constant wait_mux_cnt_c : integer:=4095;
  variable wait_mux_cnt   : integer range 0 to wait_mux_cnt_c:=wait_mux_cnt_c;
  variable ctrl           : std_logic:='1';
  variable clk_divide_cnt : integer range 0 to 6:=0;
  variable clk_spi_cnt    : integer range 0 to 16:=0;
  begin
    if reset='1' then
      ctrl:='1';
      adc_state:=wait_mux;
      wait_mux_cnt:=wait_mux_cnt_c;
      spi_adc_cs<='1';
      spi_adc_sclk<='1';
      spi_adc_mosi<='1';
--      mem(0)<="0001111111111110";
--      mem(1)<="0011111111111100";
--      mem(2)<="0101111111111000";
--      mem(3)<="0111111111110000";
--      mem(4)<="1001111111100000";
--      mem(5)<="1011111111000000";
--      mem(6)<="1101111110000000";
--      mem(7)<="1111111100000000";
    elsif rising_edge(clk) then
      case adc_state is
      when wait_mux =>
        wait_mux_cnt:=wait_mux_cnt-1;
        if wait_mux_cnt=0 then
          adc_state:=clk_conversion;
          spi_adc_cs<='0';
          clk_divide_cnt:=0;
          clk_spi_cnt:=16;
        else
          adc_state:=wait_mux;
          spi_adc_cs<='1';
        end if;
        spi_adc_sclk<='1';
        spi_adc_mosi<=ctrl;
      when clk_conversion =>
        clk_divide_cnt:=clk_divide_cnt+1;
        if clk_divide_cnt=3 then -- falling edge
          if clk_spi_cnt=0 then
            spi_adc_cs<='1';
            spi_adc_sclk<='1';
            adc_state:=wait_mux;
            wait_mux_cnt:=wait_mux_cnt_c;
            if adc_addr(4)='1' then
--              mem(0)<=adc;
              mem(to_integer(unsigned(adc_0(15 downto 13))))<=adc_0;
              mem(8+to_integer(unsigned(adc_1(15 downto 13))))<=adc_1;
--              mem(0)<="0000000000000000";
            end if;
            ctrl:='0';
          else
            spi_adc_cs<='0';
            spi_adc_sclk<='0';
            adc_state:=clk_conversion;
          end if;
        elsif clk_divide_cnt=6 then -- rising edge
          spi_adc_cs<='0';
          spi_adc_sclk<='1';
          clk_spi_cnt:=clk_spi_cnt-1;
          adc_0(clk_spi_cnt)<=spi_adc_miso_0;
          adc_1(clk_spi_cnt)<=spi_adc_miso_1;
          clk_divide_cnt:=0;
        end if;
        spi_adc_mosi<=ctrl;
      end case;
    end if;
  end process;
end architecture;



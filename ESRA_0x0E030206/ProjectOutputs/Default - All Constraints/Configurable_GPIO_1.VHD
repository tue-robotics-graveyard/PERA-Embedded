--	Netlister Generated File (DO NOT EDIT):
--	Date:4-12-2014
--	Time:15:06:40
--

library ieee;
use ieee.std_logic_1164.all;

----------------------------------------------
-- Entity Definition
----------------------------------------------
entity Configurable_GPIO_1 is
port(
   clk_i          : in  std_logic ;
   rst_i          : in  std_logic ;
   we_i           : in  std_logic ;
   adr_i         : in  std_logic_vector(1 downto 0) ;
   dat_i         : in  std_logic_vector(7 downto 0) ;
   dat_o         : out  std_logic_vector(7 downto 0) ;

   cyc_i          : in  std_logic ;
   stb_i          : in  std_logic ;
   ack_o          : out std_logic ;

   do_o         : out  std_logic_vector(7 downto 0) ;
   do_i         : in  std_logic_vector(7 downto 0) ;
   adc         : out  std_logic_vector(7 downto 0) ;
   di         : in  std_logic_vector(7 downto 0) 
);
end ;

architecture WB_PRTIO of Configurable_GPIO_1 is
   signal en         : std_logic ;

--------------------------------------------
-- Signal Definitions
--------------------------------------------
   signal do_o0    : std_logic_vector(7 downto 0);
   signal adc0    : std_logic_vector(7 downto 0);


begin

en    <= cyc_i and stb_i and we_i ;
ack_o <= cyc_i and stb_i ;


----------------------------------------------
-- Ports write
----------------------------------------------
process(clk_i)
begin
   if rising_edge(clk_i) then
      if rst_i='1' then
         -------------------------------------
         -- Synchronous reset
         -------------------------------------
         do_o0 <= (others=>'0') ;
         adc0 <= (others=>'0') ;

      else
         -------------------------------------
         -- Synchronous write
         -------------------------------------
         if en='1' and adr_i="00" then
            do_o0 <= dat_i (7 downto 0) ;
         end if ;
         if en='1' and adr_i="01" then
            adc0 <= dat_i (7 downto 0) ;
         end if ;

      end if ;
   end if ;
end process;

----------------------------------------------
-- Ports read
----------------------------------------------
process(do_i, di, adr_i)
begin
   case adr_i is
      when "00" =>
         dat_o (7 downto 0)  <= do_i;
      when "10" =>
         dat_o (7 downto 0)  <= di;
      when others =>
         dat_o <= (others=>'0') ;
   end case ;
end process;


----------------------------------------------
-- Output drivers
----------------------------------------------
do_o_drv :      do_o <= do_o0;
adc_drv :      adc <= adc0;


end WB_PRTIO;

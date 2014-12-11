--	Netlister Generated File (DO NOT EDIT):
--	Date:12-5-2014
--	Time:15:41:25
--

library ieee;
use ieee.std_logic_1164.all;

----------------------------------------------
-- Entity Definition
----------------------------------------------
entity Configurable_GPIO2 is
port(
   clk_i          : in  std_logic ;
   rst_i          : in  std_logic ;
   we_i           : in  std_logic ;
   dat_i         : in  std_logic_vector(7 downto 0) ;
   dat_o         : out  std_logic_vector(7 downto 0) ;

   cyc_i          : in  std_logic ;
   stb_i          : in  std_logic ;
   ack_o          : out std_logic ;

   pao         : out  std_logic_vector(7 downto 0) ;
   pai         : in  std_logic_vector(7 downto 0) 
);
end ;

architecture WB_PRTIO of Configurable_GPIO2 is
   signal en         : std_logic ;

--------------------------------------------
-- Signal Definitions
--------------------------------------------
   signal pao0    : std_logic_vector(7 downto 0);


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
         pao0 <= (others=>'0') ;

      else
         -------------------------------------
         -- Synchronous write
         -------------------------------------
         if en='1'  then
            pao0 <= dat_i (7 downto 0) ;
         end if ;

      end if ;
   end if ;
end process;

----------------------------------------------
-- Ports read
----------------------------------------------
process(pai)
begin
         dat_o (7 downto 0)  <= pai;
end process;


----------------------------------------------
-- Output drivers
----------------------------------------------
pao_drv :      pao <= pao0;


end WB_PRTIO;

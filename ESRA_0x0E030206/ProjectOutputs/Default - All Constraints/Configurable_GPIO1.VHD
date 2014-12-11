--	Netlister Generated File (DO NOT EDIT):
--	Date:22-8-2014
--	Time:15:14:28
--

library ieee;
use ieee.std_logic_1164.all;

----------------------------------------------
-- Entity Definition
----------------------------------------------
entity Configurable_GPIO1 is
port(
   clk_i          : in  std_logic ;
   rst_i          : in  std_logic ;
   we_i           : in  std_logic ;
   adr_i         : in  std_logic_vector(2 downto 0) ;
   dat_i         : in  std_logic_vector(7 downto 0) ;
   dat_o         : out  std_logic_vector(7 downto 0) ;

   cyc_i          : in  std_logic ;
   stb_i          : in  std_logic ;
   ack_o          : out std_logic ;

   pao         : out  std_logic_vector(7 downto 0) ;
   pai         : in  std_logic_vector(7 downto 0) ;
   pbo         : out  std_logic_vector(7 downto 0) ;
   pbi         : in  std_logic_vector(7 downto 0) ;
   pco         : out  std_logic_vector(7 downto 0) ;
   pci         : in  std_logic_vector(7 downto 0) ;
   pdo         : out  std_logic_vector(7 downto 0) ;
   pdi         : in  std_logic_vector(7 downto 0) ;
   peo         : out  std_logic_vector(7 downto 0) ;
   pei         : in  std_logic_vector(7 downto 0) 
);
end ;

architecture WB_PRTIO of Configurable_GPIO1 is
   signal en         : std_logic ;

--------------------------------------------
-- Signal Definitions
--------------------------------------------
   signal pao0    : std_logic_vector(7 downto 0);
   signal pbo0    : std_logic_vector(7 downto 0);
   signal pco0    : std_logic_vector(7 downto 0);
   signal pdo0    : std_logic_vector(7 downto 0);
   signal peo0    : std_logic_vector(7 downto 0);


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
         pbo0 <= (others=>'0') ;
         pco0 <= (others=>'0') ;
         pdo0 <= (others=>'0') ;
         peo0 <= (others=>'0') ;

      else
         -------------------------------------
         -- Synchronous write
         -------------------------------------
         if en='1' and adr_i="000" then
            pao0 <= dat_i (7 downto 0) ;
         end if ;
         if en='1' and adr_i="001" then
            pbo0 <= dat_i (7 downto 0) ;
         end if ;
         if en='1' and adr_i="010" then
            pco0 <= dat_i (7 downto 0) ;
         end if ;
         if en='1' and adr_i="011" then
            pdo0 <= dat_i (7 downto 0) ;
         end if ;
         if en='1' and adr_i="100" then
            peo0 <= dat_i (7 downto 0) ;
         end if ;

      end if ;
   end if ;
end process;

----------------------------------------------
-- Ports read
----------------------------------------------
process(pai, pbi, pci, pdi, pei, adr_i)
begin
   case adr_i is
      when "000" =>
         dat_o (7 downto 0)  <= pai;
      when "001" =>
         dat_o (7 downto 0)  <= pbi;
      when "010" =>
         dat_o (7 downto 0)  <= pci;
      when "011" =>
         dat_o (7 downto 0)  <= pdi;
      when "100" =>
         dat_o (7 downto 0)  <= pei;
      when others =>
         dat_o <= (others=>'0') ;
   end case ;
end process;


----------------------------------------------
-- Output drivers
----------------------------------------------
pao_drv :      pao <= pao0;
pbo_drv :      pbo <= pbo0;
pco_drv :      pco <= pco0;
pdo_drv :      pdo <= pdo0;
peo_drv :      peo <= peo0;


end WB_PRTIO;

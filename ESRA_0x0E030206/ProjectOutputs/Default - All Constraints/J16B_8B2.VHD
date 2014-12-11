-- -----------------------------------------------------------------
-- "Copyright (C) Altium Limited 2003"
-- -----------------------------------------------------------------
-- Component Name: 	J16B_8B2
-- Description: 	1 x 16-bit input bus to 2 x 8-Bit output bus
-- Core Revision: 	1.00.00
-- -----------------------------------------------------------------
-- Modifications with respect to Version  : 
--
--
-- -----------------------------------------------------------------

library IEEE;
use IEEE.Std_Logic_1164.all;

entity J16B_8B2 is
  port (
    I : in std_logic_vector(15 downto 0);
    OA, OB : out std_logic_vector(7 downto 0)
    );
end entity;

architecture STRUCTURE of J16B_8B2 is
begin

  OA(0) <= I(0);
  OA(1) <= I(1);
  OA(2) <= I(2);
  OA(3) <= I(3);
  OA(4) <= I(4);
  OA(5) <= I(5);
  OA(6) <= I(6);
  OA(7) <= I(7);
  
  OB(0) <= I(8);
  OB(1) <= I(9);
  OB(2) <= I(10);
  OB(3) <= I(11);
  OB(4) <= I(12);
  OB(5) <= I(13);
  OB(6) <= I(14);
  OB(7) <= I(15);
  
end architecture;

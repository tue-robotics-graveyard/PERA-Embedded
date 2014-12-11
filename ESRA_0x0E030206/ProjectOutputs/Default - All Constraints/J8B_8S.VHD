-- -----------------------------------------------------------------
-- "Copyright (C) Altium Limited 2003"
-- -----------------------------------------------------------------
-- Component Name: 	J8B_8S
-- Description: 	8-Bit input bus to 8 single pin outputs
-- Core Revision: 	1.00.00
-- -----------------------------------------------------------------
-- Modifications with respect to Version  : 
--
--
-- -----------------------------------------------------------------

library IEEE;
use IEEE.Std_Logic_1164.all;

entity J8B_8S is
  port (
    I : in std_logic_vector(7 downto 0);
    O0, O1, O2, O3, O4, O5, O6, O7 : out std_logic
    );
end entity;

architecture STRUCTURE of J8B_8S is
begin

  O0 <= I(0);
  O1 <= I(1);
  O2 <= I(2);
  O3 <= I(3);
  O4 <= I(4);
  O5 <= I(5);
  O6 <= I(6);
  O7 <= I(7);
  
end architecture;

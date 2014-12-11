-- -----------------------------------------------------------------
-- "Copyright (C) Altium Limited 2003"
-- -----------------------------------------------------------------
-- Component Name: 	J8S_8B
-- Description: 	8 Single pin inputs to single 8-Bit output bus
-- Core Revision: 	1.00.00
-- -----------------------------------------------------------------
-- Modifications with respect to Version  : 
--
--
-- -----------------------------------------------------------------

library IEEE;
use IEEE.Std_Logic_1164.all;

entity J8S_8B is
  port (
    I0, I1, I2, I3, I4, I5, I6, I7 : in std_logic;
    O : out std_logic_vector(7 downto 0)
    );
end entity;

architecture STRUCTURE of J8S_8B is
begin

  O(0) <= I0;
  O(1) <= I1;
  O(2) <= I2;
  O(3) <= I3;
  O(4) <= I4;
  O(5) <= I5;
  O(6) <= I6;
  O(7) <= I7;

end architecture;

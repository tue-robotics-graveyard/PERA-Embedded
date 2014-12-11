-- -----------------------------------------------------------------
-- "Copyright (C) Altium Limited 2003"
-- -----------------------------------------------------------------
-- Component Name: 	J16S_16B
-- Description: 	16 Single pin inputs to single 16-Bit output bus
-- Core Revision: 	1.00.00
-- -----------------------------------------------------------------
-- Modifications with respect to Version  : 
--
--
-- -----------------------------------------------------------------

library IEEE;
use IEEE.Std_Logic_1164.all;

entity J16S_16B is
  port (
    I0, I1, I2, I3, I4, I5, I6, I7, 
    I8, I9, I10, I11, I12, I13, I14, I15 : in std_logic;
    O : out std_logic_vector(15 downto 0)
    );
end entity;

architecture STRUCTURE of J16S_16B is
begin

  O(0) <= I0;
  O(1) <= I1;
  O(2) <= I2;
  O(3) <= I3;
  O(4) <= I4;
  O(5) <= I5;
  O(6) <= I6;
  O(7) <= I7;
  O(8) <= I8;
  O(9) <= I9;
  O(10) <= I10;
  O(11) <= I11;
  O(12) <= I12;
  O(13) <= I13;
  O(14) <= I14;
  O(15) <= I15;

end architecture;

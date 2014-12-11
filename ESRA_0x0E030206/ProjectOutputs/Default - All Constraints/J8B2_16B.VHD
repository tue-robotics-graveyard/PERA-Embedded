-- -----------------------------------------------------------------
-- "Copyright (C) Altium Limited 2003"
-- -----------------------------------------------------------------
-- Component Name: 	J8B2_16B
-- Description: 	2 x 8-Bit input bus to 1 x 16-bit output bus
-- Core Revision: 	1.00.00
-- -----------------------------------------------------------------
-- Modifications with respect to Version  : 
--
--
-- -----------------------------------------------------------------

library IEEE;
use IEEE.Std_Logic_1164.all;

entity J8B2_16B is
  port (
    IA, IB : in std_logic_vector(7 downto 0);
    O : out std_logic_vector(15 downto 0)
    );
end entity;

architecture STRUCTURE of J8B2_16B is
begin

  O(0) <= IA(0);
  O(1) <= IA(1);
  O(2) <= IA(2);
  O(3) <= IA(3);
  O(4) <= IA(4);
  O(5) <= IA(5);
  O(6) <= IA(6);
  O(7) <= IA(7);
  O(8) <= IB(0);
  O(9) <= IB(1);
  O(10) <= IB(2);
  O(11) <= IB(3);
  O(12) <= IB(4);
  O(13) <= IB(5);
  O(14) <= IB(6);
  O(15) <= IB(7);

end architecture;

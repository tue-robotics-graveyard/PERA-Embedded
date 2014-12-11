-- INC & DEC function
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

PACKAGE user_pkg IS
  function INC(X: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function DEC(X: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
END user_pkg;

PACKAGE BODY user_pkg IS
  function INC(X: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  variable XV: STD_LOGIC_VECTOR(X'LENGTH-1 downto 0);
  begin
    XV:=X;
    for I in 0 to XV'HIGH LOOP
      if XV(I)='0' then
        XV(I):='1';
        exit;
      else
        XV(I):='0';
      end if;
    end loop;

    return XV;

  end INC;

  function DEC(X: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  variable XV: STD_LOGIC_VECTOR(X'LENGTH-1 downto 0);
  begin
    XV:=X;
    for I in 0 to XV'HIGH LOOP
      if XV(I)='1' then
        XV(I):='0';
        exit;
      else
        XV(I):='1';
      end if;
    end loop;

    return XV;

  end DEC;

END user_pkg;


--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.Std_Logic_1164.all;
USE IEEE.Std_Logic_Unsigned.all;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
ENTITY Configurable_U2 IS
  PORT(
      UP   : IN  std_logic;
      Q    : OUT std_logic_vector(15 downto 0);
      R    : IN  std_logic;
      CEO  : OUT std_logic;
      TC   : OUT std_logic;
      CE   : IN  std_logic;
      C    : IN  std_logic
  );
END Configurable_U2;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
ARCHITECTURE structure OF Configurable_U2 IS
--------------------------------------------------------------------------------
CONSTANT cMaxValue : std_logic_vector(15 downto 0) := "1111111111111111";
CONSTANT cMinValue : std_logic_vector(15 downto 0) := (OTHERS => '0');
SIGNAL Y : std_logic_vector(15 downto 0) := cMinValue;
SIGNAL TC_int: std_logic;
--------------------------------------------------------------------------------
BEGIN
    PROCESS(C)
    BEGIN
        IF C'Event and C = '1' THEN
            IF R = '1' THEN
                IF UP = '1' THEN 
                    Y <= cMinValue;
                ELSE
                    Y <= cMaxValue;
                END IF;
            ELSE
                IF (CE = '1') THEN
                    IF (UP = '1') THEN
                        IF Y >= cMaxValue THEN
                            IF UP = '1' THEN 
                                Y <= cMinValue;
                            ELSE
                                Y <= cMaxValue;
                            END IF;
                        ELSE
                            Y <= Y + 1;
                        END IF;
                    ELSE
                        IF Y <= cMinValue THEN
                            IF UP = '1' THEN 
                                Y <= cMinValue;
                            ELSE
                                Y <= cMaxValue;
                            END IF;
                        ELSE
                            Y <= Y - 1;
                        END IF;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    TC_int <= '1' WHEN (Y = cMaxValue AND (UP = '1')) OR (Y = cMinValue AND (UP = '0')) ELSE
              '0';
    Q <= Y;
    TC <= TC_int;
    CEO <= TC_int AND CE;
END structure;
--------------------------------------------------------------------------------

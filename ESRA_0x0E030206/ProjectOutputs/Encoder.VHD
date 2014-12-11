------------------------------------------------------------
-- VHDL Encoder
-- 2014 12 4 15 6 41
-- Created By "DXP VHDL Generator"
-- "Copyright (c) 2002-2014 Altium Limited"
-- Product Version: 14.3.15.35511
------------------------------------------------------------

------------------------------------------------------------
-- VHDL Encoder
------------------------------------------------------------

Library IEEE;
Use     IEEE.std_logic_1164.all;

--synthesis translate_off
Library GENERIC_LIB;
Use     GENERIC_LIB.all;

--synthesis translate_on
Entity Encoder Is
  port
  (
    CLK     : In    STD_LOGIC;                               -- ObjectKind=Port|PrimaryId=CLK
    COUNTER : Out   STD_LOGIC_VECTOR(15 DOWNTO 0);           -- ObjectKind=Port|PrimaryId=COUNTER[15..0]
    ENC_A   : In    STD_LOGIC;                               -- ObjectKind=Port|PrimaryId=ENC_A
    ENC_B   : In    STD_LOGIC                                -- ObjectKind=Port|PrimaryId=ENC_B
  );
  attribute MacroCell : boolean;

End Encoder;
------------------------------------------------------------

------------------------------------------------------------
Architecture Structure Of Encoder Is
   Component Configurable_U2                                 -- ObjectKind=Part|PrimaryId=U2|SecondaryId=1
      port
      (
        C  : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U2-C
        CE : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U2-CE
        Q  : out STD_LOGIC_VECTOR(15 downto 0);              -- ObjectKind=Pin|PrimaryId=U2-Q[15..0]
        R  : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U2-R
        UP : in  STD_LOGIC                                   -- ObjectKind=Pin|PrimaryId=U2-UP
      );
   End Component;

   Component FD2S                                            -- ObjectKind=Part|PrimaryId=U4|SecondaryId=1
      port
      (
        C  : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U4-C
        D0 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U4-D0
        D1 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U4-D1
        Q0 : out STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U4-Q0
        Q1 : out STD_LOGIC                                   -- ObjectKind=Pin|PrimaryId=U4-Q1
      );
   End Component;

   Component XOR2                                            -- ObjectKind=Part|PrimaryId=U3|SecondaryId=1
      port
      (
        I0 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U3-I0
        I1 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U3-I1
        O  : out STD_LOGIC                                   -- ObjectKind=Pin|PrimaryId=U3-O
      );
   End Component;

   Component XOR4                                            -- ObjectKind=Part|PrimaryId=U7|SecondaryId=1
      port
      (
        I0 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U7-I0
        I1 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U7-I1
        I2 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U7-I2
        I3 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U7-I3
        O  : out STD_LOGIC                                   -- ObjectKind=Pin|PrimaryId=U7-O
      );
   End Component;


    Signal PinSignal_U2_Q   : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=COUNTER[15..0]
    Signal PinSignal_U3_O   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU2_UP
    Signal PinSignal_U4_Q0  : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU3_I0
    Signal PinSignal_U4_Q1  : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU4_Q1
    Signal PinSignal_U5_Q0  : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU5_Q0
    Signal PinSignal_U5_Q1  : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU3_I1
    Signal PinSignal_U7_O   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU2_CE
    Signal PowerSignal_GND  : STD_LOGIC; -- ObjectKind=Net|PrimaryId=GND

Begin
    U7 : XOR4                                                -- ObjectKind=Part|PrimaryId=U7|SecondaryId=1
      Port Map
      (
        I0 => PinSignal_U4_Q0,                               -- ObjectKind=Pin|PrimaryId=U7-I0
        I1 => PinSignal_U4_Q1,                               -- ObjectKind=Pin|PrimaryId=U7-I1
        I2 => PinSignal_U5_Q0,                               -- ObjectKind=Pin|PrimaryId=U7-I2
        I3 => PinSignal_U5_Q1,                               -- ObjectKind=Pin|PrimaryId=U7-I3
        O  => PinSignal_U7_O                                 -- ObjectKind=Pin|PrimaryId=U7-O
      );

    U5 : FD2S                                                -- ObjectKind=Part|PrimaryId=U5|SecondaryId=1
      Port Map
      (
        C  => CLK,                                           -- ObjectKind=Pin|PrimaryId=U5-C
        D0 => PinSignal_U4_Q0,                               -- ObjectKind=Pin|PrimaryId=U5-D0
        D1 => PinSignal_U4_Q1,                               -- ObjectKind=Pin|PrimaryId=U5-D1
        Q0 => PinSignal_U5_Q0,                               -- ObjectKind=Pin|PrimaryId=U5-Q0
        Q1 => PinSignal_U5_Q1                                -- ObjectKind=Pin|PrimaryId=U5-Q1
      );

    U4 : FD2S                                                -- ObjectKind=Part|PrimaryId=U4|SecondaryId=1
      Port Map
      (
        C  => CLK,                                           -- ObjectKind=Pin|PrimaryId=U4-C
        D0 => ENC_A,                                         -- ObjectKind=Pin|PrimaryId=U4-D0
        D1 => ENC_B,                                         -- ObjectKind=Pin|PrimaryId=U4-D1
        Q0 => PinSignal_U4_Q0,                               -- ObjectKind=Pin|PrimaryId=U4-Q0
        Q1 => PinSignal_U4_Q1                                -- ObjectKind=Pin|PrimaryId=U4-Q1
      );

    U3 : XOR2                                                -- ObjectKind=Part|PrimaryId=U3|SecondaryId=1
      Port Map
      (
        I0 => PinSignal_U4_Q0,                               -- ObjectKind=Pin|PrimaryId=U3-I0
        I1 => PinSignal_U5_Q1,                               -- ObjectKind=Pin|PrimaryId=U3-I1
        O  => PinSignal_U3_O                                 -- ObjectKind=Pin|PrimaryId=U3-O
      );

    U2 : Configurable_U2                                     -- ObjectKind=Part|PrimaryId=U2|SecondaryId=1
      Port Map
      (
        C  => CLK,                                           -- ObjectKind=Pin|PrimaryId=U2-C
        CE => PinSignal_U7_O,                                -- ObjectKind=Pin|PrimaryId=U2-CE
        Q  => PinSignal_U2_Q,                                -- ObjectKind=Pin|PrimaryId=U2-Q[15..0]
        R  => PowerSignal_GND,                               -- ObjectKind=Pin|PrimaryId=U2-R
        UP => PinSignal_U3_O                                 -- ObjectKind=Pin|PrimaryId=U2-UP
      );

    -- Signal Assignments
    ---------------------
    COUNTER         <= PinSignal_U2_Q; -- ObjectKind=Net|PrimaryId=COUNTER[15..0]
    PowerSignal_GND <= '0'; -- ObjectKind=Net|PrimaryId=GND

End Structure;
------------------------------------------------------------


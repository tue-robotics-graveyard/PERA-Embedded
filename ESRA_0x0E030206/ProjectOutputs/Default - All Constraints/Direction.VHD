------------------------------------------------------------
-- VHDL Direction
-- 2014 12 4 15 6 39
-- Created By "Altium Designer VHDL Generator"
-- "Copyright (c) 2002-2014 Altium Limited"
-- Product Version: 14.3.15.35511
------------------------------------------------------------

------------------------------------------------------------
-- VHDL Direction
------------------------------------------------------------

Library IEEE;
Use     IEEE.std_logic_1164.all;

Entity Direction Is
  port
  (
    DIR   : In    STD_LOGIC;                                 -- ObjectKind=Port|PrimaryId=DIR
    PWM   : In    STD_LOGIC;                                 -- ObjectKind=Port|PrimaryId=PWM
    PWM_A : Out   STD_LOGIC;                                 -- ObjectKind=Port|PrimaryId=PWM_A
    PWM_B : Out   STD_LOGIC                                  -- ObjectKind=Port|PrimaryId=PWM_B
  );
  attribute MacroCell : boolean;




End Direction;
------------------------------------------------------------

------------------------------------------------------------
Architecture Structure Of Direction Is
   Component AND2                                            -- ObjectKind=Part|PrimaryId=U16|SecondaryId=1
      port
      (
        I0 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U16-I0
        I1 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U16-I1
        O  : out STD_LOGIC                                   -- ObjectKind=Pin|PrimaryId=U16-O
      );
   End Component;

   Component INV                                             -- ObjectKind=Part|PrimaryId=U12|SecondaryId=1
      port
      (
        I : in  STD_LOGIC;                                   -- ObjectKind=Pin|PrimaryId=U12-I
        O : out STD_LOGIC                                    -- ObjectKind=Pin|PrimaryId=U12-O
      );
   End Component;


    Signal PinSignal_U12_O : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU12_O
    Signal PinSignal_U16_O : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU16_O
    Signal PinSignal_U18_O : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU18_O




Begin
    U18 : AND2                                               -- ObjectKind=Part|PrimaryId=U18|SecondaryId=1
      Port Map
      (
        I0 => DIR,                                           -- ObjectKind=Pin|PrimaryId=U18-I0
        I1 => PWM,                                           -- ObjectKind=Pin|PrimaryId=U18-I1
        O  => PinSignal_U18_O                                -- ObjectKind=Pin|PrimaryId=U18-O
      );

    U16 : AND2                                               -- ObjectKind=Part|PrimaryId=U16|SecondaryId=1
      Port Map
      (
        I0 => PinSignal_U12_O,                               -- ObjectKind=Pin|PrimaryId=U16-I0
        I1 => PWM,                                           -- ObjectKind=Pin|PrimaryId=U16-I1
        O  => PinSignal_U16_O                                -- ObjectKind=Pin|PrimaryId=U16-O
      );

    U12 : INV                                                -- ObjectKind=Part|PrimaryId=U12|SecondaryId=1
      Port Map
      (
        I => DIR,                                            -- ObjectKind=Pin|PrimaryId=U12-I
        O => PinSignal_U12_O                                 -- ObjectKind=Pin|PrimaryId=U12-O
      );

    -- Signal Assignments
    ---------------------
    PWM_A <= PinSignal_U16_O; -- ObjectKind=Net|PrimaryId=NetU16_O
    PWM_B <= PinSignal_U18_O; -- ObjectKind=Net|PrimaryId=NetU18_O

End Structure;
------------------------------------------------------------


--------------------------------------------------------------------------------
Library IEEE;
Use IEEE.Std_Logic_1164.all;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Entity Configurable_TERMINATOR_1 Is
  Port(
        STB_I        : In    Std_Logic;
        CYC_I        : In    Std_Logic;
        ACK_O        : Out   Std_Logic;
        ADR_I        : In    Std_Logic_Vector(31 DownTo 0);
        DAT_O        : Out   Std_Logic_Vector(31 DownTo 0);
        DAT_I        : In    Std_Logic_Vector(31 DownTo 0);
        SEL_I        : In    Std_Logic_Vector(3 DownTo 0);
        WE_I         : In    Std_Logic

      );
End Configurable_TERMINATOR_1;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Architecture RTL Of Configurable_TERMINATOR_1 Is
Begin
    ACK_O        <= '0';
    DAT_O        <= (Others=>'0');
End RTL;
--------------------------------------------------------------------------------

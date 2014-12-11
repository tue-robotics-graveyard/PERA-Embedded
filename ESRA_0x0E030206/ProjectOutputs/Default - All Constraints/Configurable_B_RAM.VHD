Library IEEE;
Use IEEE.Std_Logic_1164.all;
Use IEEE.std_logic_unsigned.all;

--------------------------------------------------------------------------------
Entity Configurable_B_RAM Is Port
   (
     ---------------------------------------------------------------------------
     BRAM_DI    : Out   Std_Logic_Vector(31 DownTo 0);
     BRAM_DO    : In    Std_Logic_Vector(31 DownTo 0);
     BRAM_A     : Out   Std_Logic_Vector(15-1 DownTo 0);
     BRAM_WE    : Out   Std_Logic;
     BRAM_EN    : Out   Std_Logic;
     BRAM_BW    : Out   Std_Logic_Vector( 3 DownTo 0);
     ---------------------------------------------------------------------------

     ---------------------------------------------------------------------------
     -- Wishbone Slave Port - Never Changes
     ---------------------------------------------------------------------------
     CLK_I      : In    Std_Logic;
     RST_I      : In    Std_Logic;
     CYC_I      : In    Std_Logic;
     STB_I      : In    Std_Logic;
     ACK_O      : Out   Std_Logic;
     ADR_I      : In    Std_Logic_Vector(17-1 DownTo 0);
     DAT_I      : In    Std_Logic_Vector(31 DownTo 0);
     DAT_O      : Out   Std_Logic_Vector(31 DownTo 0);
     WE_I       : In    Std_Logic;
     SEL_I      : In    Std_Logic_Vector( 3 DownTo 0)
   );

End Configurable_B_RAM;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Architecture RTL Of Configurable_B_RAM Is
    Signal EN      : Std_Logic;
    Signal ACK     : Std_Logic;
Begin
    BRAM_DI   <= DAT_I;
    BRAM_A    <= ADR_I(15+1 DownTo 2);
    BRAM_BW   <= SEL_I;
    BRAM_EN   <= EN;
    BRAM_WE   <= WE_I;

    DAT_O       <= BRAM_DO;
    ACK_O       <= ACK;

    EN          <= STB_I And CYC_I;

    DoubleDFF:
    Process(CLK_I)
    Begin
        If Rising_Edge(CLK_I) Then
            If ACK = '1' Then
                ACK <= '0';
            Else
                ACK <= EN;
            End If;
        End If;
    End Process;
End RTL;
--------------------------------------------------------------------------------


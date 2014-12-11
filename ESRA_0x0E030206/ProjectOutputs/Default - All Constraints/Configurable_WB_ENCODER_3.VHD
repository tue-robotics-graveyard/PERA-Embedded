--------------------------------------------------------------------------------
-- Generated: 22-8-2014 11:53:29
--------------------------------------------------------------------------------
Library IEEE;
Use IEEE.Std_Logic_1164.all;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Entity Configurable_WB_ENCODER_3 Is Port
--------------------------------------------------------------------------------
(
    COUNT_I              : In   Std_Logic_Vector(31 DownTo 0);

    INDEX_I              : In   Std_Logic_Vector(31 DownTo 0);

    STB_I                : In   Std_Logic;
    CYC_I                : In   Std_Logic;
    ACK_O                : Out  Std_Logic;
    ADR_I                : In   Std_Logic;
    DAT_O                : Out  Std_Logic_Vector(31 DownTo 0);
    WE_I                 : In   Std_Logic;
    CLK_I                : In   Std_Logic;
    RST_I                : In   Std_Logic
);
--------------------------------------------------------------------------------
End Configurable_WB_ENCODER_3;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Architecture Structure Of Configurable_WB_ENCODER_3 Is
--------------------------------------------------------------------------------

    Signal IsReading                    : Std_Logic;
    Signal IsWriting                    : Std_Logic;
    Signal Acknowledge                  : Std_Logic;

    Constant cDecodeAddress_COUNT       : Std_Logic := '0';
    Constant cDecodeAddress_INDEX       : Std_Logic := '1';

    Signal ActiveAddress_COUNT          : Std_Logic;
    Signal ActiveAddress_INDEX          : Std_Logic;

    Signal Read_COUNT                   : Std_Logic;
    Signal Read_INDEX                   : Std_Logic;

--------------------------------------------------------------------------------
Begin
--------------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    IsReading <= STB_I And CYC_I And Not WE_I;
    IsWriting <= STB_I And CYC_I And     WE_I;
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    ACK_O <= Acknowledge;
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    ActiveAddress_COUNT <= '1'      When ADR_I              = cDecodeAddress_COUNT      Else '0';
    ActiveAddress_INDEX <= '1'      When ADR_I              = cDecodeAddress_INDEX      Else '0';
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    Process (IsReading, IsWriting, ActiveAddress_COUNT, ActiveAddress_INDEX)
    Begin
        Acknowledge      <= '0';
        Read_COUNT       <= '0';
        Read_INDEX       <= '0';

        If IsReading = '1' Then
            If ActiveAddress_COUNT = '1'      Then Read_COUNT <= '1';       Acknowledge  <= '1'; End If;
            If ActiveAddress_INDEX = '1'      Then Read_INDEX <= '1';       Acknowledge  <= '1'; End If;
            If (ActiveAddress_COUNT
                Or ActiveAddress_INDEX) = '0' Then Acknowledge <= '1'; End If;
        End If;
    End Process;
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    Process (Read_COUNT, COUNT_I, Read_INDEX, INDEX_I)
    Begin
        DAT_O <= (Others => '0');

        If Read_COUNT = '1' Then
            DAT_O(31 DownTo 0) <= COUNT_I;
        End If;
        If Read_INDEX = '1' Then
            DAT_O(31 DownTo 0) <= INDEX_I;
        End If;
    End Process;
    ----------------------------------------------------------------------------

--------------------------------------------------------------------------------
End Structure;
--------------------------------------------------------------------------------

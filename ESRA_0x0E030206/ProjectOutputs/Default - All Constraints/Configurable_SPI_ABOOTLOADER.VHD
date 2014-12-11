-- -----------------------------------------------------------------------------
-- Bootloader Master implementation based on WB_SPI8 and WB_SPI32 peripherals.
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
Library IEEE;
Use     IEEE.Std_Logic_1164.All;
Use     IEEE.Std_Logic_Unsigned.All;
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
Entity BOOTLOADER_MASTER Is
    Port (
        -- System
        CLK       : In  Std_Logic;
        RST       : In  Std_Logic;
        ENABLE    : In  Std_Logic;
        CPU_HOLD  : Out Std_Logic;

        -- Wb Master 2 Spi
        spi_CLK_O : Out Std_Logic;
        spi_RST_O : Out Std_Logic;
        spi_STB_O : Out Std_Logic;
        spi_CYC_O : Out Std_Logic;
        spi_ACK_I : In  Std_Logic;
        spi_ADR_O : Out Std_Logic_Vector( 2 Downto 0);
        spi_DAT_O : Out Std_Logic_Vector(31 Downto 0);
        spi_DAT_I : In  Std_Logic_Vector(31 Downto 0);
        spi_WE_O  : Out Std_Logic;

        -- Wb Master 2 Memory
        me_STB_O : Out Std_Logic;
        me_CYC_O : Out Std_Logic;
        me_ACK_I : In  Std_Logic;
        me_ADR_O : Out Std_Logic_Vector(31 Downto 0);
        me_DAT_I : In  Std_Logic_Vector(31 Downto 0);
        me_DAT_O : Out Std_Logic_Vector(31 Downto 0);
        me_SEL_O : Out Std_Logic_Vector( 3 Downto 0);
        me_WE_O  : Out Std_Logic;
        me_CLK_O : Out Std_Logic;
        me_RST_O : Out Std_Logic
    );
End;
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
Architecture RTL Of BOOTLOADER_MASTER Is
-- -----------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    Type TBootLoaderState Is (
                                sIdle,

--                                sSpiPrepareDeviceRequest1,        -- IncludeIf_IsNanoBoard
--                                sSpiPrepareDeviceRequest2,        -- IncludeIf_IsNanoBoard
--                                sSpiPrepareDeviceRequest3,        -- IncludeIf_IsNanoBoard
--                                sSpiPrepareDeviceRequest4,        -- IncludeIf_IsNanoBoard
--                                sSpiSendDeviceRequest1,           -- IncludeIf_IsNanoBoard
--                                sSpiSendDeviceRequest2,           -- IncludeIf_IsNanoBoard
--                                sSpiSendDeviceRequest3,           -- IncludeIf_IsNanoBoard
--                                sSpiSendDeviceRequest4,           -- IncludeIf_IsNanoBoard
--                                sSpiSendDeviceRequest5,           -- IncludeIf_IsNanoBoard
--                                sSpiGetDeviceRequestConfirmation, -- IncludeIf_IsNanoBoard
--                                sSpiDeviceRequestCheck,           -- IncludeIf_IsNanoBoard
--                                sSpiPrepareDeviceSelect1,         -- IncludeIf_IsNanoBoard
--                                sSpiPrepareDeviceSelect2,         -- IncludeIf_IsNanoBoard
--                                sSpiPrepareDeviceSelect3,         -- IncludeIf_IsNanoBoard
--                                sSpiPrepareDeviceSelect4,         -- IncludeIf_IsNanoBoard
--                                sSpiDeviceSelect,                 -- IncludeIf_IsNanoBoard
--                                sSpiPrepareCommand1,              -- IncludeIf_IsNanoBoard
--                                sSpiPrepareCommand2,              -- IncludeIf_IsNanoBoard
--                                sSpiChannelClosePrepare1,         -- IncludeIf_IsNanoBoard
--                                sSpiChannelClosePrepare2,         -- IncludeIf_IsNanoBoard
--                                sSpiChannelClosePrepare3,         -- IncludeIf_IsNanoBoard
--                                sSpiChannelClosePrepare4,         -- IncludeIf_IsNanoBoard
--                                sSpiChannelClose,                 -- IncludeIf_IsNanoBoard

                                sSpiResetExit,
                                sSpiWriteDivisor,
                                sSpiPrepareCommand,
                                sSpiSendReadCommand,
                                sSpiSendCodeLocation1,
                                sSpiSendCodeLocation2,
                                sSpiSendCodeLocation3,
                                sSpiSendReceiveByte,
                                sSpiRegisterByte,
                                sSpiCoreCleanUp,
                                sSpiBusy,
                                sSpiBusyYouWish,
                                sBootloaderFinished
                             );
    Signal fState           : TBootLoaderState;
    Signal fStateNext       : TBootLoaderState;
    Signal fReturnState     : TBootLoaderState;
    Signal fReturnStateNext : TBootLoaderState;

    Type   TMeState Is (sIdle, sTransfer, sAddressIncrement);
    Signal fMeState     : TMeState;
    Signal fMeStateNext : TMeState;
    -- -------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    Constant cCodeDestination                      : Std_Logic_Vector(31 Downto 0) := "00000000000000000000000000000000";
    Constant cWordCount                            : Std_Logic_Vector(31 Downto 0) := "00000000000000000100000000000000";

    Constant cSpiCore_Divisor                      : Std_Logic_Vector( 7 Downto 0) := x"32";                                            --RAF: check correct value for new cores
    Constant cSpiFlash_NanoboardIndex              : Std_Logic_Vector( 7 Downto 0) := x"82";
    Constant cSpiFlash_ReadCommand                 : Std_Logic_Vector( 7 Downto 0) := x"03";

    Constant cCodeLocation_1                       : Std_Logic_Vector(7 Downto 0) := x"00";
    Constant cCodeLocation_2                       : Std_Logic_Vector(7 Downto 0) := x"00";
    Constant cCodeLocation_3                       : Std_Logic_Vector(7 Downto 0) := x"00";

    Constant cSpiCore_RegAdr_Data                  : Std_Logic_Vector(2 Downto 0) := "000";
    Constant cSpiCore_RegAdr_Control               : Std_Logic_Vector(2 Downto 0) := "011";
    Constant cSpiCore_RegAdr_Status                : Std_Logic_Vector(2 Downto 0) := "100";
    Constant cSpiCore_RegAdr_Divisor               : Std_Logic_Vector(2 Downto 0) := "101";

    Constant cSpiCore_Data_CsHigh                  : Std_Logic_Vector(7 Downto 0) := x"02";
    Constant cSpiCore_Data_ModeHighCsLow           : Std_Logic_Vector(7 Downto 0) := x"04";
    Constant cSpiCore_Data_ModeHighCsHigh          : Std_Logic_Vector(7 Downto 0) := x"06";
    Constant cSpiCore_Data_ModeLowCsHigh           : Std_Logic_Vector(7 Downto 0) := x"02";
    Constant cSpiCore_Data_ModeLowSelectLowEnabled : Std_Logic_Vector(7 Downto 0) := x"00";

    Constant cSpiCore_DeviceRequest                : Std_Logic_Vector(7 Downto 0) := x"80"; -- channel open request to NanoBoard
    Constant cSpiCore_Data_CoreDefault             : Std_Logic_Vector(7 Downto 0) := x"3A"; -- set default values for SPI core. (pull MODE low!)

    Constant cSpiCore_Flag_Busy : Integer := 0;
    -- -------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    Signal Start           : Std_Logic;

    Signal spi_Address     : Std_Logic_Vector(2 Downto 0);
    Signal spi_Write       : Std_Logic;
    Signal spi_Read        : Std_Logic;
    Signal spi_Data        : Std_Logic_Vector(7 Downto 0);
    Signal SaveReturnState : Std_Logic;
    Signal SaveDataByte    : Std_Logic;
    Signal MemoryDone      : Std_Logic;
    Signal MemoryData      : Std_Logic_Vector(31 Downto 0);

    Signal WishboneAddressInc : Std_Logic;
    Signal IsByteCounterZero  : Std_Logic;
    Signal ByteCounter        : Std_Logic_Vector(2 Downto 0);
    Signal WishboneData       : Std_Logic_Vector(31 Downto 0);
    Signal WishboneAddress    : Std_Logic_Vector(31 Downto 0);

    Signal WishboneGo : Std_Logic;
    -- -------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
Begin
-- -----------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    Start    <= ENABLE;
    CPU_HOLD <= '1' When ( (fState/=sBootLoaderFinished) And (Start='1') ) Else '0';
    -- -------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    Process(fState, spi_ACK_I, spi_DAT_I, ByteCounter, MemoryDone, fReturnState)
    Begin
        spi_Address     <= (Others=>'0');
        spi_Data        <= (Others=>'0');
        spi_Write       <= '0';
        spi_Read        <= '0';

        SaveReturnState <= '0';
        SaveDataByte    <= '0';

        -- ---------------------------------------------------------------------
        fStateNext       <= fState;
        fReturnStateNext <= sIdle;
        -- ---------------------------------------------------------------------
        Case fState Is
            -- -----------------------------------------------------------------
            When sIdle =>
                 If Start = '1' Then
                     fStateNext <= sSpiResetExit;
                 End If;
            -- -----------------------------------------------------------------
            When sSpiResetExit =>
                 fStateNext <= sSpiWriteDivisor;
            -- -----------------------------------------------------------------
            When sSpiWriteDivisor =>
                 spi_Address      <= cSpiCore_RegAdr_Divisor;
                 spi_Data         <= cSpiCore_Divisor;
                 spi_Write        <= '1';
--                 fStateNext       <= sSpiPrepareDeviceRequest1;                 -- IncludeIf_IsNanoboard
                 fStateNext       <= sSpiPrepareCommand;                        --  ExcludeIf_IsNanoboard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiPrepareDeviceRequest1 =>                                   -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeLowCsHigh;               -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiPrepareDeviceRequest2;                 -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiPrepareDeviceRequest2 =>                                   -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeLowCsHigh;               -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiPrepareDeviceRequest3;                 -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiPrepareDeviceRequest3 =>                                   -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeHighCsHigh;              -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiPrepareDeviceRequest4;                 -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiPrepareDeviceRequest4 =>                                   -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeHighCsHigh;              -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiSendDeviceRequest1;                    -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiSendDeviceRequest1 =>                                      -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Data;                      -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_DeviceRequest;                    -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiBusy;                                  -- IncludeIf_IsNanoBoard
--                 fReturnStateNext <= sSpiSendDeviceRequest2;                    -- IncludeIf_IsNanoBoard
--                 SaveReturnState  <= '1';                                       -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiSendDeviceRequest2 =>                                      -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeLowCsHigh;               -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiSendDeviceRequest3;                    -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiSendDeviceRequest3 =>                                      -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeLowCsHigh;               -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiSendDeviceRequest4;                    -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiSendDeviceRequest4 =>                                      -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeHighCsHigh;              -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiSendDeviceRequest5;                    -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiSendDeviceRequest5 =>                                      -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeHighCsHigh;              -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiGetDeviceRequestConfirmation;          -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiGetDeviceRequestConfirmation =>                            -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Data;                      -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_DeviceRequest;                    -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiBusy;                                  -- IncludeIf_IsNanoBoard
--                 fReturnStateNext <= sSpiDeviceRequestCheck;                    -- IncludeIf_IsNanoBoard
--                 SaveReturnState  <= '1';                                       -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiDeviceRequestCheck =>                                      -- IncludeIf_IsNanoBoard
--                 spi_Address  <= cSpiCore_RegAdr_Data;                          -- IncludeIf_IsNanoBoard
--                 spi_Read     <= '1';                                           -- IncludeIf_IsNanoBoard
--                 If (spi_ACK_I='1') Then                                        -- IncludeIf_IsNanoBoard
--                    If (spi_DAT_I(7 Downto 0) = x"FF") Then                     -- IncludeIf_IsNanoBoard
--                        fStateNext <= sSpiPrepareDeviceRequest1;                -- IncludeIf_IsNanoBoard
--                    Else                                                        -- IncludeIf_IsNanoBoard
--                        fStateNext <= sSpiPrepareDeviceSelect1;                 -- IncludeIf_IsNanoBoard
--                    End If;                                                     -- IncludeIf_IsNanoBoard
--                 End If;                                                        -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiPrepareDeviceSelect1 =>                                    -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeLowCsHigh;               -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiPrepareDeviceSelect2;                  -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiPrepareDeviceSelect2 =>                                    -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeLowCsHigh;               -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiPrepareDeviceSelect3;                  -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiPrepareDeviceSelect3 =>                                    -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeHighCsHigh;              -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiPrepareDeviceSelect4;                  -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiPrepareDeviceSelect4 =>                                    -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeHighCsHigh;              -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiDeviceSelect;                          -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiDeviceSelect =>                                            -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Data;                      -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiFlash_NanoboardIndex;                  -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiBusy;                                  -- IncludeIf_IsNanoBoard
--                 fReturnStateNext <= sSpiPrepareCommand1;                       -- IncludeIf_IsNanoBoard
--                 SaveReturnState  <= '1';                                       -- IncludeIf_IsNanoBoard
--            When sSpiPrepareCommand1 =>                                         -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeLowCsHigh;               -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiPrepareCommand2;                       -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiPrepareCommand2 =>                                         -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeLowCsHigh;               -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiPrepareCommand;                        -- IncludeIf_IsNanoBoard
            -- -----------------------------------------------------------------
            When sSpiPrepareCommand =>
                 spi_Address      <= cSpiCore_RegAdr_Control;
                 spi_Data         <= cSpiCore_Data_ModeLowSelectLowEnabled;
                 spi_Write        <= '1';
                 fStateNext       <= sSpiSendReadCommand;
            -- -----------------------------------------------------------------
            When sSpiSendReadCommand =>
                 spi_Address      <= cSpiCore_RegAdr_Data;
                 spi_Data         <= cSpiFlash_ReadCommand;
                 spi_Write        <= '1';
                 fStateNext       <= sSpiBusy;
                 fReturnStateNext <= sSpiSendCodeLocation1;
                 SaveReturnState  <= '1';
            -- -----------------------------------------------------------------
            When sSpiSendCodeLocation1 =>
                 spi_Address      <= cSpiCore_RegAdr_Data;
                 spi_Data         <= cCodeLocation_1;
                 spi_Write        <= '1';
                 fStateNext       <= sSpiBusy;
                 fReturnStateNext <= sSpiSendCodeLocation2;
                 SaveReturnState  <= '1';
            -- -----------------------------------------------------------------
            When sSpiSendCodeLocation2 =>
                 spi_Address      <= cSpiCore_RegAdr_Data;
                 spi_Data         <= cCodeLocation_2;
                 spi_Write        <= '1';
                 fStateNext       <= sSpiBusy;
                 fReturnStateNext <= sSpiSendCodeLocation3;
                 SaveReturnState  <= '1';
            -- -----------------------------------------------------------------
            When sSpiSendCodeLocation3 =>
                 spi_Address      <= cSpiCore_RegAdr_Data;
                 spi_Data         <= cCodeLocation_3;
                 spi_Write        <= '1';
                 fStateNext       <= sSpiBusy;
                 fReturnStateNext <= sSpiSendReceiveByte;
                 SaveReturnState  <= '1';
            -- -----------------------------------------------------------------
            When sSpiSendReceiveByte =>
                 spi_Address      <= cSpiCore_RegAdr_Data;
                 spi_Data         <= x"00";
                 spi_Write        <= '1';
                 fStateNext       <= sSpiBusy;
                 fReturnStateNext <= sSpiRegisterByte;
                 SaveReturnState  <= '1';
            -- -----------------------------------------------------------------
            When sSpiRegisterByte =>
                 SaveDataByte    <= '1';
                 If MemoryDone = '1' Then
--                     fStateNext <= sSpiChannelClosePrepare1;                    -- IncludeIf_IsNanoBoard
                     fStateNext <= sSpiCoreCleanup;                             --  ExcludeIf_IsNanoBoard
                 Else
                     fStateNext <= sSpiSendReceiveByte;
                 End If;
            -- -----------------------------------------------------------------
--            When sSpiChannelClosePrepare1 =>                                    -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeLowCsHigh;               -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiChannelClosePrepare2;                  -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiChannelClosePrepare2 =>                                    -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeLowCsHigh;               -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiChannelClosePrepare3;                  -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiChannelClosePrepare3 =>                                    -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeHighCsHigh;              -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiChannelClosePrepare4;                  -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiChannelClosePrepare4 =>                                    -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Control;                   -- IncludeIf_IsNanoBoard
--                 spi_Data         <= cSpiCore_Data_ModeHighCsHigh;              -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiChannelClose;                          -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
--            When sSpiChannelClose =>                                            -- IncludeIf_IsNanoBoard
--                 spi_Address      <= cSpiCore_RegAdr_Data;                      -- IncludeIf_IsNanoBoard
--                 spi_Data         <= x"00";                                     -- IncludeIf_IsNanoBoard
--                 spi_Write        <= '1';                                       -- IncludeIf_IsNanoBoard
--                 fStateNext       <= sSpiBusy;                                  -- IncludeIf_IsNanoBoard
--                 fReturnStateNext <= sSpiCoreCleanUp;                           -- IncludeIf_IsNanoBoard
--                 SaveReturnState  <= '1';                                       -- IncludeIf_IsNanoBoard
--            -- ------------------------------------------------------------------- IncludeIf_IsNanoBoard
            When sSpiCoreCleanUp =>
                 spi_Address      <= cSpiCore_RegAdr_Control;
                 spi_Data         <= cSpiCore_Data_CoreDefault;
                 spi_Write        <= '1';
                 fStateNext       <= sBootloaderFinished;
            -- -----------------------------------------------------------------
            When sSpiBusy =>
                 fStateNext <= sSpiBusyYouWish;
            -- -----------------------------------------------------------------
            When sSpiBusyYouWish =>
                spi_Address <= cSpiCore_RegAdr_Status;
                spi_Read    <= '1';
                If ( (spi_ACK_I='1') And (spi_DAT_I(cSpiCore_Flag_Busy) = '0') ) Then
                    fStateNext <= fReturnState;
                End If;
            -- -----------------------------------------------------------------
            When sBootloaderFinished =>
                If Start='0' Then fStateNext <= sIdle;
                             Else fStateNext <= sBootloaderFinished;
                End If;
            -- -----------------------------------------------------------------
            When Others =>
                 fStateNext <= sIdle;
            -- -----------------------------------------------------------------
        -- ---------------------------------------------------------------------
        End Case;
        -- ---------------------------------------------------------------------

    End Process;
    -- -------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    Process(CLK)
    Begin
        If Rising_Edge(CLK) Then
            If RST='1' Then
                fState       <= sIdle;
                fReturnState <= sIdle;
            Else
                fState <= fStateNext;
                If SaveReturnState='1' Then
                    fReturnState <= fReturnStateNext;
                End If;
            End If;
        End If;
    End Process;
    -- -------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    -- Wb Master 2 Spi
    spi_CLK_O <= CLK;
    spi_RST_O <= RST;
    spi_STB_O <= spi_Write Or spi_Read;
    spi_CYC_O <= spi_Write Or spi_Read;
    spi_ADR_O <= spi_Address;
    spi_DAT_O <= x"000000" & spi_Data;
    spi_WE_O  <= spi_Write;
    -- -------------------------------------------------------------------------


    -- Wb Master 2 Memory
    me_STB_O <= WishboneGo;
    me_CYC_O <= WishboneGo;
    me_ADR_O(31 Downto 2) <= WishboneAddress(31 - 2 Downto 0);
    me_ADR_O( 1 Downto 0) <= "00";
    me_DAT_O <= WishboneData;                                                                                                    -- ExcludeIf_LittleEndian
--    me_DAT_O <= WishboneData(7 downto 0) & WishboneData(15 downto 8) & WishboneData(23 downto 16) & WishboneData(31 downto 24);  -- ExcludeIf_BigEndian
    me_SEL_O <= x"F";
    me_WE_O  <= '1';
    me_CLK_O <= CLK;
    me_RST_O <= RST;

    -- -------------------------------------------------------------------------
    -- Wishbone Master Port - Memory
    -- -------------------------------------------------------------------------
    Process(CLK)
    Begin
        If Rising_Edge(CLK) THen
            If RST='1' Then
                ByteCounter     <= "100";
                WishboneAddress <= cCodeDestination;
                WishboneData    <= (Others=>'0');
                MemoryDone      <= '0';
            Else
                If SaveDataByte='1' Then
                    WishboneData <= WishboneData(23 Downto 0) & spi_DAT_I(7 Downto 0);
                    If ByteCounter="000" Then
                        ByteCounter <= "011";
                    Else
                        ByteCounter  <= ByteCounter - 1;
                    End If;
                End If;
                If WishboneAddressInc='1' Then
                    WishboneAddress <= WishboneAddress + 1;
                End If;

                If WishboneAddress = (cCodeDestination + cWordCount) Then
                    MemoryDone <= '1';
                End If;
            End If;
        End If;
    End Process;
    -- -------------------------------------------------------------------------
    IsByteCounterZero <= '1' When ByteCounter = "000"          Else '0';
    -- -------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    Process(fMeState, me_ACK_I, IsByteCounterZero)
    Begin
        fMeStateNext       <= fMeState;
        WishboneAddressInc <= '0';
        WishboneGo         <= '0';
        -- ---------------------------------------------------------------------
        Case fMeState Is
        -- ---------------------------------------------------------------------
            -- -----------------------------------------------------------------
            When sIdle =>
                 If IsByteCounterZero='1' Then
                    fMeStateNext <= sTransfer;
                 End If;
            -- -----------------------------------------------------------------
            When sTransfer =>
                 WishboneGo <= '1';
                 If me_ACK_I='1' Then
                    fMeStateNext <= sAddressIncrement;
                 End If;
            -- -----------------------------------------------------------------
            When sAddressIncrement =>
                 If IsByteCounterZero='0' Then
                    WishboneAddressInc <= '1';
                    fMeStateNext       <= sIdle;
                 End If;
            -- -----------------------------------------------------------------
            When Others =>
                fMeStateNext <= sIdle;
            -- -----------------------------------------------------------------
        -- ---------------------------------------------------------------------
        End Case;
        -- ---------------------------------------------------------------------
    End Process;
    -- -------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    Process(CLK)
    Begin
        If Rising_Edge(CLK) Then
            If RST='1' Then  fMeState <= sIdle;
                       Else  fMeState <= fMeStateNext;
            End If;
        End If;
    End Process;
    -- -------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
End RTL;
-- -----------------------------------------------------------------------------


-- -----------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
-- Top Level Netlist
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
Library IEEE;
Use     IEEE.Std_Logic_1164.All;
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
Entity Configurable_SPI_ABOOTLOADER Is
    Port (
        -- System
        CLK      : In  Std_Logic;
        RST      : In  Std_Logic;
        ENABLE   : In  Std_Logic;
        CPU_HOLD : Out Std_Logic;
        -- SPI
        SPI_DOUT : Out Std_Logic;
        SPI_DIN  : In  Std_Logic;
        SPI_CLK  : Out Std_Logic;
        SPI_MODE : Out Std_Logic;
        SPI_CS   : Out Std_Logic;
        -- CPU
        io_STB_I : In  Std_Logic;                                               -- ExcludeIf_NotSPIController
        io_CYC_I : In  Std_Logic;                                               -- ExcludeIf_NotSPIController
        io_ACK_O : Out Std_Logic;                                               -- ExcludeIf_NotSPIController
        io_ADR_I : In  Std_Logic_Vector( 2 Downto 0);                           -- ExcludeIf_NotSPIController
        io_DAT_O : Out Std_Logic_Vector(31 Downto 0);                           -- ExcludeIf_NotSPIController
        io_DAT_I : In  Std_Logic_Vector(31 Downto 0);                           -- ExcludeIf_NotSPIController
        io_WE_I  : In  Std_Logic;                                               -- ExcludeIf_NotSPIController
        io_CLK_I : In  Std_Logic;                                               -- ExcludeIf_NotSPIController
        io_RST_I : In  Std_Logic;                                               -- ExcludeIf_NotSPIController
        io_INT_O : Out Std_Logic;                                               -- ExcludeIf_NotSPIController
        -- Memory
        me_STB_O : Out Std_Logic;
        me_CYC_O : Out Std_Logic;
        me_ACK_I : In  Std_Logic;
        me_ADR_O : Out Std_Logic_Vector(31 Downto 0);
        me_DAT_I : In  Std_Logic_Vector(31 Downto 0);
        me_DAT_O : Out Std_Logic_Vector(31 Downto 0);
        me_SEL_O : Out Std_Logic_Vector(3 Downto 0);
        me_WE_O  : Out Std_Logic;
        me_CLK_O : Out Std_Logic;
        me_RST_O : Out Std_Logic
    );
End;
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
Architecture RTL Of Configurable_SPI_ABOOTLOADER Is
-- -----------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    Component WB_SPI8                                                           -- ExcludeIf_NotBootloaderV1
--    Component WB_SPI32                                                          -- ExcludeIf_NotBootloaderV2
        Port (
            CLK_I    : In  Std_Logic;
            RST_I    : In  Std_Logic;
            STB_I    : In  Std_Logic;
            CYC_I    : In  Std_Logic;
            ACK_O    : Out Std_Logic;
            ADR_I    : In  Std_Logic_Vector( 2 Downto 0);
            DAT_O    : Out Std_Logic_Vector(31 Downto 0);
            DAT_I    : In  Std_Logic_Vector(31 Downto 0);
            WE_I     : In  Std_Logic;

            SPI_DOUT : Out Std_Logic;
            SPI_DIN  : In  Std_Logic;
            SPI_CLK  : Out Std_Logic;
            SPI_CS   : Out Std_Logic;
            SPI_MODE : Out Std_Logic;

            SPI_IN0  : In  Std_Logic;
            SPI_IN1  : In  Std_Logic;
            SPI_IN2  : In  Std_Logic;
            SPI_IN3  : In  Std_Logic;
            SPI_IN4  : In  Std_Logic;
            SPI_IN5  : In  Std_Logic;
            SPI_IN6  : In  Std_Logic;
            SPI_IN7  : In  Std_Logic;

            SPI_CS0  : Out Std_Logic;
            SPI_CS1  : Out Std_Logic;
            SPI_CS2  : Out Std_Logic;
            SPI_CS3  : Out Std_Logic;
            SPI_CS4  : Out Std_Logic;
            SPI_CS5  : Out Std_Logic;
            SPI_CS6  : Out Std_Logic;
            SPI_CS7  : Out Std_Logic
        );
    End Component;
    -- -------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    Component BOOTLOADER_MASTER
        Port (
            -- System
            CLK       : In  Std_Logic;
            RST       : In  Std_Logic;
            ENABLE    : In  Std_Logic;
            CPU_HOLD  : Out Std_Logic;

            -- Wb Master 2 Spi
            spi_CLK_O : Out Std_Logic;
            spi_RST_O : Out Std_Logic;
            spi_STB_O : Out Std_Logic;
            spi_CYC_O : Out Std_Logic;
            spi_ACK_I : In  Std_Logic;
            spi_ADR_O : Out Std_Logic_Vector( 2 Downto 0);
            spi_DAT_O : Out Std_Logic_Vector(31 Downto 0);
            spi_DAT_I : In  Std_Logic_Vector(31 Downto 0);
            spi_WE_O  : Out Std_Logic;

            -- Wb Master 2 Memory
            me_STB_O : Out Std_Logic;
            me_CYC_O : Out Std_Logic;
            me_ACK_I : In  Std_Logic;
            me_ADR_O : Out Std_Logic_Vector(31 Downto 0);
            me_DAT_I : In  Std_Logic_Vector(31 Downto 0);
            me_DAT_O : Out Std_Logic_Vector(31 Downto 0);
            me_SEL_O : Out Std_Logic_Vector( 3 Downto 0);
            me_WE_O  : Out Std_Logic;
            me_CLK_O : Out Std_Logic;
            me_RST_O : Out Std_Logic
        );
    End Component;
    -- -------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    Signal Int_GND : Std_Logic;

--    Signal io_STB_I : Std_Logic;                                                -- ExcludeIf_SPIController
--    Signal io_CYC_I : Std_Logic;                                                -- ExcludeIf_SPIController
--    Signal io_ACK_O : Std_Logic;                                                -- ExcludeIf_SPIController
--    Signal io_ADR_I : Std_Logic_Vector( 2 Downto 0);                            -- ExcludeIf_SPIController
--    Signal io_DAT_O : Std_Logic_Vector(31 Downto 0);                            -- ExcludeIf_SPIController
--    Signal io_DAT_I : Std_Logic_Vector(31 Downto 0);                            -- ExcludeIf_SPIController
--    Signal io_WE_I  : Std_Logic;                                                -- ExcludeIf_SPIController
--    Signal io_CLK_I : Std_Logic;                                                -- ExcludeIf_SPIController
--    Signal io_RST_I : Std_Logic;                                                -- ExcludeIf_SPIController
--    Signal io_INT_O : Std_Logic;                                                -- ExcludeIf_SPIController

    Signal Int_io_CLK_I : Std_Logic;
    Signal Int_io_RST_I : Std_Logic;
    Signal Int_io_STB_I : Std_Logic;
    Signal Int_io_CYC_I : Std_Logic;
    Signal Int_io_ACK_O : Std_Logic;
    Signal Int_io_ADR_I : Std_Logic_Vector( 2 Downto 0);
    Signal Int_io_DAT_O : Std_Logic_Vector(31 Downto 0);
    Signal Int_io_DAT_I : Std_Logic_Vector(31 Downto 0);
    Signal Int_io_WE_I  : Std_Logic;

    Signal Int_Loader_Spi_CLK_O : Std_Logic;
    Signal Int_Loader_Spi_RST_O : Std_Logic;
    Signal Int_Loader_Spi_STB_O : Std_Logic;
    Signal Int_Loader_Spi_CYC_O : Std_Logic;
    Signal Int_Loader_Spi_ACK_I : Std_Logic;
    Signal Int_Loader_Spi_ADR_O : Std_Logic_Vector( 2 Downto 0);
    Signal Int_Loader_Spi_DAT_O : Std_Logic_Vector(31 Downto 0);
    Signal Int_Loader_Spi_DAT_I : Std_Logic_Vector(31 Downto 0);
    Signal Int_Loader_Spi_WE_O  : Std_Logic;

    Signal Int_Loader_CPu_Hold : Std_Logic;
    -- -------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
Begin
-- -----------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    -- SPI Controller
    -- -------------------------------------------------------------------------
    U_SPI_CONTROLLER : WB_SPI8  Port Map (                                      -- ExcludeIf_NotBootloaderV1
--    U_SPI_CONTROLLER : WB_SPI32 Port Map (                                      -- ExcludeIf_NotBootloaderV2
            CLK_I    => Int_io_CLK_I,
            RST_I    => Int_io_RST_I,
            STB_I    => Int_io_STB_I,
            CYC_I    => Int_io_CYC_I,
            ACK_O    => Int_io_ACK_O,
            ADR_I    => Int_io_ADR_I,
            DAT_O    => Int_io_DAT_O,
            DAT_I    => Int_io_DAT_I,
            WE_I     => Int_io_WE_I,
            SPI_DOUT => SPI_DOUT,
            SPI_DIN  => SPI_DIN,
            SPI_CLK  => SPI_CLK,
            SPI_CS   => SPI_CS,
            SPI_MODE => SPI_MODE,
            SPI_IN0  => Int_Gnd,
            SPI_IN1  => Int_Gnd,
            SPI_IN2  => Int_Gnd,
            SPI_IN3  => Int_Gnd,
            SPI_IN4  => Int_Gnd,
            SPI_IN5  => Int_Gnd,
            SPI_IN6  => Int_Gnd,
            SPI_IN7  => Int_Gnd,
            SPI_CS0  => Open,
            SPI_CS1  => Open,
            SPI_CS2  => Open,
            SPI_CS3  => Open,
            SPI_CS4  => Open,
            SPI_CS5  => Open,
            SPI_CS6  => Open,
            SPI_CS7  => Open
    );
    -- -------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    -- SPI Flash Bootloader Controller
    -- -------------------------------------------------------------------------
    U_BOOTLOADER : BOOTLOADER_MASTER Port Map (
        -- System
        CLK      => CLK,
        RST      => RST,
        ENABLE   => ENABLE,
        CPU_HOLD => Int_Loader_Cpu_Hold,

        -- Wb Master 2 Spi
        spi_CLK_O => Int_Loader_Spi_CLK_O,
        spi_RST_O => Int_Loader_Spi_RST_O,
        spi_STB_O => Int_Loader_Spi_STB_O,
        spi_CYC_O => Int_Loader_Spi_CYC_O,
        spi_ACK_I => Int_Loader_Spi_ACK_I,
        spi_ADR_O => Int_Loader_Spi_ADR_O,
        spi_DAT_O => Int_Loader_Spi_DAT_O,
        spi_DAT_I => Int_Loader_Spi_DAT_I,
        spi_WE_O  => Int_Loader_Spi_WE_O,

        -- Wb Master 2 Memory
        me_STB_O => me_STB_O,
        me_CYC_O => me_CYC_O,
        me_ACK_I => me_ACK_I,
        me_ADR_O => me_ADR_O,
        me_DAT_I => me_DAT_I,
        me_DAT_O => me_DAT_O,
        me_SEL_O => me_SEL_O,
        me_WE_O  => me_WE_O,
        me_CLK_O => me_CLK_O,
        me_RST_O => me_RST_O
    );
    -- -------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    CPU_HOLD <= Int_Loader_Cpu_Hold;
    Int_GND  <= '0';
    -- -------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    Int_io_CLK_I <= CLK;
    Int_io_RST_I <= RST;

--    io_STB_I <= '0';                                                             -- ExcludeIf_SPIController
--    io_CYC_I <= '0';                                                             -- ExcludeIf_SPIController
--    io_ADR_I <= (Others=>'0');                                                   -- ExcludeIf_SPIController
--    io_DAT_I <= (Others=>'0');                                                   -- ExcludeIf_SPIController
--    io_WE_I  <= '0';                                                             -- ExcludeIf_SPIController
--    io_DAT_O <= Int_io_DAT_O;                                                    -- ExcludeIf_SPIController
--    io_ACK_O <= '0';                                                             -- ExcludeIf_SPIController

    Int_io_STB_I <= Int_Loader_Spi_STB_O When Int_Loader_CPu_Hold='1' Else io_STB_I;
    Int_io_CYC_I <= Int_Loader_Spi_CYC_O When Int_Loader_Cpu_Hold='1' Else io_CYC_I;
    Int_io_ADR_I <= Int_Loader_Spi_ADR_O When Int_Loader_Cpu_Hold='1' Else io_ADR_I;
    Int_io_DAT_I <= Int_Loader_Spi_DAT_O When Int_Loader_Cpu_Hold='1' Else io_DAT_I;
    Int_io_WE_I  <= Int_Loader_Spi_WE_O  When Int_Loader_Cpu_Hold='1' Else io_WE_I;

    Int_Loader_Spi_DAT_I <= Int_io_DAT_O;
    Int_Loader_Spi_ACK_I <= Int_io_ACK_O;
    -- -------------------------------------------------------------------------
    io_DAT_O <= Int_io_DAT_O;    -- ExcludeIf_NotSPIController
    io_ACK_O <= Int_io_ACK_O;    -- ExcludeIf_NotSPIController
    io_INT_O <= '0';             -- ExcludeIf_NotSPIController

-- -----------------------------------------------------------------------------
End RTL;
-- -----------------------------------------------------------------------------



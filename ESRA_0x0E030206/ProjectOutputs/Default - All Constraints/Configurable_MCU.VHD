--------------------------------------------------------------------------------
Library IEEE;
Use IEEE.Std_Logic_1164.all;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Template for construction of the top level of a TSK3000 implementation.
--
-- The things that will be changed by the component configurator are:
--   1. The size of the boot memory. This will simply vary the address width.
--   2. The model of the MDU.
--   3. The model of the shifter.
--   4. The inclusion of the OCDS - the debug system.
--   5. Whether or not to expose the Debug Signals
--   6. Then number of interrupt signals and what type of pin they use
--------------------------------------------------------------------------------
Entity Configurable_MCU Is
  Port
  (
    ----------------------------------------------------------------------------
    CLK_I          : In    Std_Logic;
    RST_I          : In    Std_Logic;
    RST_O          : Out   Std_Logic;
    INT_I          : In    Std_Logic_Vector(31 DownTo 0);                             -- IncludeIf_Interrupts_32
--    INT_I          : In    Std_Logic_Vector(32-1 DownTo 0);   -- IncludeIf_Interrupts_Many
--    INT_I          : In    Std_Logic;                                                 -- IncludeIf_Interrupts_One
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    TRACEPC        : Out   Std_Logic_Vector(31 DownTo 0);
    TRACESP        : Out   Std_Logic_Vector(31 DownTo 0);
    TRACERUN       : Out   Std_Logic;
    DEBUGSTATUSB   : Out   Std_Logic_Vector(15 DownTo 0);
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    -- Leave these Out if not including OCDS Unit
    TCK            : In    Std_Logic;                         -- IncludeIf_OCDS
    TDI            : In    Std_Logic;                         -- IncludeIf_OCDS
    TDO            : Out   Std_Logic;                         -- IncludeIf_OCDS
    TMS            : In    Std_Logic;                         -- IncludeIf_OCDS
    TRST           : In    Std_Logic;                         -- IncludeIf_OCDS
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    IO_ACK_I       : In    Std_Logic;
    IO_ADR_O       : Out   Std_Logic_Vector(23 DownTo 0);
    IO_CYC_O       : Out   Std_Logic;
    IO_DAT_I       : In    Std_Logic_Vector(31 DownTo 0);
    IO_DAT_O       : Out   Std_Logic_Vector(31 DownTo 0);
    IO_SEL_O       : Out   Std_Logic_Vector( 3 DownTo 0);
    IO_STB_O       : Out   Std_Logic;
    IO_WE_O        : Out   Std_Logic;
    IO_CLK_O       : Out   Std_Logic;
    IO_RST_O       : Out   Std_Logic;
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    ME_ACK_I       : In    Std_Logic;
    ME_ADR_O       : Out   Std_Logic_Vector(31 DownTo 0);
    ME_CYC_O       : Out   Std_Logic;
    ME_DAT_I       : In    Std_Logic_Vector(31 DownTo 0);
    ME_DAT_O       : Out   Std_Logic_Vector(31 DownTo 0);
    ME_SEL_O       : Out   Std_Logic_Vector( 3 DownTo 0);
    ME_STB_O       : Out   Std_Logic;
    ME_WE_O        : Out   Std_Logic;
    ME_CLK_O       : Out   Std_Logic;
    ME_RST_O       : Out   Std_Logic
    ----------------------------------------------------------------------------

  );
End Configurable_MCU;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Architecture Structure Of Configurable_MCU Is
--Constant 14 : Integer := 10;
   Constant cBreakInstruction : Std_Logic_Vector(31 Downto 0) := x"0000000D";
   -----------------------------------------------------------------------------
   Component TSK3000A_MCU_HCB
      Port
      (
        CLK_I              : In  Std_Logic;
        RST_I              : In  Std_Logic;
        RST_O              : Out Std_Logic;
        INT_I              : In  Std_Logic_Vector(31 DownTo 0);

        DBOOT_ADR_O        : Out Std_Logic_Vector(21 DownTo 0);
        DBOOT_DAT_I        : In  Std_Logic_Vector(31 DownTo 0);
        DBOOT_DAT_O        : Out Std_Logic_Vector(31 DownTo 0);
        DBOOT_SEL_O        : Out Std_Logic_Vector( 3 DownTo 0);
        DBOOT_STB_O        : Out Std_Logic;
        DBOOT_WE_O         : Out Std_Logic;

        IBOOT_ADR_O        : Out Std_Logic_Vector(21 DownTo 0);
        IBOOT_DAT_I        : In  Std_Logic_Vector(31 DownTo 0);
        IBOOT_STB_O        : Out Std_Logic;

        IO_ACK_I           : In  Std_Logic;
        IO_ADR_O           : Out Std_Logic_Vector(23 DownTo 0);
        IO_CYC_O           : Out Std_Logic;
        IO_DAT_I           : In  Std_Logic_Vector(31 DownTo 0);
        IO_DAT_O           : Out Std_Logic_Vector(31 DownTo 0);
        IO_SEL_O           : Out Std_Logic_Vector( 3 DownTo 0);
        IO_STB_O           : Out Std_Logic;
        IO_WE_O            : Out Std_Logic;

        MAIN_ACK_I         : In  Std_Logic;
        MAIN_ADR_O         : Out Std_Logic_Vector(31 DownTo 0);
        MAIN_CYC_O         : Out Std_Logic;
        MAIN_DAT_I         : In  Std_Logic_Vector(31 DownTo 0);
        MAIN_DAT_O         : Out Std_Logic_Vector(31 DownTo 0);
        MAIN_SEL_O         : Out Std_Logic_Vector( 3 DownTo 0);
        MAIN_STB_O         : Out Std_Logic;
        MAIN_WE_O          : Out Std_Logic;
        DEBUG_INST_FETCH   : Out Std_Logic;

        DEBUGSTATUSB       : Out Std_Logic_Vector(15 DownTo 0);

        RUNNING            : Out Std_Logic;
        INTERRUPT          : Out Std_Logic;
        DEBUGACK           : Out Std_Logic;
        DEBUGENABLE        : In  Std_Logic;
        DEBUGPROG          : In  Std_Logic;
        DEBUGHALT          : In  Std_Logic;
        DEBUGSTEP          : In  Std_Logic;
        DEBUGRESET         : In  Std_Logic;
        DEBUGDATA_I        : In  Std_Logic_Vector(31 DownTo 0);
        DEBUGDATA_O        : Out Std_Logic_Vector(31 DownTo 0);
        DEBUGDATA_WRITE    : In  Std_Logic;
        ISUBSTITUTE        : In  Std_Logic_Vector(31 DownTo 0);
        PC                 : Out Std_Logic_Vector(31 DownTo 0);
        SP                 : Out Std_Logic_Vector(31 DownTo 0);

        MDU_DATAA          : Out Std_Logic_Vector(31 DownTo 0);
        MDU_DATAB          : Out Std_Logic_Vector(31 DownTo 0);
        MDU_RESULT         : In  Std_Logic_Vector(31 DownTo 0);
        MDU_MODE           : Out Std_Logic_Vector( 4 DownTo 0);
        MDU_PAUSE          : In  Std_Logic;
        MDU_RESET          : Out Std_Logic;

        SHIFT_DATA         : Out Std_Logic_Vector(31 DownTo 0);
        SHIFT_AMOUNT       : Out Std_Logic_Vector( 4 DownTo 0);
        SHIFT_RESULT       : In  Std_Logic_Vector(31 DownTo 0);
        SHIFT_MODE         : Out Std_Logic_Vector( 3 DownTo 0);
        SHIFT_PAUSE        : In  Std_Logic;
        SHIFT_RESET        : Out Std_Logic;

        CUSTOM_DATAA       : Out Std_Logic_Vector(31 DownTo 0);
        CUSTOM_DATAB       : Out Std_Logic_Vector(31 DownTo 0);
        CUSTOM_RESULT      : In  Std_Logic_Vector(31 DownTo 0);
        CUSTOM_MODE        : Out Std_Logic_Vector( 7 DownTo 0);
        CUSTOM_PAUSE       : In  Std_Logic;
        CUSTOM_RESET       : Out Std_Logic
      );
   End Component;
   -----------------------------------------------------------------------------

   -----------------------------------------------------------------------------
   Component TSK3000A_OCDS_HCB
      Port
      (
        CLK                 : In    Std_Logic;
        RESET               : In    Std_Logic;

        DEBUGACK            : In    Std_Logic;
        DEBUGENABLE         : Out   Std_Logic;
        DEBUGPROG           : Out   Std_Logic;
        DEBUGHALT           : Out   Std_Logic;
        DEBUGSTEP           : Out   Std_Logic;
        DEBUGWHENRESET      : In    Std_Logic;

        TCK                 : In    Std_Logic;
        TDI                 : In    Std_Logic;
        TDO                 : Out   Std_Logic;
        TMS                 : In    Std_Logic;
        TRST                : In    Std_Logic;

        PC                  : In    Std_Logic_Vector(31 DownTo 0);

        DEBUGRESET          : Out   Std_Logic;
        DEBUGDATA_I         : In    Std_Logic_Vector(31 DownTo 0);
        DEBUGDATA_O         : Out   Std_Logic_Vector(31 DownTo 0);
        DEBUGDATA_WRITE     : Out   Std_Logic;
        ISUBSTITUTE         : Out   Std_Logic_Vector(31 DownTo 0);
        DEBUG_INST_FETCH    : In    Std_Logic;
        HCB_CPU_WE_I        : In    Std_Logic;
        HCB_CPU_CYC_I       : In    Std_Logic;
        HCB_ADDR_I          : In    Std_Logic_Vector(31 Downto 0);
        HCB_INSTRSUBSTITUTE : Out   Std_Logic
   );
   End Component;
   -----------------------------------------------------------------------------

   -----------------------------------------------------------------------------
   Component TSK3000A_MDU                             -- IncludeIf_MDU
      Port                                               -- IncludeIf_MDU
      (                                                  -- IncludeIf_MDU
        CLK    : In  Std_Logic;                          -- IncludeIf_MDU
        RESET  : In  Std_Logic;                          -- IncludeIf_MDU
        DATAA  : In  Std_Logic_Vector(31 DownTo 0);      -- IncludeIf_MDU
        DATAB  : In  Std_Logic_Vector(31 DownTo 0);      -- IncludeIf_MDU
        RESULT : Out Std_Logic_Vector(31 DownTo 0);      -- IncludeIf_MDU
        BUSY   : Out Std_Logic;                          -- IncludeIf_MDU
        MODE   : In  Std_Logic_Vector(4 DownTo 0)        -- IncludeIf_MDU
      );                                                 -- IncludeIf_MDU
   End Component;                                        -- IncludeIf_MDU
   -----------------------------------------------------------------------------

   -----------------------------------------------------------------------------
   Component TSK3000A_Shift_Barrel
      Port
      (
        CLK     : In  Std_Logic;
        RESET   : In  Std_Logic;
        DATA    : In  Std_Logic_Vector(31 DownTo 0);
        AMOUNT  : In  Std_Logic_Vector( 4 DownTo 0);
        RESULT  : Out Std_Logic_Vector(31 DownTo 0);
        BUSY    : Out Std_Logic;
        MODE    : In  Std_Logic_Vector( 3 DownTo 0)
   );
   End Component;
   -----------------------------------------------------------------------------

   -----------------------------------------------------------------------------
   Constant  BootAddressWidth : Integer := 14;
   Component Memory_MCU
      Port
      (
        PDONE   : Out Std_Logic;
        ADDRA   : In  Std_Logic_Vector(BootAddressWidth-1 DownTo 0);
        ADDRB   : In  Std_Logic_Vector(BootAddressWidth-1 DownTo 0);
        BYTEWEA : In  Std_Logic_Vector(3 DownTo 0);
        BYTEWEB : In  Std_Logic_Vector(3 DownTo 0);
        CLKA    : In  Std_Logic;
        CLKB    : In  Std_Logic;
        DINA    : In  Std_Logic_Vector(31 DownTo 0);
        DINB    : In  Std_Logic_Vector(31 DownTo 0);
        DOUTA   : Out Std_Logic_Vector(31 DownTo 0);
        DOUTB   : Out Std_Logic_Vector(31 DownTo 0);
        ENA     : In  Std_Logic;
        ENB     : In  Std_Logic;
        WEA     : In  Std_Logic;
        WEB     : In  Std_Logic
      );
   End Component;
   -----------------------------------------------------------------------------

   -----------------------------------------------------------------------------
   Signal Signal_MDU_DataA          : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_MDU_DataB          : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_MDU_Result         : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_MDU_Mode           : Std_Logic_Vector( 4 DownTo 0);
   Signal Signal_MDU_Pause          : Std_Logic;
   Signal Signal_MDU_Reset          : Std_Logic;

   Signal Signal_Shift_Data         : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_Shift_Amount       : Std_Logic_Vector( 4 DownTo 0);
   Signal Signal_Shift_Result       : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_Shift_Mode         : Std_Logic_Vector( 3 DownTo 0);
   Signal Signal_Shift_Pause        : Std_Logic;
   Signal Signal_Shift_Reset        : Std_Logic;

   Signal Signal_Custom_DataA       : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_Custom_DataB       : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_Custom_Result      : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_Custom_Mode        : Std_Logic_Vector( 7 DownTo 0);
   Signal Signal_Custom_Pause       : Std_Logic;
   Signal Signal_Custom_Reset       : Std_Logic;

   Signal Signal_Boot_PDONE         : Std_Logic;                                    
   
   Signal Signal_Boot_DOUTA         : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_Boot_DOUTB         : Std_Logic_Vector(31 DownTo 0);

   Signal Signal_DBoot_ADR_O        : Std_Logic_Vector(21 DownTo 0);
   Signal Signal_DBoot_DAT_O        : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_DBoot_SEL_O        : Std_Logic_Vector( 3 DownTo 0);
   Signal Signal_DBoot_STB_O        : Std_Logic;
   Signal Signal_DBoot_WE_O         : Std_Logic;

   Signal Signal_IBoot_ADR_O        : Std_Logic_Vector(21 DownTo 0);
   Signal Signal_IBoot_STB_O        : Std_Logic;

   Signal Signal_GND                : Std_Logic;
   Signal Signal_GND32              : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_GND4               : Std_Logic_Vector( 3 DownTo 0);

   Signal Signal_DebugAck           : Std_Logic;
   Signal Signal_DebugEnable        : Std_Logic;
   Signal Signal_DebugProg          : Std_Logic;
   Signal Signal_DebugHalt          : Std_Logic;
   Signal Signal_DebugStep          : Std_Logic;

   Signal Signal_DebugReset         : Std_Logic;
   Signal Signal_DebugData_FromMCU  : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_DebugData_FromOCDS : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_DebugData_Write    : Std_Logic;
   Signal Signal_ISubstitute        : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_PC                 : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_SP                 : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_Running            : Std_Logic;
   Signal Signal_Interrupt          : Std_Logic;
   Signal Signal_ResetHard          : Std_Logic;
   Signal Signal_Reset              : Std_Logic;

   Signal Signal_Interrupts         : Std_Logic_Vector(31 DownTo 0);
   Signal Signal_DebugWhenReset     : Std_Logic;                                -- IncludeIf_OCDS

   Signal ME_CYC_O_Sig             : Std_Logic;
   Signal ME_WE_O_Sig              : Std_Logic;
   Signal ME_ADR_O_Sig             : Std_Logic_Vector(31 Downto 0);
   Signal HardBreakPointSubstitute : Std_Logic;
   Signal ME_DAT_I_Sig             : Std_Logic_Vector(31 Downto 0);
   Signal DebugInstFetch           : Std_Logic;

Begin
    ----------------------------------------------------------------------------
    SubPart_MCU : TSK3000A_MCU_HCB
    Port Map
    (
        CLK_I              => CLK_I,
        RST_I              => Signal_Reset,
        RST_O              => Signal_ResetHard,
        INT_I              => Signal_Interrupts,
        RUNNING            => Signal_Running,
        INTERRUPT          => Signal_Interrupt,
     -- Connections to OCDS if it is included
        DEBUGACK           => Signal_DebugAck,              -- IncludeIf_OCDS
        DEBUGENABLE        => Signal_DebugEnable,           -- IncludeIf_OCDS
        DEBUGPROG          => Signal_DebugProg,             -- IncludeIf_OCDS
        DEBUGHALT          => Signal_DebugHalt,             -- IncludeIf_OCDS
        DEBUGSTEP          => Signal_DebugStep,             -- IncludeIf_OCDS
        DEBUGRESET         => Signal_DebugReset,            -- IncludeIf_OCDS
        DEBUGDATA_I        => Signal_DebugData_FromOCDS,    -- IncludeIf_OCDS
        DEBUGDATA_O        => Signal_DebugData_FromMCU,     -- IncludeIf_OCDS
        DEBUGDATA_WRITE    => Signal_DebugData_Write,       -- IncludeIf_OCDS
        ISUBSTITUTE        => Signal_ISubstitute,           -- IncludeIf_OCDS
        PC                 => Signal_PC,
        SP                 => Signal_SP,

        DEBUGSTATUSB       => DebugStatusB,

--     -- Connections to OCDS if its is excluded (only inputs)-- ExcludeIf_OCDS
--        DEBUGENABLE        => Signal_GND,                   -- ExcludeIf_OCDS
--        DEBUGPROG          => Signal_GND,                   -- ExcludeIf_OCDS
--        DEBUGHALT          => Signal_GND,                   -- ExcludeIf_OCDS
--        DEBUGSTEP          => Signal_GND,                   -- ExcludeIf_OCDS
--        DEBUGRESET         => Signal_GND,                   -- ExcludeIf_OCDS
--        DEBUGDATA_I        => Signal_GND32,                 -- ExcludeIf_OCDS
--        DEBUGDATA_WRITE    => Signal_GND,                   -- ExcludeIf_OCDS
--        ISUBSTITUTE        => Signal_GND32,                 -- ExcludeIf_OCDS

     -- Connections to MDU if its is included               -- IncludeIf_MDU
        MDU_DATAA          => Signal_MDU_DataA,             -- IncludeIf_MDU
        MDU_DATAB          => Signal_MDU_DataB,             -- IncludeIf_MDU
        MDU_RESULT         => Signal_MDU_Result,            -- IncludeIf_MDU
        MDU_MODE           => Signal_MDU_Mode,              -- IncludeIf_MDU
        MDU_PAUSE          => Signal_MDU_Pause,             -- IncludeIf_MDU
        MDU_RESET          => Signal_MDU_Reset,             -- IncludeIf_MDU

--     -- Connections to MDU if its is excluded               -- ExcludeIf_MDU
--        MDU_RESULT         => Signal_GND32,                 -- ExcludeIf_MDU
--        MDU_PAUSE          => Signal_GND,                   -- ExcludeIf_MDU

        SHIFT_DATA         => Signal_Shift_Data,
        SHIFT_AMOUNT       => Signal_Shift_Amount,
        SHIFT_RESULT       => Signal_Shift_Result,
        SHIFT_MODE         => Signal_Shift_Mode,
        SHIFT_PAUSE        => Signal_Shift_Pause,
        SHIFT_RESET        => Signal_Shift_Reset,

        CUSTOM_DATAA       => Signal_Custom_DataA,
        CUSTOM_DATAB       => Signal_Custom_DataB,
        CUSTOM_RESULT      => Signal_Custom_Result,
        CUSTOM_MODE        => Signal_Custom_Mode,
        CUSTOM_PAUSE       => Signal_Custom_Pause,
        CUSTOM_RESET       => Signal_Custom_Reset,

        DBOOT_ADR_O        => Signal_DBoot_ADR_O,
        DBOOT_DAT_I        => Signal_Boot_DOUTB,
        DBOOT_DAT_O        => Signal_DBoot_DAT_O,
        DBOOT_SEL_O        => Signal_DBoot_SEL_O,
        DBOOT_STB_O        => Signal_DBoot_STB_O,
        DBOOT_WE_O         => Signal_DBoot_WE_O,

        IBOOT_ADR_O        => Signal_IBoot_ADR_O,
        IBOOT_DAT_I        => Signal_Boot_DOUTA,
        IBOOT_STB_O        => Signal_IBoot_STB_O,

        IO_ACK_I           => IO_ACK_I,
        IO_ADR_O           => IO_ADR_O,
        IO_CYC_O           => IO_CYC_O,
        IO_DAT_I           => IO_DAT_I,
        IO_DAT_O           => IO_DAT_O,
        IO_SEL_O           => IO_SEL_O,
        IO_STB_O           => IO_STB_O,
        IO_WE_O            => IO_WE_O ,

        DEBUG_INST_FETCH   => DebugInstFetch,
        MAIN_ACK_I         => ME_ACK_I,
        MAIN_ADR_O         => ME_ADR_O_Sig,
        MAIN_CYC_O         => ME_CYC_O_Sig,
        MAIN_DAT_I         => ME_DAT_I_Sig,
        MAIN_DAT_O         => ME_DAT_O,
        MAIN_SEL_O         => ME_SEL_O,
        MAIN_STB_O         => ME_STB_O,
        MAIN_WE_O          => ME_WE_O_Sig
    );
    ----------------------------------------------------------------------------
    ME_CYC_O     <= ME_CYC_O_Sig;
    ME_WE_O      <= ME_WE_O_Sig;
    ME_ADR_O     <= ME_ADR_O_Sig;
    ME_DAT_I_Sig <= ME_DAT_I When HardBreakPointSubstitute='0' Else cBreakInstruction; --IncludeIf_OCDS
--	ME_DAT_I_Sig <= ME_DAT_I;                                                          --ExcludeIf_OCDS
    ----------------------------------------------------------------------------
    SubPart_OCDS : TSK3000A_OCDS_HCB                       -- IncludeIf_OCDS
    Port Map                                              -- IncludeIf_OCDS
    (                                                     -- IncludeIf_OCDS
        CLK                 => CLK_I,                     -- IncludeIf_OCDS
        RESET               => Signal_ResetHard,          -- IncludeIf_OCDS
                                                          -- IncludeIf_OCDS
        TCK                 => TCK,                       -- IncludeIf_OCDS
        TDI                 => TDI,                       -- IncludeIf_OCDS
        TDO                 => TDO,                       -- IncludeIf_OCDS
        TMS                 => TMS,                       -- IncludeIf_OCDS
        TRST                => TRST,                      -- IncludeIf_OCDS
                                                          -- IncludeIf_OCDS
        DEBUGWHENRESET      => Signal_DebugWhenReset,     -- IncludeIf_OCDS
        DEBUGACK            => Signal_DebugAck,           -- IncludeIf_OCDS
        DEBUGENABLE         => Signal_DebugEnable,        -- IncludeIf_OCDS
        DEBUGPROG           => Signal_DebugProg,          -- IncludeIf_OCDS
        DEBUGHALT           => Signal_DebugHalt,          -- IncludeIf_OCDS
        DEBUGSTEP           => Signal_DebugStep,          -- IncludeIf_OCDS
        DEBUGRESET          => Signal_DebugReset,         -- IncludeIf_OCDS
        DEBUGDATA_I         => Signal_DebugData_FromMCU,  -- IncludeIf_OCDS
        DEBUGDATA_O         => Signal_DebugData_FromOCDS, -- IncludeIf_OCDS
        DEBUGDATA_WRITE     => Signal_DebugData_Write,    -- IncludeIf_OCDS
        ISUBSTITUTE         => Signal_ISubstitute,        -- IncludeIf_OCDS
        HCB_CPU_WE_I        => ME_WE_O_Sig,               -- IncludeIf_OCDS
        HCB_CPU_CYC_I       => ME_CYC_O_Sig,              -- IncludeIf_OCDS
        HCB_ADDR_I          => ME_ADR_O_Sig,              -- IncludeIf_OCDS
        HCB_INSTRSUBSTITUTE => HardBreakPointSubstitute,  -- IncludeIf_OCDS
        DEBUG_INST_FETCH    => DebugInstFetch,            -- IncludeIf_OCDS
                                                          -- IncludeIf_OCDS
        PC                  => Signal_PC                  -- IncludeIf_OCDS
    );                                                    -- IncludeIf_OCDS
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    SubPart_MDU : TSK3000A_MDU                        -- IncludeIf_MDU
    Port Map                                             -- IncludeIf_MDU
    (                                                    -- IncludeIf_MDU
        CLK    => CLK_I,                                 -- IncludeIf_MDU
        DATAA  => Signal_MDU_DataA,                      -- IncludeIf_MDU
        DATAB  => Signal_MDU_DataB,                      -- IncludeIf_MDU
        RESULT => Signal_MDU_Result,                     -- IncludeIf_MDU
        MODE   => Signal_MDU_Mode,                       -- IncludeIf_MDU
        BUSY   => Signal_MDU_Pause,                      -- IncludeIf_MDU
        RESET  => Signal_MDU_Reset                       -- IncludeIf_MDU
    );                                                   -- IncludeIf_MDU
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    SubPart_Shifter : TSK3000A_Shift_Barrel
    Port Map
    (
        CLK    => CLK_I,
        DATA   => Signal_Shift_Data,
        AMOUNT => Signal_Shift_Amount,
        RESULT => Signal_Shift_Result,
        MODE   => Signal_Shift_Mode,
        BUSY   => Signal_Shift_Pause,
        RESET  => Signal_Shift_Reset
    );
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    SubPart_BootMemory : Memory_MCU
    Port Map
    (
        PDONE   => Signal_Boot_PDONE,
        ADDRA   => Signal_IBOOT_ADR_O(BootAddressWidth-1 DownTo 0),
        ADDRB   => Signal_DBOOT_ADR_O(BootAddressWidth-1 DownTo 0),
        BYTEWEA => Signal_GND4,
        BYTEWEB => Signal_DBoot_SEL_O,
        CLKA    => CLK_I,
        CLKB    => CLK_I,
        DINA    => Signal_GND32,
        DINB    => Signal_DBoot_DAT_O,
        DOUTA   => Signal_Boot_DOUTA,
        DOUTB   => Signal_Boot_DOUTB,
        ENA     => Signal_IBoot_STB_O,
        ENB     => Signal_DBoot_STB_O,
        WEA     => Signal_GND,
        WEB     => Signal_DBoot_WE_O
    );
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    Signal_GND4          <= (Others => '0');
    Signal_GND32         <= (Others => '0');
    Signal_GND           <= '0';
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    RST_O                <= Signal_ResetHard;
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    TraceSP              <= Signal_SP;
    TracePC              <= Signal_Interrupt & Signal_PC(30 DownTo 0);
    TraceRun             <= Signal_Running;
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    ME_CLK_O             <= CLK_I;
    IO_CLK_O             <= CLK_I;

    ME_RST_O             <= Signal_ResetHard;
    IO_RST_O             <= Signal_ResetHard;
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    Signal_Custom_Result <= (Others => '0');
    Signal_Custom_Pause  <= '0';
    ----------------------------------------------------------------------------

    Signal_Interrupts  <= INT_I;                                                                                               -- IncludeIf_Interrupts_32
--    Signal_Interrupts  <= Signal_GND32(31 DownTo 32) & INT_I(32 -1 DownTo 0);  -- IncludeIf_Interrupts_Many
--    Signal_Interrupts  <= Signal_GND32(31 DownTo  1) & INT_I;                                                                  -- IncludeIf_Interrupts_One

    Signal_DebugWhenReset <= '0';                                                                     -- IncludeIf_OCDS

    Signal_Reset <= Not Signal_Boot_PDONE Or RST_I;

End Structure;
--------------------------------------------------------------------------------


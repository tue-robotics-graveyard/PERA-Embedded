------------------------------------------------------------
-- VHDL System
-- 2014 12 4 15 6 39
-- Created By "Altium Designer VHDL Generator"
-- "Copyright (c) 2002-2014 Altium Limited"
-- Product Version: 14.3.15.35511
------------------------------------------------------------

------------------------------------------------------------
-- VHDL System
------------------------------------------------------------

Library IEEE;
Use     IEEE.std_logic_1164.all;

Entity System Is
  port
  (
    ADC_1_DATA_I     : In    STD_LOGIC_VECTOR(15 DOWNTO 0);  -- ObjectKind=Port|PrimaryId=ADC_1_DATA_I[15..0]
    CLK_I            : In    STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=CLK_I
    DAC_1_SPI_CLK    : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=DAC_1_SPI_CLK
    DAC_1_SPI_CS     : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=DAC_1_SPI_CS
    DAC_1_SPI_DIN    : In    STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=DAC_1_SPI_DIN
    DAC_1_SPI_DOUT   : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=DAC_1_SPI_DOUT
    EC_1_SPI_CLK     : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=EC_1_SPI_CLK
    EC_1_SPI_CS      : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=EC_1_SPI_CS
    EC_1_SPI_DIN     : In    STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=EC_1_SPI_DIN
    EC_1_SPI_DOUT    : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=EC_1_SPI_DOUT
    ENC_1_C_I        : In    STD_LOGIC_VECTOR(15 DOWNTO 0);  -- ObjectKind=Port|PrimaryId=ENC_1_C_I[15..0]
    ENC_2_C_I        : In    STD_LOGIC_VECTOR(15 DOWNTO 0);  -- ObjectKind=Port|PrimaryId=ENC_2_C_I[15..0]
    ENC_3_C_I        : In    STD_LOGIC_VECTOR(15 DOWNTO 0);  -- ObjectKind=Port|PrimaryId=ENC_3_C_I[15..0]
    FLASH_1_SPI_CLK  : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=FLASH_1_SPI_CLK
    FLASH_1_SPI_CS   : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=FLASH_1_SPI_CS
    FLASH_1_SPI_DIN  : In    STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=FLASH_1_SPI_DIN
    FLASH_1_SPI_DOUT : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=FLASH_1_SPI_DOUT
    GPIO_1_ADC       : Out   STD_LOGIC_VECTOR(7 DOWNTO 0);   -- ObjectKind=Port|PrimaryId=GPIO_1_ADC[7..0]
    GPIO_1_DI        : In    STD_LOGIC_VECTOR(7 DOWNTO 0);   -- ObjectKind=Port|PrimaryId=GPIO_1_DI[7..0]
    GPIO_1_DO_I      : In    STD_LOGIC_VECTOR(7 DOWNTO 0);   -- ObjectKind=Port|PrimaryId=GPIO_1_DO_I[7..0]
    GPIO_1_DO_O      : Out   STD_LOGIC_VECTOR(7 DOWNTO 0);   -- ObjectKind=Port|PrimaryId=GPIO_1_DO_O[7..0]
    JTAG_NEXUS_TCK   : In    STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=JTAG_NEXUS_TCK
    JTAG_NEXUS_TDI   : In    STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=JTAG_NEXUS_TDI
    JTAG_NEXUS_TDO   : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=JTAG_NEXUS_TDO
    JTAG_NEXUS_TMS   : In    STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=JTAG_NEXUS_TMS
    JTAG_NEXUS_TRST  : In    STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=JTAG_NEXUS_TRST
    PWM_1_PWMN       : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=PWM_1_PWMN
    PWM_1_PWMP       : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=PWM_1_PWMP
    PWM_2_PWMN       : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=PWM_2_PWMN
    PWM_2_PWMP       : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=PWM_2_PWMP
    PWM_3_PWMN       : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=PWM_3_PWMN
    PWM_3_PWMP       : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=PWM_3_PWMP
    RST_I            : In    STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=RST_I
    UART_1_CTS       : In    STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=UART_1_CTS
    UART_1_RTS       : Out   STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=UART_1_RTS
    UART_1_RXD       : In    STD_LOGIC;                      -- ObjectKind=Port|PrimaryId=UART_1_RXD
    UART_1_TXD       : Out   STD_LOGIC                       -- ObjectKind=Port|PrimaryId=UART_1_TXD
  );
  attribute MacroCell : boolean;

End System;
------------------------------------------------------------

------------------------------------------------------------
Architecture Structure Of System Is
   Component Configurable_ADC_1                              -- ObjectKind=Part|PrimaryId=ADC_1|SecondaryId=1
      port
      (
        ACK_O  : out STD_LOGIC;                              -- ObjectKind=Pin|PrimaryId=ADC_1-ACK_O
        CLK_I  : in  STD_LOGIC;                              -- ObjectKind=Pin|PrimaryId=ADC_1-CLK_I
        CYC_I  : in  STD_LOGIC;                              -- ObjectKind=Pin|PrimaryId=ADC_1-CYC_I
        DAT_O  : out STD_LOGIC_VECTOR(15 downto 0);          -- ObjectKind=Pin|PrimaryId=ADC_1-DAT_O[15..0]
        DATA_I : in  STD_LOGIC_VECTOR(15 downto 0);          -- ObjectKind=Pin|PrimaryId=ADC_1-DATA_I[15..0]
        RST_I  : in  STD_LOGIC;                              -- ObjectKind=Pin|PrimaryId=ADC_1-RST_I
        STB_I  : in  STD_LOGIC;                              -- ObjectKind=Pin|PrimaryId=ADC_1-STB_I
        WE_I   : in  STD_LOGIC                               -- ObjectKind=Pin|PrimaryId=ADC_1-WE_I
      );
   End Component;

   Component Configurable_DAC_1                              -- ObjectKind=Part|PrimaryId=DAC_1|SecondaryId=1
      port
      (
        ACK_O    : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=DAC_1-ACK_O
        ADR_I    : in  STD_LOGIC_VECTOR(2 downto 0);         -- ObjectKind=Pin|PrimaryId=DAC_1-ADR_I[2..0]
        CLK_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=DAC_1-CLK_I
        CYC_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=DAC_1-CYC_I
        DAT_I    : in  STD_LOGIC_VECTOR(31 downto 0);        -- ObjectKind=Pin|PrimaryId=DAC_1-DAT_I[31..0]
        DAT_O    : out STD_LOGIC_VECTOR(31 downto 0);        -- ObjectKind=Pin|PrimaryId=DAC_1-DAT_O[31..0]
        RST_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=DAC_1-RST_I
        SPI_CLK  : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=DAC_1-SPI_CLK
        SPI_CS   : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=DAC_1-SPI_CS
        SPI_DIN  : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=DAC_1-SPI_DIN
        SPI_DOUT : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=DAC_1-SPI_DOUT
        STB_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=DAC_1-STB_I
        WE_I     : in  STD_LOGIC                             -- ObjectKind=Pin|PrimaryId=DAC_1-WE_I
      );
   End Component;

   Component Configurable_EC_1                               -- ObjectKind=Part|PrimaryId=EC_1|SecondaryId=1
      port
      (
        ACK_O    : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=EC_1-ACK_O
        ADR_I    : in  STD_LOGIC_VECTOR(2 downto 0);         -- ObjectKind=Pin|PrimaryId=EC_1-ADR_I[2..0]
        CLK_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=EC_1-CLK_I
        CYC_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=EC_1-CYC_I
        DAT_I    : in  STD_LOGIC_VECTOR(31 downto 0);        -- ObjectKind=Pin|PrimaryId=EC_1-DAT_I[31..0]
        DAT_O    : out STD_LOGIC_VECTOR(31 downto 0);        -- ObjectKind=Pin|PrimaryId=EC_1-DAT_O[31..0]
        RST_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=EC_1-RST_I
        SPI_CLK  : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=EC_1-SPI_CLK
        SPI_CS   : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=EC_1-SPI_CS
        SPI_DIN  : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=EC_1-SPI_DIN
        SPI_DOUT : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=EC_1-SPI_DOUT
        STB_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=EC_1-STB_I
        WE_I     : in  STD_LOGIC                             -- ObjectKind=Pin|PrimaryId=EC_1-WE_I
      );
   End Component;

   Component Configurable_ENC_1                              -- ObjectKind=Part|PrimaryId=ENC_1|SecondaryId=1
      port
      (
        ACK_O : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_1-ACK_O
        C_I   : in  STD_LOGIC_VECTOR(15 downto 0);           -- ObjectKind=Pin|PrimaryId=ENC_1-C_I[15..0]
        CLK_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_1-CLK_I
        CYC_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_1-CYC_I
        DAT_O : out STD_LOGIC_VECTOR(15 downto 0);           -- ObjectKind=Pin|PrimaryId=ENC_1-DAT_O[15..0]
        RST_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_1-RST_I
        STB_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_1-STB_I
        WE_I  : in  STD_LOGIC                                -- ObjectKind=Pin|PrimaryId=ENC_1-WE_I
      );
   End Component;

   Component Configurable_ENC_2                              -- ObjectKind=Part|PrimaryId=ENC_2|SecondaryId=1
      port
      (
        ACK_O : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_2-ACK_O
        C_I   : in  STD_LOGIC_VECTOR(15 downto 0);           -- ObjectKind=Pin|PrimaryId=ENC_2-C_I[15..0]
        CLK_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_2-CLK_I
        CYC_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_2-CYC_I
        DAT_O : out STD_LOGIC_VECTOR(15 downto 0);           -- ObjectKind=Pin|PrimaryId=ENC_2-DAT_O[15..0]
        RST_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_2-RST_I
        STB_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_2-STB_I
        WE_I  : in  STD_LOGIC                                -- ObjectKind=Pin|PrimaryId=ENC_2-WE_I
      );
   End Component;

   Component Configurable_ENC_3                              -- ObjectKind=Part|PrimaryId=ENC_3|SecondaryId=1
      port
      (
        ACK_O : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_3-ACK_O
        C_I   : in  STD_LOGIC_VECTOR(15 downto 0);           -- ObjectKind=Pin|PrimaryId=ENC_3-C_I[15..0]
        CLK_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_3-CLK_I
        CYC_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_3-CYC_I
        DAT_O : out STD_LOGIC_VECTOR(15 downto 0);           -- ObjectKind=Pin|PrimaryId=ENC_3-DAT_O[15..0]
        RST_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_3-RST_I
        STB_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=ENC_3-STB_I
        WE_I  : in  STD_LOGIC                                -- ObjectKind=Pin|PrimaryId=ENC_3-WE_I
      );
   End Component;

   Component Configurable_FLASH_1                            -- ObjectKind=Part|PrimaryId=FLASH_1|SecondaryId=1
      port
      (
        ACK_O    : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=FLASH_1-ACK_O
        ADR_I    : in  STD_LOGIC_VECTOR(2 downto 0);         -- ObjectKind=Pin|PrimaryId=FLASH_1-ADR_I[2..0]
        CLK_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=FLASH_1-CLK_I
        CYC_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=FLASH_1-CYC_I
        DAT_I    : in  STD_LOGIC_VECTOR(31 downto 0);        -- ObjectKind=Pin|PrimaryId=FLASH_1-DAT_I[31..0]
        DAT_O    : out STD_LOGIC_VECTOR(31 downto 0);        -- ObjectKind=Pin|PrimaryId=FLASH_1-DAT_O[31..0]
        RST_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=FLASH_1-RST_I
        SPI_CLK  : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=FLASH_1-SPI_CLK
        SPI_CS   : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=FLASH_1-SPI_CS
        SPI_DIN  : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=FLASH_1-SPI_DIN
        SPI_DOUT : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=FLASH_1-SPI_DOUT
        STB_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=FLASH_1-STB_I
        WE_I     : in  STD_LOGIC                             -- ObjectKind=Pin|PrimaryId=FLASH_1-WE_I
      );
   End Component;

   Component Configurable_GPIO_1                             -- ObjectKind=Part|PrimaryId=GPIO_1|SecondaryId=1
      port
      (
        ACK_O : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=GPIO_1-ACK_O
        ADC   : out STD_LOGIC_VECTOR(7 downto 0);            -- ObjectKind=Pin|PrimaryId=GPIO_1-ADC[7..0]
        ADR_I : in  STD_LOGIC_VECTOR(1 downto 0);            -- ObjectKind=Pin|PrimaryId=GPIO_1-ADR_I[1..0]
        CLK_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=GPIO_1-CLK_I
        CYC_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=GPIO_1-CYC_I
        DAT_I : in  STD_LOGIC_VECTOR(7 downto 0);            -- ObjectKind=Pin|PrimaryId=GPIO_1-DAT_I[7..0]
        DAT_O : out STD_LOGIC_VECTOR(7 downto 0);            -- ObjectKind=Pin|PrimaryId=GPIO_1-DAT_O[7..0]
        DI    : in  STD_LOGIC_VECTOR(7 downto 0);            -- ObjectKind=Pin|PrimaryId=GPIO_1-DI[7..0]
        DO_I  : in  STD_LOGIC_VECTOR(7 downto 0);            -- ObjectKind=Pin|PrimaryId=GPIO_1-DO_I[7..0]
        DO_O  : out STD_LOGIC_VECTOR(7 downto 0);            -- ObjectKind=Pin|PrimaryId=GPIO_1-DO_O[7..0]
        RST_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=GPIO_1-RST_I
        STB_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=GPIO_1-STB_I
        WE_I  : in  STD_LOGIC                                -- ObjectKind=Pin|PrimaryId=GPIO_1-WE_I
      );
   End Component;

   Component Configurable_MCU                                -- ObjectKind=Part|PrimaryId=MCU|SecondaryId=1
      port
      (
        CLK_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-CLK_I
        INT_I    : in  STD_LOGIC_VECTOR(31 downto 0);        -- ObjectKind=Pin|PrimaryId=MCU-INT_I[31..0]
        IO_ACK_I : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-IO_ACK_I
        IO_ADR_O : out STD_LOGIC_VECTOR(23 downto 0);        -- ObjectKind=Pin|PrimaryId=MCU-IO_ADR_O[23..0]
        IO_CYC_O : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-IO_CYC_O
        IO_DAT_I : in  STD_LOGIC_VECTOR(31 downto 0);        -- ObjectKind=Pin|PrimaryId=MCU-IO_DAT_I[31..0]
        IO_DAT_O : out STD_LOGIC_VECTOR(31 downto 0);        -- ObjectKind=Pin|PrimaryId=MCU-IO_DAT_O[31..0]
        IO_SEL_O : out STD_LOGIC_VECTOR(3 downto 0);         -- ObjectKind=Pin|PrimaryId=MCU-IO_SEL_O[3..0]
        IO_STB_O : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-IO_STB_O
        IO_WE_O  : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-IO_WE_O
        ME_ACK_I : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-ME_ACK_I
        ME_ADR_O : out STD_LOGIC_VECTOR(31 downto 0);        -- ObjectKind=Pin|PrimaryId=MCU-ME_ADR_O[31..0]
        ME_CYC_O : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-ME_CYC_O
        ME_DAT_I : in  STD_LOGIC_VECTOR(31 downto 0);        -- ObjectKind=Pin|PrimaryId=MCU-ME_DAT_I[31..0]
        ME_DAT_O : out STD_LOGIC_VECTOR(31 downto 0);        -- ObjectKind=Pin|PrimaryId=MCU-ME_DAT_O[31..0]
        ME_SEL_O : out STD_LOGIC_VECTOR(3 downto 0);         -- ObjectKind=Pin|PrimaryId=MCU-ME_SEL_O[3..0]
        ME_STB_O : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-ME_STB_O
        ME_WE_O  : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-ME_WE_O
        RST_I    : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-RST_I
        TCK      : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-TCK
        TDI      : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-TDI
        TDO      : out STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-TDO
        TMS      : in  STD_LOGIC;                            -- ObjectKind=Pin|PrimaryId=MCU-TMS
        TRST     : in  STD_LOGIC                             -- ObjectKind=Pin|PrimaryId=MCU-TRST
      );
   End Component;

   Component Configurable_TERMINATOR_1                       -- ObjectKind=Part|PrimaryId=TERMINATOR_1|SecondaryId=1
      port
      (
        ACK_O : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-ACK_O
        ADR_I : in  STD_LOGIC_VECTOR(31 downto 0);           -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-ADR_I[31..0]
        CYC_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-CYC_I
        DAT_I : in  STD_LOGIC_VECTOR(31 downto 0);           -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-DAT_I[31..0]
        DAT_O : out STD_LOGIC_VECTOR(31 downto 0);           -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-DAT_O[31..0]
        SEL_I : in  STD_LOGIC_VECTOR(3 downto 0);            -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-SEL_I[3..0]
        STB_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-STB_I
        WE_I  : in  STD_LOGIC                                -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-WE_I
      );
   End Component;

   Component Configurable_WB_INTERCON_1                      -- ObjectKind=Part|PrimaryId=WB_INTERCON_1|SecondaryId=1
      port
      (
        m0_ACK_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_ACK_O
        m0_ADR_I  : in  STD_LOGIC_VECTOR(23 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_ADR_I[23..0]
        m0_CLK_I  : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_CLK_I
        m0_CYC_I  : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_CYC_I
        m0_DAT_I  : in  STD_LOGIC_VECTOR(31 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_DAT_I[31..0]
        m0_DAT_O  : out STD_LOGIC_VECTOR(31 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_DAT_O[31..0]
        m0_SEL_I  : in  STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_SEL_I[3..0]
        m0_STB_I  : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_STB_I
        m0_WE_I   : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_WE_I
        s0_ACK_I  : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_ACK_I
        s0_ADR_O  : out STD_LOGIC_VECTOR(2 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_ADR_O[2..0]
        s0_CYC_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_CYC_O
        s0_DAT_I  : in  STD_LOGIC_VECTOR(31 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_DAT_I[31..0]
        s0_DAT_O  : out STD_LOGIC_VECTOR(31 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_DAT_O[31..0]
        s0_SEL_O  : out STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_SEL_O[3..0]
        s0_STB_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_STB_O
        s0_WE_O   : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_WE_O
        s1_ACK_I  : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_ACK_I
        s1_ADR_O  : out STD_LOGIC_VECTOR(1 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_ADR_O[1..0]
        s1_CYC_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_CYC_O
        s1_DAT_I  : in  STD_LOGIC_VECTOR(7 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_DAT_I[7..0]
        s1_DAT_O  : out STD_LOGIC_VECTOR(7 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_DAT_O[7..0]
        s1_SEL_O  : out STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_SEL_O[3..0]
        s1_STB_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_STB_O
        s1_WE_O   : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_WE_O
        s2_ACK_I  : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_ACK_I
        s2_CYC_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_CYC_O
        s2_DAT_I  : in  STD_LOGIC_VECTOR(15 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_DAT_I[15..0]
        s2_DAT_O  : out STD_LOGIC_VECTOR(15 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_DAT_O[15..0]
        s2_SEL_O  : out STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_SEL_O[3..0]
        s2_STB_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_STB_O
        s2_WE_O   : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_WE_O
        s3_ACK_I  : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_ACK_I
        s3_CYC_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_CYC_O
        s3_DAT_I  : in  STD_LOGIC_VECTOR(15 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_DAT_I[15..0]
        s3_DAT_O  : out STD_LOGIC_VECTOR(15 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_DAT_O[15..0]
        s3_SEL_O  : out STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_SEL_O[3..0]
        s3_STB_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_STB_O
        s3_WE_O   : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_WE_O
        s4_ACK_I  : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_ACK_I
        s4_CYC_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_CYC_O
        s4_DAT_I  : in  STD_LOGIC_VECTOR(15 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_DAT_I[15..0]
        s4_DAT_O  : out STD_LOGIC_VECTOR(15 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_DAT_O[15..0]
        s4_SEL_O  : out STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_SEL_O[3..0]
        s4_STB_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_STB_O
        s4_WE_O   : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_WE_O
        s5_ACK_I  : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_ACK_I
        s5_ADR_O  : out STD_LOGIC_VECTOR(2 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_ADR_O[2..0]
        s5_CYC_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_CYC_O
        s5_DAT_I  : in  STD_LOGIC_VECTOR(7 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_DAT_I[7..0]
        s5_DAT_O  : out STD_LOGIC_VECTOR(7 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_DAT_O[7..0]
        s5_SEL_O  : out STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_SEL_O[3..0]
        s5_STB_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_STB_O
        s5_WE_O   : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_WE_O
        s6_ACK_I  : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_ACK_I
        s6_ADR_O  : out STD_LOGIC_VECTOR(2 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_ADR_O[2..0]
        s6_CYC_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_CYC_O
        s6_DAT_I  : in  STD_LOGIC_VECTOR(7 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_DAT_I[7..0]
        s6_DAT_O  : out STD_LOGIC_VECTOR(7 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_DAT_O[7..0]
        s6_SEL_O  : out STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_SEL_O[3..0]
        s6_STB_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_STB_O
        s6_WE_O   : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_WE_O
        s7_ACK_I  : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_ACK_I
        s7_ADR_O  : out STD_LOGIC_VECTOR(2 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_ADR_O[2..0]
        s7_CYC_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_CYC_O
        s7_DAT_I  : in  STD_LOGIC_VECTOR(7 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_DAT_I[7..0]
        s7_DAT_O  : out STD_LOGIC_VECTOR(7 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_DAT_O[7..0]
        s7_SEL_O  : out STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_SEL_O[3..0]
        s7_STB_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_STB_O
        s7_WE_O   : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_WE_O
        s8_ACK_I  : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_ACK_I
        s8_CYC_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_CYC_O
        s8_DAT_I  : in  STD_LOGIC_VECTOR(15 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_DAT_I[15..0]
        s8_DAT_O  : out STD_LOGIC_VECTOR(15 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_DAT_O[15..0]
        s8_SEL_O  : out STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_SEL_O[3..0]
        s8_STB_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_STB_O
        s8_WE_O   : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_WE_O
        s9_ACK_I  : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_ACK_I
        s9_ADR_O  : out STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_ADR_O[3..0]
        s9_CYC_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_CYC_O
        s9_DAT_I  : in  STD_LOGIC_VECTOR(7 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_DAT_I[7..0]
        s9_DAT_O  : out STD_LOGIC_VECTOR(7 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_DAT_O[7..0]
        s9_SEL_O  : out STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_SEL_O[3..0]
        s9_STB_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_STB_O
        s9_WE_O   : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_WE_O
        s10_ACK_I : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_ACK_I
        s10_ADR_O : out STD_LOGIC_VECTOR(2 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_ADR_O[2..0]
        s10_CYC_O : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_CYC_O
        s10_DAT_I : in  STD_LOGIC_VECTOR(31 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_DAT_I[31..0]
        s10_DAT_O : out STD_LOGIC_VECTOR(31 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_DAT_O[31..0]
        s10_SEL_O : out STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_SEL_O[3..0]
        s10_STB_O : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_STB_O
        s10_WE_O  : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_WE_O
        s11_ACK_I : in  STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_ACK_I
        s11_ADR_O : out STD_LOGIC_VECTOR(2 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_ADR_O[2..0]
        s11_CYC_O : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_CYC_O
        s11_DAT_I : in  STD_LOGIC_VECTOR(31 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_DAT_I[31..0]
        s11_DAT_O : out STD_LOGIC_VECTOR(31 downto 0);       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_DAT_O[31..0]
        s11_SEL_O : out STD_LOGIC_VECTOR(3 downto 0);        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_SEL_O[3..0]
        s11_STB_O : out STD_LOGIC;                           -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_STB_O
        s11_WE_O  : out STD_LOGIC                            -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_WE_O
      );
   End Component;

   Component J16S_16B                                        -- ObjectKind=Part|PrimaryId=MCU_HI|SecondaryId=1
      port
      (
        I0  : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I0
        I1  : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I1
        I2  : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I2
        I3  : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I3
        I4  : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I4
        I5  : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I5
        I6  : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I6
        I7  : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I7
        I8  : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I8
        I9  : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I9
        I10 : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I10
        I11 : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I11
        I12 : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I12
        I13 : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I13
        I14 : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I14
        I15 : in  STD_LOGIC;                                 -- ObjectKind=Pin|PrimaryId=MCU_HI-I15
        O   : out STD_LOGIC_VECTOR(15 downto 0)              -- ObjectKind=Pin|PrimaryId=MCU_HI-O[15..0]
      );
   End Component;

   Component WB_PWMX                                         -- ObjectKind=Part|PrimaryId=PWM_1|SecondaryId=1
      port
      (
        ACK_O : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=PWM_1-ACK_O
        ADR_I : in  STD_LOGIC_VECTOR(2 downto 0);            -- ObjectKind=Pin|PrimaryId=PWM_1-ADR_I[2..0]
        CLK_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=PWM_1-CLK_I
        CYC_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=PWM_1-CYC_I
        DAT_I : in  STD_LOGIC_VECTOR(7 downto 0);            -- ObjectKind=Pin|PrimaryId=PWM_1-DAT_I[7..0]
        DAT_O : out STD_LOGIC_VECTOR(7 downto 0);            -- ObjectKind=Pin|PrimaryId=PWM_1-DAT_O[7..0]
        INT_O : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=PWM_1-INT_O
        PWMN  : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=PWM_1-PWMN
        PWMP  : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=PWM_1-PWMP
        RST_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=PWM_1-RST_I
        STB_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=PWM_1-STB_I
        WE_I  : in  STD_LOGIC                                -- ObjectKind=Pin|PrimaryId=PWM_1-WE_I
      );
   End Component;

   Component WB_UART8_V2                                     -- ObjectKind=Part|PrimaryId=UART_1|SecondaryId=1
      port
      (
        ACK_O : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=UART_1-ACK_O
        ADR_I : in  STD_LOGIC_VECTOR(3 downto 0);            -- ObjectKind=Pin|PrimaryId=UART_1-ADR_I[3..0]
        CLK_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=UART_1-CLK_I
        CTS   : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=UART_1-CTS
        CYC_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=UART_1-CYC_I
        DAT_I : in  STD_LOGIC_VECTOR(7 downto 0);            -- ObjectKind=Pin|PrimaryId=UART_1-DAT_I[7..0]
        DAT_O : out STD_LOGIC_VECTOR(7 downto 0);            -- ObjectKind=Pin|PrimaryId=UART_1-DAT_O[7..0]
        INT_O : out STD_LOGIC_VECTOR(1 downto 0);            -- ObjectKind=Pin|PrimaryId=UART_1-INT_O[1..0]
        RST_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=UART_1-RST_I
        RTS   : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=UART_1-RTS
        RXD   : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=UART_1-RXD
        STB_I : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=UART_1-STB_I
        TXD   : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=UART_1-TXD
        WE_I  : in  STD_LOGIC                                -- ObjectKind=Pin|PrimaryId=UART_1-WE_I
      );
   End Component;


    Signal NamedSignal_CLK_I                              : STD_LOGIC; -- ObjectKind=Net|PrimaryId=CLK_I
    Signal NamedSignal_GND1_BUS                           : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND1_BUS[3..0]
    Signal NamedSignal_GND10_BUS                          : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND10_BUS[3..0]
    Signal NamedSignal_GND11_BUS                          : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND11_BUS[3..0]
    Signal NamedSignal_GND12_BUS                          : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND12_BUS[3..0]
    Signal NamedSignal_GND2_BUS                           : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND2_BUS[3..0]
    Signal NamedSignal_GND3_BUS                           : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND3_BUS[3..0]
    Signal NamedSignal_GND4_BUS                           : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND4_BUS[3..0]
    Signal NamedSignal_GND5_BUS                           : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND5_BUS[3..0]
    Signal NamedSignal_GND6_BUS                           : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND6_BUS[3..0]
    Signal NamedSignal_GND7_BUS                           : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND7_BUS[3..0]
    Signal NamedSignal_GND8_BUS                           : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND8_BUS[3..0]
    Signal NamedSignal_GND9_BUS                           : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND9_BUS[3..0]
    Signal NamedSignal_INTERRUPT_MCU_INT_I                : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=INTERRUPT_MCU_INT_I[31..0]
    Signal NamedSignal_MCU_M0_S0_TERMINATOR_1_ACK         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_ACK
    Signal NamedSignal_MCU_M0_S0_TERMINATOR_1_ADR         : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_ADR[31..0]
    Signal NamedSignal_MCU_M0_S0_TERMINATOR_1_CYC         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_CYC
    Signal NamedSignal_MCU_M0_S0_TERMINATOR_1_DATIO       : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_DATIO[31..0]
    Signal NamedSignal_MCU_M0_S0_TERMINATOR_1_DATOI       : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_DATOI[31..0]
    Signal NamedSignal_MCU_M0_S0_TERMINATOR_1_SEL         : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_SEL[3..0]
    Signal NamedSignal_MCU_M0_S0_TERMINATOR_1_STB         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_STB
    Signal NamedSignal_MCU_M0_S0_TERMINATOR_1_WE          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_WE
    Signal NamedSignal_MCU_M1_S0_WB_INTERCON_1_ACK        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_ACK
    Signal NamedSignal_MCU_M1_S0_WB_INTERCON_1_ADR        : STD_LOGIC_VECTOR(23 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_ADR[23..0]
    Signal NamedSignal_MCU_M1_S0_WB_INTERCON_1_CYC        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_CYC
    Signal NamedSignal_MCU_M1_S0_WB_INTERCON_1_DATIO      : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_DATIO[31..0]
    Signal NamedSignal_MCU_M1_S0_WB_INTERCON_1_DATOI      : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_DATOI[31..0]
    Signal NamedSignal_MCU_M1_S0_WB_INTERCON_1_SEL        : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_SEL[3..0]
    Signal NamedSignal_MCU_M1_S0_WB_INTERCON_1_STB        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_STB
    Signal NamedSignal_MCU_M1_S0_WB_INTERCON_1_WE         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_WE
    Signal NamedSignal_RST_I                              : STD_LOGIC; -- ObjectKind=Net|PrimaryId=RST_I
    Signal NamedSignal_WB_INTERCON_1_M0_S0_EC_1_ACK       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_ACK
    Signal NamedSignal_WB_INTERCON_1_M0_S0_EC_1_ADR       : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_ADR[2..0]
    Signal NamedSignal_WB_INTERCON_1_M0_S0_EC_1_CYC       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_CYC
    Signal NamedSignal_WB_INTERCON_1_M0_S0_EC_1_DATIO     : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_DATIO[31..0]
    Signal NamedSignal_WB_INTERCON_1_M0_S0_EC_1_DATOI     : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_DATOI[31..0]
    Signal NamedSignal_WB_INTERCON_1_M0_S0_EC_1_STB       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_STB
    Signal NamedSignal_WB_INTERCON_1_M0_S0_EC_1_WE        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_WE
    Signal NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_ACK     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_ACK
    Signal NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_ADR     : STD_LOGIC_VECTOR(1 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_ADR[1..0]
    Signal NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_CYC     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_CYC
    Signal NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_DATIO   : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_DATIO[7..0]
    Signal NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_DATOI   : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_DATOI[7..0]
    Signal NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_STB     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_STB
    Signal NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_WE      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_WE
    Signal NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_ACK     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_ACK
    Signal NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_ADR     : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_ADR[2..0]
    Signal NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_CYC     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_CYC
    Signal NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_DATIO   : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_DATIO[31..0]
    Signal NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_DATOI   : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_DATOI[31..0]
    Signal NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_STB     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_STB
    Signal NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_WE      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_WE
    Signal NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_ACK   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_ACK
    Signal NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_ADR   : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_ADR[2..0]
    Signal NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_CYC   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_CYC
    Signal NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_DATIO : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_DATIO[31..0]
    Signal NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_DATOI : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_DATOI[31..0]
    Signal NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_STB   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_STB
    Signal NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_WE    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_WE
    Signal NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_ACK      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_ACK
    Signal NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_CYC      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_CYC
    Signal NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_DATOI    : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_DATOI[15..0]
    Signal NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_STB      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_STB
    Signal NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_WE       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_WE
    Signal NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_ACK      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_ACK
    Signal NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_CYC      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_CYC
    Signal NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_DATOI    : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_DATOI[15..0]
    Signal NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_STB      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_STB
    Signal NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_WE       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_WE
    Signal NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_ACK      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_ACK
    Signal NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_CYC      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_CYC
    Signal NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_DATOI    : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_DATOI[15..0]
    Signal NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_STB      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_STB
    Signal NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_WE       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_WE
    Signal NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_ACK      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_ACK
    Signal NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_ADR      : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_ADR[2..0]
    Signal NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_CYC      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_CYC
    Signal NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_DATIO    : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_DATIO[7..0]
    Signal NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_DATOI    : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_DATOI[7..0]
    Signal NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_STB      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_STB
    Signal NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_WE       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_WE
    Signal NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_ACK      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_ACK
    Signal NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_ADR      : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_ADR[2..0]
    Signal NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_CYC      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_CYC
    Signal NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_DATIO    : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_DATIO[7..0]
    Signal NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_DATOI    : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_DATOI[7..0]
    Signal NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_STB      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_STB
    Signal NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_WE       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_WE
    Signal NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_ACK      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_ACK
    Signal NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_ADR      : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_ADR[2..0]
    Signal NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_CYC      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_CYC
    Signal NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_DATIO    : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_DATIO[7..0]
    Signal NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_DATOI    : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_DATOI[7..0]
    Signal NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_STB      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_STB
    Signal NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_WE       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_WE
    Signal NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_ACK      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_ACK
    Signal NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_CYC      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_CYC
    Signal NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_DATOI    : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_DATOI[15..0]
    Signal NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_STB      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_STB
    Signal NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_WE       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_WE
    Signal NamedSignal_WB_INTERCON_1_M9_S0_UART_1_ACK     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_ACK
    Signal NamedSignal_WB_INTERCON_1_M9_S0_UART_1_ADR     : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_ADR[3..0]
    Signal NamedSignal_WB_INTERCON_1_M9_S0_UART_1_CYC     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_CYC
    Signal NamedSignal_WB_INTERCON_1_M9_S0_UART_1_DATIO   : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_DATIO[7..0]
    Signal NamedSignal_WB_INTERCON_1_M9_S0_UART_1_DATOI   : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_DATOI[7..0]
    Signal NamedSignal_WB_INTERCON_1_M9_S0_UART_1_STB     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_STB
    Signal NamedSignal_WB_INTERCON_1_M9_S0_UART_1_WE      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_WE
    Signal PinSignal_ADC_1_ACK_O                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_ACK
    Signal PinSignal_ADC_1_DAT_O                          : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_DATOI[15..0]
    Signal PinSignal_DAC_1_ACK_O                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_ACK
    Signal PinSignal_DAC_1_DAT_O                          : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_DATOI[31..0]
    Signal PinSignal_DAC_1_SPI_CLK                        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=DAC_1_SPI_CLK
    Signal PinSignal_DAC_1_SPI_CS                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=DAC_1_SPI_CS
    Signal PinSignal_DAC_1_SPI_DOUT                       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=DAC_1_SPI_DOUT
    Signal PinSignal_EC_1_ACK_O                           : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_ACK
    Signal PinSignal_EC_1_DAT_O                           : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_DATOI[31..0]
    Signal PinSignal_EC_1_SPI_CLK                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=EC_1_SPI_CLK
    Signal PinSignal_EC_1_SPI_CS                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=EC_1_SPI_CS
    Signal PinSignal_EC_1_SPI_DOUT                        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=EC_1_SPI_DOUT
    Signal PinSignal_ENC_1_ACK_O                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_ACK
    Signal PinSignal_ENC_1_DAT_O                          : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_DATOI[15..0]
    Signal PinSignal_ENC_2_ACK_O                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_ACK
    Signal PinSignal_ENC_2_DAT_O                          : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_DATOI[15..0]
    Signal PinSignal_ENC_3_ACK_O                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_ACK
    Signal PinSignal_ENC_3_DAT_O                          : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_DATOI[15..0]
    Signal PinSignal_FLASH_1_ACK_O                        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_ACK
    Signal PinSignal_FLASH_1_DAT_O                        : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_DATOI[31..0]
    Signal PinSignal_FLASH_1_SPI_CLK                      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=FLASH_1_SPI_CLK
    Signal PinSignal_FLASH_1_SPI_CS                       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=FLASH_1_SPI_CS
    Signal PinSignal_FLASH_1_SPI_DOUT                     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=FLASH_1_SPI_DOUT
    Signal PinSignal_GPIO_1_ACK_O                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_ACK
    Signal PinSignal_GPIO_1_ADC                           : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=GPIO_1_ADC[7..0]
    Signal PinSignal_GPIO_1_DAT_O                         : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_DATOI[7..0]
    Signal PinSignal_GPIO_1_DO_O                          : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=GPIO_1_DO_O[7..0]
    Signal PinSignal_MCU_HI_O                             : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=INTERRUPT_MCU_INT_I[31..0]
    Signal PinSignal_MCU_IO_ADR_O                         : STD_LOGIC_VECTOR(23 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_ADR[23..0]
    Signal PinSignal_MCU_IO_CYC_O                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_CYC
    Signal PinSignal_MCU_IO_DAT_O                         : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_DATIO[31..0]
    Signal PinSignal_MCU_IO_SEL_O                         : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_SEL[3..0]
    Signal PinSignal_MCU_IO_STB_O                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_STB
    Signal PinSignal_MCU_IO_WE_O                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_WE
    Signal PinSignal_MCU_LO_O                             : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=INTERRUPT_MCU_INT_I[15..0]
    Signal PinSignal_MCU_ME_ADR_O                         : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_ADR[31..0]
    Signal PinSignal_MCU_ME_CYC_O                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_CYC
    Signal PinSignal_MCU_ME_DAT_O                         : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_DATIO[31..0]
    Signal PinSignal_MCU_ME_SEL_O                         : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_SEL[3..0]
    Signal PinSignal_MCU_ME_STB_O                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_STB
    Signal PinSignal_MCU_ME_WE_O                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_WE
    Signal PinSignal_MCU_TDO                              : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetMCU_TDO
    Signal PinSignal_PWM_1_ACK_O                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_ACK
    Signal PinSignal_PWM_1_DAT_O                          : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_DATOI[7..0]
    Signal PinSignal_PWM_1_INT_O                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_1_INT_O
    Signal PinSignal_PWM_1_PWMN                           : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_1_PWMN
    Signal PinSignal_PWM_1_PWMP                           : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_1_PWMP
    Signal PinSignal_PWM_2_ACK_O                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_ACK
    Signal PinSignal_PWM_2_DAT_O                          : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_DATOI[7..0]
    Signal PinSignal_PWM_2_INT_O                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_2_INT_O
    Signal PinSignal_PWM_2_PWMN                           : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_2_PWMN
    Signal PinSignal_PWM_2_PWMP                           : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_2_PWMP
    Signal PinSignal_PWM_3_ACK_O                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_ACK
    Signal PinSignal_PWM_3_DAT_O                          : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_DATOI[7..0]
    Signal PinSignal_PWM_3_INT_O                          : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_3_INT_O
    Signal PinSignal_PWM_3_PWMN                           : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_3_PWMN
    Signal PinSignal_PWM_3_PWMP                           : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_3_PWMP
    Signal PinSignal_TERMINATOR_1_ACK_O                   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_ACK
    Signal PinSignal_TERMINATOR_1_DAT_O                   : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_DATOI[31..0]
    Signal PinSignal_UART_1_ACK_O                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_ACK
    Signal PinSignal_UART_1_DAT_O                         : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_DATOI[7..0]
    Signal PinSignal_UART_1_INT_O                         : STD_LOGIC_VECTOR(1 downto 0); -- ObjectKind=Net|PrimaryId=UART_1_INT_O[1..0]
    Signal PinSignal_UART_1_RTS                           : STD_LOGIC; -- ObjectKind=Net|PrimaryId=UART_1_RTS
    Signal PinSignal_UART_1_TXD                           : STD_LOGIC; -- ObjectKind=Net|PrimaryId=UART_1_TXD
    Signal PinSignal_WB_INTERCON_1_m0_ACK_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_ACK
    Signal PinSignal_WB_INTERCON_1_m0_DAT_O               : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_DATOI[31..0]
    Signal PinSignal_WB_INTERCON_1_s0_ADR_O               : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_ADR[2..0]
    Signal PinSignal_WB_INTERCON_1_s0_CYC_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_CYC
    Signal PinSignal_WB_INTERCON_1_s0_DAT_O               : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_DATIO[31..0]
    Signal PinSignal_WB_INTERCON_1_s0_SEL_O               : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND12_BUS[3..0]
    Signal PinSignal_WB_INTERCON_1_s0_STB_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_STB
    Signal PinSignal_WB_INTERCON_1_s0_WE_O                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_WE
    Signal PinSignal_WB_INTERCON_1_s1_ADR_O               : STD_LOGIC_VECTOR(1 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_ADR[1..0]
    Signal PinSignal_WB_INTERCON_1_s1_CYC_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_CYC
    Signal PinSignal_WB_INTERCON_1_s1_DAT_O               : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_DATIO[7..0]
    Signal PinSignal_WB_INTERCON_1_s1_SEL_O               : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND11_BUS[3..0]
    Signal PinSignal_WB_INTERCON_1_s1_STB_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_STB
    Signal PinSignal_WB_INTERCON_1_s1_WE_O                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_WE
    Signal PinSignal_WB_INTERCON_1_s10_ADR_O              : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_ADR[2..0]
    Signal PinSignal_WB_INTERCON_1_s10_CYC_O              : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_CYC
    Signal PinSignal_WB_INTERCON_1_s10_DAT_O              : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_DATIO[31..0]
    Signal PinSignal_WB_INTERCON_1_s10_SEL_O              : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND2_BUS[3..0]
    Signal PinSignal_WB_INTERCON_1_s10_STB_O              : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_STB
    Signal PinSignal_WB_INTERCON_1_s10_WE_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_WE
    Signal PinSignal_WB_INTERCON_1_s11_ADR_O              : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_ADR[2..0]
    Signal PinSignal_WB_INTERCON_1_s11_CYC_O              : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_CYC
    Signal PinSignal_WB_INTERCON_1_s11_DAT_O              : STD_LOGIC_VECTOR(31 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_DATIO[31..0]
    Signal PinSignal_WB_INTERCON_1_s11_SEL_O              : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND1_BUS[3..0]
    Signal PinSignal_WB_INTERCON_1_s11_STB_O              : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_STB
    Signal PinSignal_WB_INTERCON_1_s11_WE_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_WE
    Signal PinSignal_WB_INTERCON_1_s2_CYC_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_CYC
    Signal PinSignal_WB_INTERCON_1_s2_DAT_O               : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_DATIO[15..0]
    Signal PinSignal_WB_INTERCON_1_s2_SEL_O               : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND10_BUS[3..0]
    Signal PinSignal_WB_INTERCON_1_s2_STB_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_STB
    Signal PinSignal_WB_INTERCON_1_s2_WE_O                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_WE
    Signal PinSignal_WB_INTERCON_1_s3_CYC_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_CYC
    Signal PinSignal_WB_INTERCON_1_s3_DAT_O               : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_DATIO[15..0]
    Signal PinSignal_WB_INTERCON_1_s3_SEL_O               : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND9_BUS[3..0]
    Signal PinSignal_WB_INTERCON_1_s3_STB_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_STB
    Signal PinSignal_WB_INTERCON_1_s3_WE_O                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_WE
    Signal PinSignal_WB_INTERCON_1_s4_CYC_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_CYC
    Signal PinSignal_WB_INTERCON_1_s4_DAT_O               : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_DATIO[15..0]
    Signal PinSignal_WB_INTERCON_1_s4_SEL_O               : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND8_BUS[3..0]
    Signal PinSignal_WB_INTERCON_1_s4_STB_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_STB
    Signal PinSignal_WB_INTERCON_1_s4_WE_O                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_WE
    Signal PinSignal_WB_INTERCON_1_s5_ADR_O               : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_ADR[2..0]
    Signal PinSignal_WB_INTERCON_1_s5_CYC_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_CYC
    Signal PinSignal_WB_INTERCON_1_s5_DAT_O               : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_DATIO[7..0]
    Signal PinSignal_WB_INTERCON_1_s5_SEL_O               : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND7_BUS[3..0]
    Signal PinSignal_WB_INTERCON_1_s5_STB_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_STB
    Signal PinSignal_WB_INTERCON_1_s5_WE_O                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_WE
    Signal PinSignal_WB_INTERCON_1_s6_ADR_O               : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_ADR[2..0]
    Signal PinSignal_WB_INTERCON_1_s6_CYC_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_CYC
    Signal PinSignal_WB_INTERCON_1_s6_DAT_O               : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_DATIO[7..0]
    Signal PinSignal_WB_INTERCON_1_s6_SEL_O               : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND6_BUS[3..0]
    Signal PinSignal_WB_INTERCON_1_s6_STB_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_STB
    Signal PinSignal_WB_INTERCON_1_s6_WE_O                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_WE
    Signal PinSignal_WB_INTERCON_1_s7_ADR_O               : STD_LOGIC_VECTOR(2 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_ADR[2..0]
    Signal PinSignal_WB_INTERCON_1_s7_CYC_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_CYC
    Signal PinSignal_WB_INTERCON_1_s7_DAT_O               : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_DATIO[7..0]
    Signal PinSignal_WB_INTERCON_1_s7_SEL_O               : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND5_BUS[3..0]
    Signal PinSignal_WB_INTERCON_1_s7_STB_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_STB
    Signal PinSignal_WB_INTERCON_1_s7_WE_O                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_WE
    Signal PinSignal_WB_INTERCON_1_s8_CYC_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_CYC
    Signal PinSignal_WB_INTERCON_1_s8_DAT_O               : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_DATIO[15..0]
    Signal PinSignal_WB_INTERCON_1_s8_SEL_O               : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND4_BUS[3..0]
    Signal PinSignal_WB_INTERCON_1_s8_STB_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_STB
    Signal PinSignal_WB_INTERCON_1_s8_WE_O                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_WE
    Signal PinSignal_WB_INTERCON_1_s9_ADR_O               : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_ADR[3..0]
    Signal PinSignal_WB_INTERCON_1_s9_CYC_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_CYC
    Signal PinSignal_WB_INTERCON_1_s9_DAT_O               : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_DATIO[7..0]
    Signal PinSignal_WB_INTERCON_1_s9_SEL_O               : STD_LOGIC_VECTOR(3 downto 0); -- ObjectKind=Net|PrimaryId=GND3_BUS[3..0]
    Signal PinSignal_WB_INTERCON_1_s9_STB_O               : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_STB
    Signal PinSignal_WB_INTERCON_1_s9_WE_O                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_WE
    Signal PowerSignal_GND                                : STD_LOGIC; -- ObjectKind=Net|PrimaryId=GND

   attribute ExportedInterrupts : string;
   attribute ExportedInterrupts of MCU : Label is "0000000000000000,FFFFFFFF,FFFFFFFF";

   attribute InterconOrder : string;
   attribute InterconOrder of WB_INTERCON_1 : Label is "10";
   attribute InterconOrder of UART_1        : Label is "11";
   attribute InterconOrder of PWM_3         : Label is "7";
   attribute InterconOrder of PWM_2         : Label is "8";
   attribute InterconOrder of PWM_1         : Label is "9";
   attribute InterconOrder of GPIO_1        : Label is "1";
   attribute InterconOrder of ENC_3         : Label is "5";
   attribute InterconOrder of ENC_2         : Label is "6";
   attribute InterconOrder of ENC_1         : Label is "4";
   attribute InterconOrder of EC_1          : Label is "0";
   attribute InterconOrder of DAC_1         : Label is "0";
   attribute InterconOrder of ADC_1         : Label is "9";

   attribute IsUserConfigurable : string;
   attribute IsUserConfigurable of FLASH_1 : Label is "True";
   attribute IsUserConfigurable of EC_1    : Label is "True";
   attribute IsUserConfigurable of DAC_1   : Label is "True";


Begin
    WB_INTERCON_1 : Configurable_WB_INTERCON_1               -- ObjectKind=Part|PrimaryId=WB_INTERCON_1|SecondaryId=1
      Port Map
      (
        m0_ACK_O  => PinSignal_WB_INTERCON_1_m0_ACK_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_ACK_O
        m0_ADR_I  => NamedSignal_MCU_M1_S0_WB_INTERCON_1_ADR, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_ADR_I[23..0]
        m0_CLK_I  => NamedSignal_CLK_I,                      -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_CLK_I
        m0_CYC_I  => NamedSignal_MCU_M1_S0_WB_INTERCON_1_CYC, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_CYC_I
        m0_DAT_I  => NamedSignal_MCU_M1_S0_WB_INTERCON_1_DATIO, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_DAT_I[31..0]
        m0_DAT_O  => PinSignal_WB_INTERCON_1_m0_DAT_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_DAT_O[31..0]
        m0_SEL_I  => NamedSignal_MCU_M1_S0_WB_INTERCON_1_SEL, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_SEL_I[3..0]
        m0_STB_I  => NamedSignal_MCU_M1_S0_WB_INTERCON_1_STB, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_STB_I
        m0_WE_I   => NamedSignal_MCU_M1_S0_WB_INTERCON_1_WE, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-m0_WE_I
        s0_ACK_I  => NamedSignal_WB_INTERCON_1_M0_S0_EC_1_ACK, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_ACK_I
        s0_ADR_O  => PinSignal_WB_INTERCON_1_s0_ADR_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_ADR_O[2..0]
        s0_CYC_O  => PinSignal_WB_INTERCON_1_s0_CYC_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_CYC_O
        s0_DAT_I  => NamedSignal_WB_INTERCON_1_M0_S0_EC_1_DATOI, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_DAT_I[31..0]
        s0_DAT_O  => PinSignal_WB_INTERCON_1_s0_DAT_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_DAT_O[31..0]
        s0_SEL_O  => PinSignal_WB_INTERCON_1_s0_SEL_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_SEL_O[3..0]
        s0_STB_O  => PinSignal_WB_INTERCON_1_s0_STB_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_STB_O
        s0_WE_O   => PinSignal_WB_INTERCON_1_s0_WE_O,        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s0_WE_O
        s1_ACK_I  => NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_ACK, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_ACK_I
        s1_ADR_O  => PinSignal_WB_INTERCON_1_s1_ADR_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_ADR_O[1..0]
        s1_CYC_O  => PinSignal_WB_INTERCON_1_s1_CYC_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_CYC_O
        s1_DAT_I  => NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_DATOI, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_DAT_I[7..0]
        s1_DAT_O  => PinSignal_WB_INTERCON_1_s1_DAT_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_DAT_O[7..0]
        s1_SEL_O  => PinSignal_WB_INTERCON_1_s1_SEL_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_SEL_O[3..0]
        s1_STB_O  => PinSignal_WB_INTERCON_1_s1_STB_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_STB_O
        s1_WE_O   => PinSignal_WB_INTERCON_1_s1_WE_O,        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s1_WE_O
        s2_ACK_I  => NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_ACK, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_ACK_I
        s2_CYC_O  => PinSignal_WB_INTERCON_1_s2_CYC_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_CYC_O
        s2_DAT_I  => NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_DATOI, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_DAT_I[15..0]
        s2_DAT_O  => PinSignal_WB_INTERCON_1_s2_DAT_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_DAT_O[15..0]
        s2_SEL_O  => PinSignal_WB_INTERCON_1_s2_SEL_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_SEL_O[3..0]
        s2_STB_O  => PinSignal_WB_INTERCON_1_s2_STB_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_STB_O
        s2_WE_O   => PinSignal_WB_INTERCON_1_s2_WE_O,        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s2_WE_O
        s3_ACK_I  => NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_ACK, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_ACK_I
        s3_CYC_O  => PinSignal_WB_INTERCON_1_s3_CYC_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_CYC_O
        s3_DAT_I  => NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_DATOI, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_DAT_I[15..0]
        s3_DAT_O  => PinSignal_WB_INTERCON_1_s3_DAT_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_DAT_O[15..0]
        s3_SEL_O  => PinSignal_WB_INTERCON_1_s3_SEL_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_SEL_O[3..0]
        s3_STB_O  => PinSignal_WB_INTERCON_1_s3_STB_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_STB_O
        s3_WE_O   => PinSignal_WB_INTERCON_1_s3_WE_O,        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s3_WE_O
        s4_ACK_I  => NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_ACK, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_ACK_I
        s4_CYC_O  => PinSignal_WB_INTERCON_1_s4_CYC_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_CYC_O
        s4_DAT_I  => NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_DATOI, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_DAT_I[15..0]
        s4_DAT_O  => PinSignal_WB_INTERCON_1_s4_DAT_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_DAT_O[15..0]
        s4_SEL_O  => PinSignal_WB_INTERCON_1_s4_SEL_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_SEL_O[3..0]
        s4_STB_O  => PinSignal_WB_INTERCON_1_s4_STB_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_STB_O
        s4_WE_O   => PinSignal_WB_INTERCON_1_s4_WE_O,        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s4_WE_O
        s5_ACK_I  => NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_ACK, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_ACK_I
        s5_ADR_O  => PinSignal_WB_INTERCON_1_s5_ADR_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_ADR_O[2..0]
        s5_CYC_O  => PinSignal_WB_INTERCON_1_s5_CYC_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_CYC_O
        s5_DAT_I  => NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_DATOI, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_DAT_I[7..0]
        s5_DAT_O  => PinSignal_WB_INTERCON_1_s5_DAT_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_DAT_O[7..0]
        s5_SEL_O  => PinSignal_WB_INTERCON_1_s5_SEL_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_SEL_O[3..0]
        s5_STB_O  => PinSignal_WB_INTERCON_1_s5_STB_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_STB_O
        s5_WE_O   => PinSignal_WB_INTERCON_1_s5_WE_O,        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s5_WE_O
        s6_ACK_I  => NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_ACK, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_ACK_I
        s6_ADR_O  => PinSignal_WB_INTERCON_1_s6_ADR_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_ADR_O[2..0]
        s6_CYC_O  => PinSignal_WB_INTERCON_1_s6_CYC_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_CYC_O
        s6_DAT_I  => NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_DATOI, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_DAT_I[7..0]
        s6_DAT_O  => PinSignal_WB_INTERCON_1_s6_DAT_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_DAT_O[7..0]
        s6_SEL_O  => PinSignal_WB_INTERCON_1_s6_SEL_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_SEL_O[3..0]
        s6_STB_O  => PinSignal_WB_INTERCON_1_s6_STB_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_STB_O
        s6_WE_O   => PinSignal_WB_INTERCON_1_s6_WE_O,        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s6_WE_O
        s7_ACK_I  => NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_ACK, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_ACK_I
        s7_ADR_O  => PinSignal_WB_INTERCON_1_s7_ADR_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_ADR_O[2..0]
        s7_CYC_O  => PinSignal_WB_INTERCON_1_s7_CYC_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_CYC_O
        s7_DAT_I  => NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_DATOI, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_DAT_I[7..0]
        s7_DAT_O  => PinSignal_WB_INTERCON_1_s7_DAT_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_DAT_O[7..0]
        s7_SEL_O  => PinSignal_WB_INTERCON_1_s7_SEL_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_SEL_O[3..0]
        s7_STB_O  => PinSignal_WB_INTERCON_1_s7_STB_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_STB_O
        s7_WE_O   => PinSignal_WB_INTERCON_1_s7_WE_O,        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s7_WE_O
        s8_ACK_I  => NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_ACK, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_ACK_I
        s8_CYC_O  => PinSignal_WB_INTERCON_1_s8_CYC_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_CYC_O
        s8_DAT_I  => NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_DATOI, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_DAT_I[15..0]
        s8_DAT_O  => PinSignal_WB_INTERCON_1_s8_DAT_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_DAT_O[15..0]
        s8_SEL_O  => PinSignal_WB_INTERCON_1_s8_SEL_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_SEL_O[3..0]
        s8_STB_O  => PinSignal_WB_INTERCON_1_s8_STB_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_STB_O
        s8_WE_O   => PinSignal_WB_INTERCON_1_s8_WE_O,        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s8_WE_O
        s9_ACK_I  => NamedSignal_WB_INTERCON_1_M9_S0_UART_1_ACK, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_ACK_I
        s9_ADR_O  => PinSignal_WB_INTERCON_1_s9_ADR_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_ADR_O[3..0]
        s9_CYC_O  => PinSignal_WB_INTERCON_1_s9_CYC_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_CYC_O
        s9_DAT_I  => NamedSignal_WB_INTERCON_1_M9_S0_UART_1_DATOI, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_DAT_I[7..0]
        s9_DAT_O  => PinSignal_WB_INTERCON_1_s9_DAT_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_DAT_O[7..0]
        s9_SEL_O  => PinSignal_WB_INTERCON_1_s9_SEL_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_SEL_O[3..0]
        s9_STB_O  => PinSignal_WB_INTERCON_1_s9_STB_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_STB_O
        s9_WE_O   => PinSignal_WB_INTERCON_1_s9_WE_O,        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s9_WE_O
        s10_ACK_I => NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_ACK, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_ACK_I
        s10_ADR_O => PinSignal_WB_INTERCON_1_s10_ADR_O,      -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_ADR_O[2..0]
        s10_CYC_O => PinSignal_WB_INTERCON_1_s10_CYC_O,      -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_CYC_O
        s10_DAT_I => NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_DATOI, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_DAT_I[31..0]
        s10_DAT_O => PinSignal_WB_INTERCON_1_s10_DAT_O,      -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_DAT_O[31..0]
        s10_SEL_O => PinSignal_WB_INTERCON_1_s10_SEL_O,      -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_SEL_O[3..0]
        s10_STB_O => PinSignal_WB_INTERCON_1_s10_STB_O,      -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_STB_O
        s10_WE_O  => PinSignal_WB_INTERCON_1_s10_WE_O,       -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s10_WE_O
        s11_ACK_I => NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_ACK, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_ACK_I
        s11_ADR_O => PinSignal_WB_INTERCON_1_s11_ADR_O,      -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_ADR_O[2..0]
        s11_CYC_O => PinSignal_WB_INTERCON_1_s11_CYC_O,      -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_CYC_O
        s11_DAT_I => NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_DATOI, -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_DAT_I[31..0]
        s11_DAT_O => PinSignal_WB_INTERCON_1_s11_DAT_O,      -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_DAT_O[31..0]
        s11_SEL_O => PinSignal_WB_INTERCON_1_s11_SEL_O,      -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_SEL_O[3..0]
        s11_STB_O => PinSignal_WB_INTERCON_1_s11_STB_O,      -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_STB_O
        s11_WE_O  => PinSignal_WB_INTERCON_1_s11_WE_O        -- ObjectKind=Pin|PrimaryId=WB_INTERCON_1-s11_WE_O
      );

    UART_1 : WB_UART8_V2                                     -- ObjectKind=Part|PrimaryId=UART_1|SecondaryId=1
      Port Map
      (
        ACK_O => PinSignal_UART_1_ACK_O,                     -- ObjectKind=Pin|PrimaryId=UART_1-ACK_O
        ADR_I => NamedSignal_WB_INTERCON_1_M9_S0_UART_1_ADR, -- ObjectKind=Pin|PrimaryId=UART_1-ADR_I[3..0]
        CLK_I => NamedSignal_CLK_I,                          -- ObjectKind=Pin|PrimaryId=UART_1-CLK_I
        CTS   => UART_1_CTS,                                 -- ObjectKind=Pin|PrimaryId=UART_1-CTS
        CYC_I => NamedSignal_WB_INTERCON_1_M9_S0_UART_1_CYC, -- ObjectKind=Pin|PrimaryId=UART_1-CYC_I
        DAT_I => NamedSignal_WB_INTERCON_1_M9_S0_UART_1_DATIO, -- ObjectKind=Pin|PrimaryId=UART_1-DAT_I[7..0]
        DAT_O => PinSignal_UART_1_DAT_O,                     -- ObjectKind=Pin|PrimaryId=UART_1-DAT_O[7..0]
        INT_O => PinSignal_UART_1_INT_O,                     -- ObjectKind=Pin|PrimaryId=UART_1-INT_O[1..0]
        RST_I => NamedSignal_RST_I,                          -- ObjectKind=Pin|PrimaryId=UART_1-RST_I
        RTS   => PinSignal_UART_1_RTS,                       -- ObjectKind=Pin|PrimaryId=UART_1-RTS
        RXD   => UART_1_RXD,                                 -- ObjectKind=Pin|PrimaryId=UART_1-RXD
        STB_I => NamedSignal_WB_INTERCON_1_M9_S0_UART_1_STB, -- ObjectKind=Pin|PrimaryId=UART_1-STB_I
        TXD   => PinSignal_UART_1_TXD,                       -- ObjectKind=Pin|PrimaryId=UART_1-TXD
        WE_I  => NamedSignal_WB_INTERCON_1_M9_S0_UART_1_WE   -- ObjectKind=Pin|PrimaryId=UART_1-WE_I
      );

    TERMINATOR_1 : Configurable_TERMINATOR_1                 -- ObjectKind=Part|PrimaryId=TERMINATOR_1|SecondaryId=1
      Port Map
      (
        ACK_O => PinSignal_TERMINATOR_1_ACK_O,               -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-ACK_O
        ADR_I => NamedSignal_MCU_M0_S0_TERMINATOR_1_ADR,     -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-ADR_I[31..0]
        CYC_I => NamedSignal_MCU_M0_S0_TERMINATOR_1_CYC,     -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-CYC_I
        DAT_I => NamedSignal_MCU_M0_S0_TERMINATOR_1_DATIO,   -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-DAT_I[31..0]
        DAT_O => PinSignal_TERMINATOR_1_DAT_O,               -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-DAT_O[31..0]
        SEL_I => NamedSignal_MCU_M0_S0_TERMINATOR_1_SEL,     -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-SEL_I[3..0]
        STB_I => NamedSignal_MCU_M0_S0_TERMINATOR_1_STB,     -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-STB_I
        WE_I  => NamedSignal_MCU_M0_S0_TERMINATOR_1_WE       -- ObjectKind=Pin|PrimaryId=TERMINATOR_1-WE_I
      );

    PWM_3 : WB_PWMX                                          -- ObjectKind=Part|PrimaryId=PWM_3|SecondaryId=1
      Port Map
      (
        ACK_O => PinSignal_PWM_3_ACK_O,                      -- ObjectKind=Pin|PrimaryId=PWM_3-ACK_O
        ADR_I => NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_ADR,  -- ObjectKind=Pin|PrimaryId=PWM_3-ADR_I[2..0]
        CLK_I => NamedSignal_CLK_I,                          -- ObjectKind=Pin|PrimaryId=PWM_3-CLK_I
        CYC_I => NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_CYC,  -- ObjectKind=Pin|PrimaryId=PWM_3-CYC_I
        DAT_I => NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_DATIO, -- ObjectKind=Pin|PrimaryId=PWM_3-DAT_I[7..0]
        DAT_O => PinSignal_PWM_3_DAT_O,                      -- ObjectKind=Pin|PrimaryId=PWM_3-DAT_O[7..0]
        INT_O => PinSignal_PWM_3_INT_O,                      -- ObjectKind=Pin|PrimaryId=PWM_3-INT_O
        PWMN  => PinSignal_PWM_3_PWMN,                       -- ObjectKind=Pin|PrimaryId=PWM_3-PWMN
        PWMP  => PinSignal_PWM_3_PWMP,                       -- ObjectKind=Pin|PrimaryId=PWM_3-PWMP
        RST_I => NamedSignal_RST_I,                          -- ObjectKind=Pin|PrimaryId=PWM_3-RST_I
        STB_I => NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_STB,  -- ObjectKind=Pin|PrimaryId=PWM_3-STB_I
        WE_I  => NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_WE    -- ObjectKind=Pin|PrimaryId=PWM_3-WE_I
      );

    PWM_2 : WB_PWMX                                          -- ObjectKind=Part|PrimaryId=PWM_2|SecondaryId=1
      Port Map
      (
        ACK_O => PinSignal_PWM_2_ACK_O,                      -- ObjectKind=Pin|PrimaryId=PWM_2-ACK_O
        ADR_I => NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_ADR,  -- ObjectKind=Pin|PrimaryId=PWM_2-ADR_I[2..0]
        CLK_I => NamedSignal_CLK_I,                          -- ObjectKind=Pin|PrimaryId=PWM_2-CLK_I
        CYC_I => NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_CYC,  -- ObjectKind=Pin|PrimaryId=PWM_2-CYC_I
        DAT_I => NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_DATIO, -- ObjectKind=Pin|PrimaryId=PWM_2-DAT_I[7..0]
        DAT_O => PinSignal_PWM_2_DAT_O,                      -- ObjectKind=Pin|PrimaryId=PWM_2-DAT_O[7..0]
        INT_O => PinSignal_PWM_2_INT_O,                      -- ObjectKind=Pin|PrimaryId=PWM_2-INT_O
        PWMN  => PinSignal_PWM_2_PWMN,                       -- ObjectKind=Pin|PrimaryId=PWM_2-PWMN
        PWMP  => PinSignal_PWM_2_PWMP,                       -- ObjectKind=Pin|PrimaryId=PWM_2-PWMP
        RST_I => NamedSignal_RST_I,                          -- ObjectKind=Pin|PrimaryId=PWM_2-RST_I
        STB_I => NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_STB,  -- ObjectKind=Pin|PrimaryId=PWM_2-STB_I
        WE_I  => NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_WE    -- ObjectKind=Pin|PrimaryId=PWM_2-WE_I
      );

    PWM_1 : WB_PWMX                                          -- ObjectKind=Part|PrimaryId=PWM_1|SecondaryId=1
      Port Map
      (
        ACK_O => PinSignal_PWM_1_ACK_O,                      -- ObjectKind=Pin|PrimaryId=PWM_1-ACK_O
        ADR_I => NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_ADR,  -- ObjectKind=Pin|PrimaryId=PWM_1-ADR_I[2..0]
        CLK_I => NamedSignal_CLK_I,                          -- ObjectKind=Pin|PrimaryId=PWM_1-CLK_I
        CYC_I => NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_CYC,  -- ObjectKind=Pin|PrimaryId=PWM_1-CYC_I
        DAT_I => NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_DATIO, -- ObjectKind=Pin|PrimaryId=PWM_1-DAT_I[7..0]
        DAT_O => PinSignal_PWM_1_DAT_O,                      -- ObjectKind=Pin|PrimaryId=PWM_1-DAT_O[7..0]
        INT_O => PinSignal_PWM_1_INT_O,                      -- ObjectKind=Pin|PrimaryId=PWM_1-INT_O
        PWMN  => PinSignal_PWM_1_PWMN,                       -- ObjectKind=Pin|PrimaryId=PWM_1-PWMN
        PWMP  => PinSignal_PWM_1_PWMP,                       -- ObjectKind=Pin|PrimaryId=PWM_1-PWMP
        RST_I => NamedSignal_RST_I,                          -- ObjectKind=Pin|PrimaryId=PWM_1-RST_I
        STB_I => NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_STB,  -- ObjectKind=Pin|PrimaryId=PWM_1-STB_I
        WE_I  => NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_WE    -- ObjectKind=Pin|PrimaryId=PWM_1-WE_I
      );

    MCU_LO : J16S_16B                                        -- ObjectKind=Part|PrimaryId=MCU_LO|SecondaryId=1
      Port Map
      (
        I0  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I0
        I1  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I1
        I2  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I2
        I3  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I3
        I4  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I4
        I5  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I5
        I6  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I6
        I7  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I7
        I8  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I8
        I9  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I9
        I10 => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I10
        I11 => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I11
        I12 => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I12
        I13 => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I13
        I14 => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I14
        I15 => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_LO-I15
        O   => PinSignal_MCU_LO_O                            -- ObjectKind=Pin|PrimaryId=MCU_LO-O[15..0]
      );

    MCU_HI : J16S_16B                                        -- ObjectKind=Part|PrimaryId=MCU_HI|SecondaryId=1
      Port Map
      (
        I0  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I0
        I1  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I1
        I2  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I2
        I3  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I3
        I4  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I4
        I5  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I5
        I6  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I6
        I7  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I7
        I8  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I8
        I9  => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I9
        I10 => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I10
        I11 => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I11
        I12 => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I12
        I13 => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I13
        I14 => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I14
        I15 => PowerSignal_GND,                              -- ObjectKind=Pin|PrimaryId=MCU_HI-I15
        O   => PinSignal_MCU_HI_O                            -- ObjectKind=Pin|PrimaryId=MCU_HI-O[15..0]
      );

    MCU : Configurable_MCU                                   -- ObjectKind=Part|PrimaryId=MCU|SecondaryId=1
      Port Map
      (
        CLK_I    => CLK_I,                                   -- ObjectKind=Pin|PrimaryId=MCU-CLK_I
        INT_I    => NamedSignal_INTERRUPT_MCU_INT_I,         -- ObjectKind=Pin|PrimaryId=MCU-INT_I[31..0]
        IO_ACK_I => NamedSignal_MCU_M1_S0_WB_INTERCON_1_ACK, -- ObjectKind=Pin|PrimaryId=MCU-IO_ACK_I
        IO_ADR_O => PinSignal_MCU_IO_ADR_O,                  -- ObjectKind=Pin|PrimaryId=MCU-IO_ADR_O[23..0]
        IO_CYC_O => PinSignal_MCU_IO_CYC_O,                  -- ObjectKind=Pin|PrimaryId=MCU-IO_CYC_O
        IO_DAT_I => NamedSignal_MCU_M1_S0_WB_INTERCON_1_DATOI, -- ObjectKind=Pin|PrimaryId=MCU-IO_DAT_I[31..0]
        IO_DAT_O => PinSignal_MCU_IO_DAT_O,                  -- ObjectKind=Pin|PrimaryId=MCU-IO_DAT_O[31..0]
        IO_SEL_O => PinSignal_MCU_IO_SEL_O,                  -- ObjectKind=Pin|PrimaryId=MCU-IO_SEL_O[3..0]
        IO_STB_O => PinSignal_MCU_IO_STB_O,                  -- ObjectKind=Pin|PrimaryId=MCU-IO_STB_O
        IO_WE_O  => PinSignal_MCU_IO_WE_O,                   -- ObjectKind=Pin|PrimaryId=MCU-IO_WE_O
        ME_ACK_I => NamedSignal_MCU_M0_S0_TERMINATOR_1_ACK,  -- ObjectKind=Pin|PrimaryId=MCU-ME_ACK_I
        ME_ADR_O => PinSignal_MCU_ME_ADR_O,                  -- ObjectKind=Pin|PrimaryId=MCU-ME_ADR_O[31..0]
        ME_CYC_O => PinSignal_MCU_ME_CYC_O,                  -- ObjectKind=Pin|PrimaryId=MCU-ME_CYC_O
        ME_DAT_I => NamedSignal_MCU_M0_S0_TERMINATOR_1_DATOI, -- ObjectKind=Pin|PrimaryId=MCU-ME_DAT_I[31..0]
        ME_DAT_O => PinSignal_MCU_ME_DAT_O,                  -- ObjectKind=Pin|PrimaryId=MCU-ME_DAT_O[31..0]
        ME_SEL_O => PinSignal_MCU_ME_SEL_O,                  -- ObjectKind=Pin|PrimaryId=MCU-ME_SEL_O[3..0]
        ME_STB_O => PinSignal_MCU_ME_STB_O,                  -- ObjectKind=Pin|PrimaryId=MCU-ME_STB_O
        ME_WE_O  => PinSignal_MCU_ME_WE_O,                   -- ObjectKind=Pin|PrimaryId=MCU-ME_WE_O
        RST_I    => RST_I,                                   -- ObjectKind=Pin|PrimaryId=MCU-RST_I
        TCK      => JTAG_NEXUS_TCK,                          -- ObjectKind=Pin|PrimaryId=MCU-TCK
        TDI      => JTAG_NEXUS_TDI,                          -- ObjectKind=Pin|PrimaryId=MCU-TDI
        TDO      => PinSignal_MCU_TDO,                       -- ObjectKind=Pin|PrimaryId=MCU-TDO
        TMS      => JTAG_NEXUS_TMS,                          -- ObjectKind=Pin|PrimaryId=MCU-TMS
        TRST     => JTAG_NEXUS_TRST                          -- ObjectKind=Pin|PrimaryId=MCU-TRST
      );

    GPIO_1 : Configurable_GPIO_1                             -- ObjectKind=Part|PrimaryId=GPIO_1|SecondaryId=1
      Port Map
      (
        ACK_O => PinSignal_GPIO_1_ACK_O,                     -- ObjectKind=Pin|PrimaryId=GPIO_1-ACK_O
        ADC   => PinSignal_GPIO_1_ADC,                       -- ObjectKind=Pin|PrimaryId=GPIO_1-ADC[7..0]
        ADR_I => NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_ADR, -- ObjectKind=Pin|PrimaryId=GPIO_1-ADR_I[1..0]
        CLK_I => NamedSignal_CLK_I,                          -- ObjectKind=Pin|PrimaryId=GPIO_1-CLK_I
        CYC_I => NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_CYC, -- ObjectKind=Pin|PrimaryId=GPIO_1-CYC_I
        DAT_I => NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_DATIO, -- ObjectKind=Pin|PrimaryId=GPIO_1-DAT_I[7..0]
        DAT_O => PinSignal_GPIO_1_DAT_O,                     -- ObjectKind=Pin|PrimaryId=GPIO_1-DAT_O[7..0]
        DI    => GPIO_1_DI,                                  -- ObjectKind=Pin|PrimaryId=GPIO_1-DI[7..0]
        DO_I  => GPIO_1_DO_I,                                -- ObjectKind=Pin|PrimaryId=GPIO_1-DO_I[7..0]
        DO_O  => PinSignal_GPIO_1_DO_O,                      -- ObjectKind=Pin|PrimaryId=GPIO_1-DO_O[7..0]
        RST_I => NamedSignal_RST_I,                          -- ObjectKind=Pin|PrimaryId=GPIO_1-RST_I
        STB_I => NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_STB, -- ObjectKind=Pin|PrimaryId=GPIO_1-STB_I
        WE_I  => NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_WE   -- ObjectKind=Pin|PrimaryId=GPIO_1-WE_I
      );

    FLASH_1 : Configurable_FLASH_1                           -- ObjectKind=Part|PrimaryId=FLASH_1|SecondaryId=1
      Port Map
      (
        ACK_O    => PinSignal_FLASH_1_ACK_O,                 -- ObjectKind=Pin|PrimaryId=FLASH_1-ACK_O
        ADR_I    => NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_ADR, -- ObjectKind=Pin|PrimaryId=FLASH_1-ADR_I[2..0]
        CLK_I    => NamedSignal_CLK_I,                       -- ObjectKind=Pin|PrimaryId=FLASH_1-CLK_I
        CYC_I    => NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_CYC, -- ObjectKind=Pin|PrimaryId=FLASH_1-CYC_I
        DAT_I    => NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_DATIO, -- ObjectKind=Pin|PrimaryId=FLASH_1-DAT_I[31..0]
        DAT_O    => PinSignal_FLASH_1_DAT_O,                 -- ObjectKind=Pin|PrimaryId=FLASH_1-DAT_O[31..0]
        RST_I    => NamedSignal_RST_I,                       -- ObjectKind=Pin|PrimaryId=FLASH_1-RST_I
        SPI_CLK  => PinSignal_FLASH_1_SPI_CLK,               -- ObjectKind=Pin|PrimaryId=FLASH_1-SPI_CLK
        SPI_CS   => PinSignal_FLASH_1_SPI_CS,                -- ObjectKind=Pin|PrimaryId=FLASH_1-SPI_CS
        SPI_DIN  => FLASH_1_SPI_DIN,                         -- ObjectKind=Pin|PrimaryId=FLASH_1-SPI_DIN
        SPI_DOUT => PinSignal_FLASH_1_SPI_DOUT,              -- ObjectKind=Pin|PrimaryId=FLASH_1-SPI_DOUT
        STB_I    => NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_STB, -- ObjectKind=Pin|PrimaryId=FLASH_1-STB_I
        WE_I     => NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_WE -- ObjectKind=Pin|PrimaryId=FLASH_1-WE_I
      );

    ENC_3 : Configurable_ENC_3                               -- ObjectKind=Part|PrimaryId=ENC_3|SecondaryId=1
      Port Map
      (
        ACK_O => PinSignal_ENC_3_ACK_O,                      -- ObjectKind=Pin|PrimaryId=ENC_3-ACK_O
        C_I   => ENC_3_C_I,                                  -- ObjectKind=Pin|PrimaryId=ENC_3-C_I[15..0]
        CLK_I => NamedSignal_CLK_I,                          -- ObjectKind=Pin|PrimaryId=ENC_3-CLK_I
        CYC_I => NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_CYC,  -- ObjectKind=Pin|PrimaryId=ENC_3-CYC_I
        DAT_O => PinSignal_ENC_3_DAT_O,                      -- ObjectKind=Pin|PrimaryId=ENC_3-DAT_O[15..0]
        RST_I => NamedSignal_RST_I,                          -- ObjectKind=Pin|PrimaryId=ENC_3-RST_I
        STB_I => NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_STB,  -- ObjectKind=Pin|PrimaryId=ENC_3-STB_I
        WE_I  => NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_WE    -- ObjectKind=Pin|PrimaryId=ENC_3-WE_I
      );

    ENC_2 : Configurable_ENC_2                               -- ObjectKind=Part|PrimaryId=ENC_2|SecondaryId=1
      Port Map
      (
        ACK_O => PinSignal_ENC_2_ACK_O,                      -- ObjectKind=Pin|PrimaryId=ENC_2-ACK_O
        C_I   => ENC_2_C_I,                                  -- ObjectKind=Pin|PrimaryId=ENC_2-C_I[15..0]
        CLK_I => NamedSignal_CLK_I,                          -- ObjectKind=Pin|PrimaryId=ENC_2-CLK_I
        CYC_I => NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_CYC,  -- ObjectKind=Pin|PrimaryId=ENC_2-CYC_I
        DAT_O => PinSignal_ENC_2_DAT_O,                      -- ObjectKind=Pin|PrimaryId=ENC_2-DAT_O[15..0]
        RST_I => NamedSignal_RST_I,                          -- ObjectKind=Pin|PrimaryId=ENC_2-RST_I
        STB_I => NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_STB,  -- ObjectKind=Pin|PrimaryId=ENC_2-STB_I
        WE_I  => NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_WE    -- ObjectKind=Pin|PrimaryId=ENC_2-WE_I
      );

    ENC_1 : Configurable_ENC_1                               -- ObjectKind=Part|PrimaryId=ENC_1|SecondaryId=1
      Port Map
      (
        ACK_O => PinSignal_ENC_1_ACK_O,                      -- ObjectKind=Pin|PrimaryId=ENC_1-ACK_O
        C_I   => ENC_1_C_I,                                  -- ObjectKind=Pin|PrimaryId=ENC_1-C_I[15..0]
        CLK_I => NamedSignal_CLK_I,                          -- ObjectKind=Pin|PrimaryId=ENC_1-CLK_I
        CYC_I => NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_CYC,  -- ObjectKind=Pin|PrimaryId=ENC_1-CYC_I
        DAT_O => PinSignal_ENC_1_DAT_O,                      -- ObjectKind=Pin|PrimaryId=ENC_1-DAT_O[15..0]
        RST_I => NamedSignal_RST_I,                          -- ObjectKind=Pin|PrimaryId=ENC_1-RST_I
        STB_I => NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_STB,  -- ObjectKind=Pin|PrimaryId=ENC_1-STB_I
        WE_I  => NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_WE    -- ObjectKind=Pin|PrimaryId=ENC_1-WE_I
      );

    EC_1 : Configurable_EC_1                                 -- ObjectKind=Part|PrimaryId=EC_1|SecondaryId=1
      Port Map
      (
        ACK_O    => PinSignal_EC_1_ACK_O,                    -- ObjectKind=Pin|PrimaryId=EC_1-ACK_O
        ADR_I    => NamedSignal_WB_INTERCON_1_M0_S0_EC_1_ADR, -- ObjectKind=Pin|PrimaryId=EC_1-ADR_I[2..0]
        CLK_I    => NamedSignal_CLK_I,                       -- ObjectKind=Pin|PrimaryId=EC_1-CLK_I
        CYC_I    => NamedSignal_WB_INTERCON_1_M0_S0_EC_1_CYC, -- ObjectKind=Pin|PrimaryId=EC_1-CYC_I
        DAT_I    => NamedSignal_WB_INTERCON_1_M0_S0_EC_1_DATIO, -- ObjectKind=Pin|PrimaryId=EC_1-DAT_I[31..0]
        DAT_O    => PinSignal_EC_1_DAT_O,                    -- ObjectKind=Pin|PrimaryId=EC_1-DAT_O[31..0]
        RST_I    => NamedSignal_RST_I,                       -- ObjectKind=Pin|PrimaryId=EC_1-RST_I
        SPI_CLK  => PinSignal_EC_1_SPI_CLK,                  -- ObjectKind=Pin|PrimaryId=EC_1-SPI_CLK
        SPI_CS   => PinSignal_EC_1_SPI_CS,                   -- ObjectKind=Pin|PrimaryId=EC_1-SPI_CS
        SPI_DIN  => EC_1_SPI_DIN,                            -- ObjectKind=Pin|PrimaryId=EC_1-SPI_DIN
        SPI_DOUT => PinSignal_EC_1_SPI_DOUT,                 -- ObjectKind=Pin|PrimaryId=EC_1-SPI_DOUT
        STB_I    => NamedSignal_WB_INTERCON_1_M0_S0_EC_1_STB, -- ObjectKind=Pin|PrimaryId=EC_1-STB_I
        WE_I     => NamedSignal_WB_INTERCON_1_M0_S0_EC_1_WE  -- ObjectKind=Pin|PrimaryId=EC_1-WE_I
      );

    DAC_1 : Configurable_DAC_1                               -- ObjectKind=Part|PrimaryId=DAC_1|SecondaryId=1
      Port Map
      (
        ACK_O    => PinSignal_DAC_1_ACK_O,                   -- ObjectKind=Pin|PrimaryId=DAC_1-ACK_O
        ADR_I    => NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_ADR, -- ObjectKind=Pin|PrimaryId=DAC_1-ADR_I[2..0]
        CLK_I    => NamedSignal_CLK_I,                       -- ObjectKind=Pin|PrimaryId=DAC_1-CLK_I
        CYC_I    => NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_CYC, -- ObjectKind=Pin|PrimaryId=DAC_1-CYC_I
        DAT_I    => NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_DATIO, -- ObjectKind=Pin|PrimaryId=DAC_1-DAT_I[31..0]
        DAT_O    => PinSignal_DAC_1_DAT_O,                   -- ObjectKind=Pin|PrimaryId=DAC_1-DAT_O[31..0]
        RST_I    => NamedSignal_RST_I,                       -- ObjectKind=Pin|PrimaryId=DAC_1-RST_I
        SPI_CLK  => PinSignal_DAC_1_SPI_CLK,                 -- ObjectKind=Pin|PrimaryId=DAC_1-SPI_CLK
        SPI_CS   => PinSignal_DAC_1_SPI_CS,                  -- ObjectKind=Pin|PrimaryId=DAC_1-SPI_CS
        SPI_DIN  => DAC_1_SPI_DIN,                           -- ObjectKind=Pin|PrimaryId=DAC_1-SPI_DIN
        SPI_DOUT => PinSignal_DAC_1_SPI_DOUT,                -- ObjectKind=Pin|PrimaryId=DAC_1-SPI_DOUT
        STB_I    => NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_STB, -- ObjectKind=Pin|PrimaryId=DAC_1-STB_I
        WE_I     => NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_WE -- ObjectKind=Pin|PrimaryId=DAC_1-WE_I
      );

    ADC_1 : Configurable_ADC_1                               -- ObjectKind=Part|PrimaryId=ADC_1|SecondaryId=1
      Port Map
      (
        ACK_O  => PinSignal_ADC_1_ACK_O,                     -- ObjectKind=Pin|PrimaryId=ADC_1-ACK_O
        CLK_I  => NamedSignal_CLK_I,                         -- ObjectKind=Pin|PrimaryId=ADC_1-CLK_I
        CYC_I  => NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_CYC, -- ObjectKind=Pin|PrimaryId=ADC_1-CYC_I
        DAT_O  => PinSignal_ADC_1_DAT_O,                     -- ObjectKind=Pin|PrimaryId=ADC_1-DAT_O[15..0]
        DATA_I => ADC_1_DATA_I,                              -- ObjectKind=Pin|PrimaryId=ADC_1-DATA_I[15..0]
        RST_I  => NamedSignal_RST_I,                         -- ObjectKind=Pin|PrimaryId=ADC_1-RST_I
        STB_I  => NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_STB, -- ObjectKind=Pin|PrimaryId=ADC_1-STB_I
        WE_I   => NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_WE   -- ObjectKind=Pin|PrimaryId=ADC_1-WE_I
      );

    -- Signal Assignments
    ---------------------
    DAC_1_SPI_CLK                                  <= PinSignal_DAC_1_SPI_CLK; -- ObjectKind=Net|PrimaryId=DAC_1_SPI_CLK
    DAC_1_SPI_CS                                   <= PinSignal_DAC_1_SPI_CS; -- ObjectKind=Net|PrimaryId=DAC_1_SPI_CS
    DAC_1_SPI_DOUT                                 <= PinSignal_DAC_1_SPI_DOUT; -- ObjectKind=Net|PrimaryId=DAC_1_SPI_DOUT
    EC_1_SPI_CLK                                   <= PinSignal_EC_1_SPI_CLK; -- ObjectKind=Net|PrimaryId=EC_1_SPI_CLK
    EC_1_SPI_CS                                    <= PinSignal_EC_1_SPI_CS; -- ObjectKind=Net|PrimaryId=EC_1_SPI_CS
    EC_1_SPI_DOUT                                  <= PinSignal_EC_1_SPI_DOUT; -- ObjectKind=Net|PrimaryId=EC_1_SPI_DOUT
    FLASH_1_SPI_CLK                                <= PinSignal_FLASH_1_SPI_CLK; -- ObjectKind=Net|PrimaryId=FLASH_1_SPI_CLK
    FLASH_1_SPI_CS                                 <= PinSignal_FLASH_1_SPI_CS; -- ObjectKind=Net|PrimaryId=FLASH_1_SPI_CS
    FLASH_1_SPI_DOUT                               <= PinSignal_FLASH_1_SPI_DOUT; -- ObjectKind=Net|PrimaryId=FLASH_1_SPI_DOUT
    GPIO_1_ADC                                     <= PinSignal_GPIO_1_ADC; -- ObjectKind=Net|PrimaryId=GPIO_1_ADC[7..0]
    GPIO_1_DO_O                                    <= PinSignal_GPIO_1_DO_O; -- ObjectKind=Net|PrimaryId=GPIO_1_DO_O[7..0]
    JTAG_NEXUS_TDO                                 <= PinSignal_MCU_TDO; -- ObjectKind=Net|PrimaryId=NetMCU_TDO
    NamedSignal_CLK_I                              <= CLK_I; -- ObjectKind=Net|PrimaryId=CLK_I
    NamedSignal_GND1_BUS                           <= "0000"; -- ObjectKind=Net|PrimaryId=GND1_BUS[3..0]
    NamedSignal_GND10_BUS                          <= "0000"; -- ObjectKind=Net|PrimaryId=GND10_BUS[3..0]
    NamedSignal_GND11_BUS                          <= "0000"; -- ObjectKind=Net|PrimaryId=GND11_BUS[3..0]
    NamedSignal_GND12_BUS                          <= "0000"; -- ObjectKind=Net|PrimaryId=GND12_BUS[3..0]
    NamedSignal_GND2_BUS                           <= "0000"; -- ObjectKind=Net|PrimaryId=GND2_BUS[3..0]
    NamedSignal_GND3_BUS                           <= "0000"; -- ObjectKind=Net|PrimaryId=GND3_BUS[3..0]
    NamedSignal_GND4_BUS                           <= "0000"; -- ObjectKind=Net|PrimaryId=GND4_BUS[3..0]
    NamedSignal_GND5_BUS                           <= "0000"; -- ObjectKind=Net|PrimaryId=GND5_BUS[3..0]
    NamedSignal_GND6_BUS                           <= "0000"; -- ObjectKind=Net|PrimaryId=GND6_BUS[3..0]
    NamedSignal_GND7_BUS                           <= "0000"; -- ObjectKind=Net|PrimaryId=GND7_BUS[3..0]
    NamedSignal_GND8_BUS                           <= "0000"; -- ObjectKind=Net|PrimaryId=GND8_BUS[3..0]
    NamedSignal_GND9_BUS                           <= "0000"; -- ObjectKind=Net|PrimaryId=GND9_BUS[3..0]
    NamedSignal_INTERRUPT_MCU_INT_I(15 downto 0)   <= PinSignal_MCU_LO_O; -- ObjectKind=Net|PrimaryId=INTERRUPT_MCU_INT_I[15..0]
    NamedSignal_INTERRUPT_MCU_INT_I(31 downto 16)  <= PinSignal_MCU_HI_O; -- ObjectKind=Net|PrimaryId=INTERRUPT_MCU_INT_I[31..0]
    NamedSignal_MCU_M0_S0_TERMINATOR_1_ACK         <= PinSignal_TERMINATOR_1_ACK_O; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_ACK
    NamedSignal_MCU_M0_S0_TERMINATOR_1_ADR         <= PinSignal_MCU_ME_ADR_O; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_ADR[31..0]
    NamedSignal_MCU_M0_S0_TERMINATOR_1_CYC         <= PinSignal_MCU_ME_CYC_O; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_CYC
    NamedSignal_MCU_M0_S0_TERMINATOR_1_DATIO       <= PinSignal_MCU_ME_DAT_O; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_DATIO[31..0]
    NamedSignal_MCU_M0_S0_TERMINATOR_1_DATOI       <= PinSignal_TERMINATOR_1_DAT_O; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_DATOI[31..0]
    NamedSignal_MCU_M0_S0_TERMINATOR_1_SEL         <= PinSignal_MCU_ME_SEL_O; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_SEL[3..0]
    NamedSignal_MCU_M0_S0_TERMINATOR_1_STB         <= PinSignal_MCU_ME_STB_O; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_STB
    NamedSignal_MCU_M0_S0_TERMINATOR_1_WE          <= PinSignal_MCU_ME_WE_O; -- ObjectKind=Net|PrimaryId=MCU_M0_S0_TERMINATOR_1_WE
    NamedSignal_MCU_M1_S0_WB_INTERCON_1_ACK        <= PinSignal_WB_INTERCON_1_m0_ACK_O; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_ACK
    NamedSignal_MCU_M1_S0_WB_INTERCON_1_ADR        <= PinSignal_MCU_IO_ADR_O; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_ADR[23..0]
    NamedSignal_MCU_M1_S0_WB_INTERCON_1_CYC        <= PinSignal_MCU_IO_CYC_O; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_CYC
    NamedSignal_MCU_M1_S0_WB_INTERCON_1_DATIO      <= PinSignal_MCU_IO_DAT_O; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_DATIO[31..0]
    NamedSignal_MCU_M1_S0_WB_INTERCON_1_DATOI      <= PinSignal_WB_INTERCON_1_m0_DAT_O; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_DATOI[31..0]
    NamedSignal_MCU_M1_S0_WB_INTERCON_1_SEL        <= PinSignal_MCU_IO_SEL_O; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_SEL[3..0]
    NamedSignal_MCU_M1_S0_WB_INTERCON_1_STB        <= PinSignal_MCU_IO_STB_O; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_STB
    NamedSignal_MCU_M1_S0_WB_INTERCON_1_WE         <= PinSignal_MCU_IO_WE_O; -- ObjectKind=Net|PrimaryId=MCU_M1_S0_WB_INTERCON_1_WE
    NamedSignal_RST_I                              <= RST_I; -- ObjectKind=Net|PrimaryId=RST_I
    NamedSignal_WB_INTERCON_1_M0_S0_EC_1_ACK       <= PinSignal_EC_1_ACK_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_ACK
    NamedSignal_WB_INTERCON_1_M0_S0_EC_1_ADR       <= PinSignal_WB_INTERCON_1_s0_ADR_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_ADR[2..0]
    NamedSignal_WB_INTERCON_1_M0_S0_EC_1_CYC       <= PinSignal_WB_INTERCON_1_s0_CYC_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_CYC
    NamedSignal_WB_INTERCON_1_M0_S0_EC_1_DATIO     <= PinSignal_WB_INTERCON_1_s0_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_DATIO[31..0]
    NamedSignal_WB_INTERCON_1_M0_S0_EC_1_DATOI     <= PinSignal_EC_1_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_DATOI[31..0]
    NamedSignal_WB_INTERCON_1_M0_S0_EC_1_STB       <= PinSignal_WB_INTERCON_1_s0_STB_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_STB
    NamedSignal_WB_INTERCON_1_M0_S0_EC_1_WE        <= PinSignal_WB_INTERCON_1_s0_WE_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M0_S0_EC_1_WE
    NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_ACK     <= PinSignal_GPIO_1_ACK_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_ACK
    NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_ADR     <= PinSignal_WB_INTERCON_1_s1_ADR_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_ADR[1..0]
    NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_CYC     <= PinSignal_WB_INTERCON_1_s1_CYC_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_CYC
    NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_DATIO   <= PinSignal_WB_INTERCON_1_s1_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_DATIO[7..0]
    NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_DATOI   <= PinSignal_GPIO_1_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_DATOI[7..0]
    NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_STB     <= PinSignal_WB_INTERCON_1_s1_STB_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_STB
    NamedSignal_WB_INTERCON_1_M1_S0_GPIO_1_WE      <= PinSignal_WB_INTERCON_1_s1_WE_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M1_S0_GPIO_1_WE
    NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_ACK     <= PinSignal_DAC_1_ACK_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_ACK
    NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_ADR     <= PinSignal_WB_INTERCON_1_s10_ADR_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_ADR[2..0]
    NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_CYC     <= PinSignal_WB_INTERCON_1_s10_CYC_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_CYC
    NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_DATIO   <= PinSignal_WB_INTERCON_1_s10_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_DATIO[31..0]
    NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_DATOI   <= PinSignal_DAC_1_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_DATOI[31..0]
    NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_STB     <= PinSignal_WB_INTERCON_1_s10_STB_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_STB
    NamedSignal_WB_INTERCON_1_M10_S0_DAC_1_WE      <= PinSignal_WB_INTERCON_1_s10_WE_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M10_S0_DAC_1_WE
    NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_ACK   <= PinSignal_FLASH_1_ACK_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_ACK
    NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_ADR   <= PinSignal_WB_INTERCON_1_s11_ADR_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_ADR[2..0]
    NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_CYC   <= PinSignal_WB_INTERCON_1_s11_CYC_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_CYC
    NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_DATIO <= PinSignal_WB_INTERCON_1_s11_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_DATIO[31..0]
    NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_DATOI <= PinSignal_FLASH_1_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_DATOI[31..0]
    NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_STB   <= PinSignal_WB_INTERCON_1_s11_STB_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_STB
    NamedSignal_WB_INTERCON_1_M11_S0_FLASH_1_WE    <= PinSignal_WB_INTERCON_1_s11_WE_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M11_S0_FLASH_1_WE
    NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_ACK      <= PinSignal_ENC_1_ACK_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_ACK
    NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_CYC      <= PinSignal_WB_INTERCON_1_s2_CYC_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_CYC
    NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_DATOI    <= PinSignal_ENC_1_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_DATOI[15..0]
    NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_STB      <= PinSignal_WB_INTERCON_1_s2_STB_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_STB
    NamedSignal_WB_INTERCON_1_M2_S0_ENC_1_WE       <= PinSignal_WB_INTERCON_1_s2_WE_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M2_S0_ENC_1_WE
    NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_ACK      <= PinSignal_ENC_3_ACK_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_ACK
    NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_CYC      <= PinSignal_WB_INTERCON_1_s3_CYC_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_CYC
    NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_DATOI    <= PinSignal_ENC_3_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_DATOI[15..0]
    NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_STB      <= PinSignal_WB_INTERCON_1_s3_STB_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_STB
    NamedSignal_WB_INTERCON_1_M3_S0_ENC_3_WE       <= PinSignal_WB_INTERCON_1_s3_WE_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M3_S0_ENC_3_WE
    NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_ACK      <= PinSignal_ENC_2_ACK_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_ACK
    NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_CYC      <= PinSignal_WB_INTERCON_1_s4_CYC_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_CYC
    NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_DATOI    <= PinSignal_ENC_2_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_DATOI[15..0]
    NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_STB      <= PinSignal_WB_INTERCON_1_s4_STB_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_STB
    NamedSignal_WB_INTERCON_1_M4_S0_ENC_2_WE       <= PinSignal_WB_INTERCON_1_s4_WE_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M4_S0_ENC_2_WE
    NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_ACK      <= PinSignal_PWM_3_ACK_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_ACK
    NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_ADR      <= PinSignal_WB_INTERCON_1_s5_ADR_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_ADR[2..0]
    NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_CYC      <= PinSignal_WB_INTERCON_1_s5_CYC_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_CYC
    NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_DATIO    <= PinSignal_WB_INTERCON_1_s5_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_DATIO[7..0]
    NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_DATOI    <= PinSignal_PWM_3_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_DATOI[7..0]
    NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_STB      <= PinSignal_WB_INTERCON_1_s5_STB_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_STB
    NamedSignal_WB_INTERCON_1_M5_S0_PWM_3_WE       <= PinSignal_WB_INTERCON_1_s5_WE_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M5_S0_PWM_3_WE
    NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_ACK      <= PinSignal_PWM_1_ACK_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_ACK
    NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_ADR      <= PinSignal_WB_INTERCON_1_s6_ADR_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_ADR[2..0]
    NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_CYC      <= PinSignal_WB_INTERCON_1_s6_CYC_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_CYC
    NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_DATIO    <= PinSignal_WB_INTERCON_1_s6_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_DATIO[7..0]
    NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_DATOI    <= PinSignal_PWM_1_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_DATOI[7..0]
    NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_STB      <= PinSignal_WB_INTERCON_1_s6_STB_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_STB
    NamedSignal_WB_INTERCON_1_M6_S0_PWM_1_WE       <= PinSignal_WB_INTERCON_1_s6_WE_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M6_S0_PWM_1_WE
    NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_ACK      <= PinSignal_PWM_2_ACK_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_ACK
    NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_ADR      <= PinSignal_WB_INTERCON_1_s7_ADR_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_ADR[2..0]
    NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_CYC      <= PinSignal_WB_INTERCON_1_s7_CYC_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_CYC
    NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_DATIO    <= PinSignal_WB_INTERCON_1_s7_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_DATIO[7..0]
    NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_DATOI    <= PinSignal_PWM_2_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_DATOI[7..0]
    NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_STB      <= PinSignal_WB_INTERCON_1_s7_STB_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_STB
    NamedSignal_WB_INTERCON_1_M7_S0_PWM_2_WE       <= PinSignal_WB_INTERCON_1_s7_WE_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M7_S0_PWM_2_WE
    NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_ACK      <= PinSignal_ADC_1_ACK_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_ACK
    NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_CYC      <= PinSignal_WB_INTERCON_1_s8_CYC_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_CYC
    NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_DATOI    <= PinSignal_ADC_1_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_DATOI[15..0]
    NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_STB      <= PinSignal_WB_INTERCON_1_s8_STB_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_STB
    NamedSignal_WB_INTERCON_1_M8_S0_ADC_1_WE       <= PinSignal_WB_INTERCON_1_s8_WE_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M8_S0_ADC_1_WE
    NamedSignal_WB_INTERCON_1_M9_S0_UART_1_ACK     <= PinSignal_UART_1_ACK_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_ACK
    NamedSignal_WB_INTERCON_1_M9_S0_UART_1_ADR     <= PinSignal_WB_INTERCON_1_s9_ADR_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_ADR[3..0]
    NamedSignal_WB_INTERCON_1_M9_S0_UART_1_CYC     <= PinSignal_WB_INTERCON_1_s9_CYC_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_CYC
    NamedSignal_WB_INTERCON_1_M9_S0_UART_1_DATIO   <= PinSignal_WB_INTERCON_1_s9_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_DATIO[7..0]
    NamedSignal_WB_INTERCON_1_M9_S0_UART_1_DATOI   <= PinSignal_UART_1_DAT_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_DATOI[7..0]
    NamedSignal_WB_INTERCON_1_M9_S0_UART_1_STB     <= PinSignal_WB_INTERCON_1_s9_STB_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_STB
    NamedSignal_WB_INTERCON_1_M9_S0_UART_1_WE      <= PinSignal_WB_INTERCON_1_s9_WE_O; -- ObjectKind=Net|PrimaryId=WB_INTERCON_1_M9_S0_UART_1_WE
    PowerSignal_GND                                <= '0'; -- ObjectKind=Net|PrimaryId=GND
    PWM_1_PWMN                                     <= PinSignal_PWM_1_PWMN; -- ObjectKind=Net|PrimaryId=PWM_1_PWMN
    PWM_1_PWMP                                     <= PinSignal_PWM_1_PWMP; -- ObjectKind=Net|PrimaryId=PWM_1_PWMP
    PWM_2_PWMN                                     <= PinSignal_PWM_2_PWMN; -- ObjectKind=Net|PrimaryId=PWM_2_PWMN
    PWM_2_PWMP                                     <= PinSignal_PWM_2_PWMP; -- ObjectKind=Net|PrimaryId=PWM_2_PWMP
    PWM_3_PWMN                                     <= PinSignal_PWM_3_PWMN; -- ObjectKind=Net|PrimaryId=PWM_3_PWMN
    PWM_3_PWMP                                     <= PinSignal_PWM_3_PWMP; -- ObjectKind=Net|PrimaryId=PWM_3_PWMP
    UART_1_RTS                                     <= PinSignal_UART_1_RTS; -- ObjectKind=Net|PrimaryId=UART_1_RTS
    UART_1_TXD                                     <= PinSignal_UART_1_TXD; -- ObjectKind=Net|PrimaryId=UART_1_TXD

End Structure;
------------------------------------------------------------


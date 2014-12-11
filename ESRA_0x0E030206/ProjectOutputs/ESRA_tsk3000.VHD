------------------------------------------------------------
-- VHDL ESRA_tsk3000
-- 2014 12 4 15 6 41
-- Created By "DXP VHDL Generator"
-- "Copyright (c) 2002-2014 Altium Limited"
-- Product Version: 14.3.15.35511
------------------------------------------------------------

------------------------------------------------------------
-- VHDL ESRA_tsk3000
------------------------------------------------------------

Library IEEE;
Use     IEEE.std_logic_1164.all;

--synthesis translate_off
Library GENERIC_LIB;
Use     GENERIC_LIB.all;

--synthesis translate_on
Entity ESRA_tsk3000 Is
  port
  (
    CLK_BRD       : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=CLK_BRD
    DAC_CLR       : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=DAC_CLR
    DAC_LDAC      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=DAC_LDAC
    DAC_MISO      : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=DAC_MISO
    DAC_MOSI      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=DAC_MOSI
    DAC_SCK       : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=DAC_SCK
    DAC_SYNC      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=DAC_SYNC
    ECAT_CLK      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=ECAT_CLK
    ECAT_PERR0    : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=ECAT_PERR0
    ECAT_PERR1    : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=ECAT_PERR1
    ECAT_RESET    : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=ECAT_RESET
    ENC_1_XP      : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=ENC_1_XP
    ENC_1_YP      : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=ENC_1_YP
    ENC_2_XP      : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=ENC_2_XP
    ENC_2_YP      : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=ENC_2_YP
    ENC_3_XP      : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=ENC_3_XP
    ENC_3_YP      : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=ENC_3_YP
    F_CLK         : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=F_CLK
    F_DQ0         : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=F_DQ0
    F_DQ1         : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=F_DQ1
    F_DQ2         : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=F_DQ2
    F_DQ3         : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=F_DQ3
    F_S           : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=F_S
    FRUN          : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=FRUN
    M1_MODE1      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M1_MODE1
    M1_MODE2      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M1_MODE2
    M1_PWM_A      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M1_PWM_A
    M1_PWM_B      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M1_PWM_B
    M1_PWM_C      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M1_PWM_C
    M1_PWM_D      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M1_PWM_D
    M1_RESET_AB   : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M1_RESET_AB
    M1_RESET_CD   : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M1_RESET_CD
    M2_3_MODE1    : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M2_3_MODE1
    M2_3_MODE2    : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M2_3_MODE2
    M2_PWM_A      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M2_PWM_A
    M2_PWM_B      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M2_PWM_B
    M2_RESET_AB   : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M2_RESET_AB
    M3_PWM_A      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M3_PWM_A
    M3_PWM_B      : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M3_PWM_B
    M3_RESET_CD   : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=M3_RESET_CD
    SPARE_DI_1    : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPARE_DI_1
    SPARE_DI_2    : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPARE_DI_2
    SPARE_DI_3    : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPARE_DI_3
    SPARE_DI_4    : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPARE_DI_4
    SPARE_DO_1    : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPARE_DO_1
    SPARE_DO_2    : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPARE_DO_2
    SPARE_DO_3    : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPARE_DO_3
    SPARE_DO_4    : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPARE_DO_4
    SPI_ADC0_CLK  : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPI_ADC0_CLK
    SPI_ADC0_DIN  : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPI_ADC0_DIN
    SPI_ADC0_DOUT : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPI_ADC0_DOUT
    SPI_ADC0_SEL  : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPI_ADC0_SEL
    SPI_ADC1_CLK  : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPI_ADC1_CLK
    SPI_ADC1_DIN  : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPI_ADC1_DIN
    SPI_ADC1_DOUT : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPI_ADC1_DOUT
    SPI_ADC1_SEL  : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPI_ADC1_SEL
    SPI_EC_CLK    : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPI_EC_CLK
    SPI_EC_DIN    : In    STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPI_EC_DIN
    SPI_EC_DOUT   : Out   STD_LOGIC;                         -- ObjectKind=Port|PrimaryId=SPI_EC_DOUT
    SPI_EC_SEL    : Out   STD_LOGIC                          -- ObjectKind=Port|PrimaryId=SPI_EC_SEL
  );
  attribute MacroCell : boolean;

End ESRA_tsk3000;
------------------------------------------------------------

------------------------------------------------------------
Architecture Structure Of ESRA_tsk3000 Is
   Component AS1543_spi_adc0                                 -- ObjectKind=Sheet Symbol|PrimaryId=AS1534_SPI_ADC0
      port
      (
        adc_addr       : in  STD_LOGIC_VECTOR(7 downto 0);   -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-adc_addr[7..0]
        adc_data       : out STD_LOGIC_VECTOR(15 downto 0);  -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-adc_data[15..0]
        clk            : in  STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-clk
        reset          : in  STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-reset
        spi_adc_cs     : out STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-spi_adc_cs
        spi_adc_miso_0 : in  STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-spi_adc_miso_0
        spi_adc_miso_1 : in  STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-spi_adc_miso_1
        spi_adc_mosi   : out STD_LOGIC;                      -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-spi_adc_mosi
        spi_adc_sclk   : out STD_LOGIC                       -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-spi_adc_sclk
      );
   End Component;

   Component CDIV2                                           -- ObjectKind=Part|PrimaryId=U1|SecondaryId=1
      port
      (
        CLKDV : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=U1-CLKDV
        CLKIN : in  STD_LOGIC                                -- ObjectKind=Pin|PrimaryId=U1-CLKIN
      );
   End Component;

   Component CDIV5                                           -- ObjectKind=Part|PrimaryId=U15|SecondaryId=1
      port
      (
        CLKDV : out STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=U15-CLKDV
        CLKIN : in  STD_LOGIC                                -- ObjectKind=Pin|PrimaryId=U15-CLKIN
      );
   End Component;

   Component Configurable_U25                                -- ObjectKind=Part|PrimaryId=U25|SecondaryId=1
      port
      (
        CLK    : in  STD_LOGIC;                              -- ObjectKind=Pin|PrimaryId=U25-CLK
        CLKA   : out STD_LOGIC;                              -- ObjectKind=Pin|PrimaryId=U25-CLKA
        LOCKED : out STD_LOGIC;                              -- ObjectKind=Pin|PrimaryId=U25-LOCKED
        RST    : in  STD_LOGIC                               -- ObjectKind=Pin|PrimaryId=U25-RST
      );
   End Component;

   Component Direction                                       -- ObjectKind=Sheet Symbol|PrimaryId=DIR1
      port
      (
        DIR   : in  STD_LOGIC;                               -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-DIR
        PWM   : in  STD_LOGIC;                               -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-PWM
        PWM_A : out STD_LOGIC;                               -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-PWM_A
        PWM_B : out STD_LOGIC                                -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-PWM_B
      );
   End Component;

   Component Encoder                                         -- ObjectKind=Sheet Symbol|PrimaryId=ENC1
      port
      (
        CLK     : in  STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-CLK
        COUNTER : out STD_LOGIC_VECTOR(15 downto 0);         -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-COUNTER[15..0]
        ENC_A   : in  STD_LOGIC;                             -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-ENC_A
        ENC_B   : in  STD_LOGIC                              -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-ENC_B
      );
   End Component;

   Component FPGA_STARTUP8                                   -- ObjectKind=Part|PrimaryId=U17|SecondaryId=1
      port
      (
        CLK   : in  STD_LOGIC;                               -- ObjectKind=Pin|PrimaryId=U17-CLK
        DELAY : in  STD_LOGIC_VECTOR(7 downto 0);            -- ObjectKind=Pin|PrimaryId=U17-DELAY[7..0]
        INIT  : out STD_LOGIC                                -- ObjectKind=Pin|PrimaryId=U17-INIT
      );
   End Component;

   Component INV                                             -- ObjectKind=Part|PrimaryId=U248|SecondaryId=1
      port
      (
        I : in  STD_LOGIC;                                   -- ObjectKind=Pin|PrimaryId=U248-I
        O : out STD_LOGIC                                    -- ObjectKind=Pin|PrimaryId=U248-O
      );
   End Component;

   Component INV4S                                           -- ObjectKind=Part|PrimaryId=U27|SecondaryId=1
      port
      (
        I0 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U27-I0
        I1 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U27-I1
        I2 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U27-I2
        I3 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U27-I3
        O0 : out STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U27-O0
        O1 : out STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U27-O1
        O2 : out STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U27-O2
        O3 : out STD_LOGIC                                   -- ObjectKind=Pin|PrimaryId=U27-O3
      );
   End Component;

   Component J8B_8S                                          -- ObjectKind=Part|PrimaryId=U5|SecondaryId=1
      port
      (
        I  : in  STD_LOGIC_VECTOR(7 downto 0);               -- ObjectKind=Pin|PrimaryId=U5-I[7..0]
        O0 : out STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U5-O0
        O1 : out STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U5-O1
        O2 : out STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U5-O2
        O3 : out STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U5-O3
        O4 : out STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U5-O4
        O5 : out STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U5-O5
        O6 : out STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U5-O6
        O7 : out STD_LOGIC                                   -- ObjectKind=Pin|PrimaryId=U5-O7
      );
   End Component;

   Component J8S_8B                                          -- ObjectKind=Part|PrimaryId=U28|SecondaryId=1
      port
      (
        I0 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U28-I0
        I1 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U28-I1
        I2 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U28-I2
        I3 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U28-I3
        I4 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U28-I4
        I5 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U28-I5
        I6 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U28-I6
        I7 : in  STD_LOGIC;                                  -- ObjectKind=Pin|PrimaryId=U28-I7
        O  : out STD_LOGIC_VECTOR(7 downto 0)                -- ObjectKind=Pin|PrimaryId=U28-O[7..0]
      );
   End Component;

   Component System                                          -- ObjectKind=Sheet Symbol|PrimaryId=ESRA_tsk3000
      port
      (
        ADC_1_DATA_I     : in  STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-ADC_1_DATA_I[15..0]
        CLK_I            : in  STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-CLK_I
        DAC_1_SPI_CLK    : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-DAC_1_SPI_CLK
        DAC_1_SPI_CS     : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-DAC_1_SPI_CS
        DAC_1_SPI_DIN    : in  STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-DAC_1_SPI_DIN
        DAC_1_SPI_DOUT   : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-DAC_1_SPI_DOUT
        EC_1_SPI_CLK     : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-EC_1_SPI_CLK
        EC_1_SPI_CS      : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-EC_1_SPI_CS
        EC_1_SPI_DIN     : in  STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-EC_1_SPI_DIN
        EC_1_SPI_DOUT    : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-EC_1_SPI_DOUT
        ENC_1_C_I        : in  STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-ENC_1_C_I[15..0]
        ENC_2_C_I        : in  STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-ENC_2_C_I[15..0]
        ENC_3_C_I        : in  STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-ENC_3_C_I[15..0]
        FLASH_1_SPI_CLK  : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-FLASH_1_SPI_CLK
        FLASH_1_SPI_CS   : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-FLASH_1_SPI_CS
        FLASH_1_SPI_DIN  : in  STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-FLASH_1_SPI_DIN
        FLASH_1_SPI_DOUT : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-FLASH_1_SPI_DOUT
        GPIO_1_ADC       : out STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-GPIO_1_ADC[7..0]
        GPIO_1_DI        : in  STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-GPIO_1_DI[7..0]
        GPIO_1_DO_I      : in  STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-GPIO_1_DO_I[7..0]
        GPIO_1_DO_O      : out STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-GPIO_1_DO_O[7..0]
        PWM_1_PWMN       : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-PWM_1_PWMN
        PWM_1_PWMP       : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-PWM_1_PWMP
        PWM_2_PWMN       : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-PWM_2_PWMN
        PWM_2_PWMP       : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-PWM_2_PWMP
        PWM_3_PWMN       : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-PWM_3_PWMN
        PWM_3_PWMP       : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-PWM_3_PWMP
        RST_I            : in  STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-RST_I
        UART_1_CTS       : in  STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-UART_1_CTS
        UART_1_RTS       : out STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-UART_1_RTS
        UART_1_RXD       : in  STD_LOGIC;                    -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-UART_1_RXD
        UART_1_TXD       : out STD_LOGIC                     -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-UART_1_TXD
      );
   End Component;


    Signal NamedSignal_CLK_BRD                     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=CLK_BRD
    Signal NamedSignal_CLK_MAIN                    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=CLK_MAIN
    Signal NamedSignal_DIR_M1                      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=DIR_M1
    Signal NamedSignal_DIR_M2                      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=DIR_M2
    Signal NamedSignal_DIR_M3                      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=DIR_M3
    Signal NamedSignal_RST                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=RST
    Signal NamedSignal_UART_1_TXD                  : STD_LOGIC; -- ObjectKind=Net|PrimaryId=UART_1_TXD
    Signal NamedSignal_VCC1_BUS                    : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=VCC1_BUS[7..0]
    Signal PinSignal_AS1534_SPI_ADC0_adc_data      : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=adc_data
    Signal PinSignal_AS1534_SPI_ADC0_spi_adc_cs    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=spi_adc_cs
    Signal PinSignal_AS1534_SPI_ADC0_spi_adc_mosi  : STD_LOGIC; -- ObjectKind=Net|PrimaryId=spi_adc_mosi
    Signal PinSignal_AS1534_SPI_ADC0_spi_adc_sclk  : STD_LOGIC; -- ObjectKind=Net|PrimaryId=spi_adc_sclk
    Signal PinSignal_DIR1_PWM_A                    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_A
    Signal PinSignal_DIR1_PWM_B                    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_B
    Signal PinSignal_DIR2_PWM_A                    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_A
    Signal PinSignal_DIR2_PWM_B                    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_B
    Signal PinSignal_DIR3_PWM_A                    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_A
    Signal PinSignal_DIR3_PWM_B                    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM_B
    Signal PinSignal_ENC1_COUNTER                  : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=COUNTER
    Signal PinSignal_ENC2_COUNTER                  : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=COUNTER
    Signal PinSignal_ENC3_COUNTER                  : STD_LOGIC_VECTOR(15 downto 0); -- ObjectKind=Net|PrimaryId=COUNTER
    Signal PinSignal_ESRA_tsk3000_DAC_1_SPI_CLK    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=DAC_1_SPI_CLK
    Signal PinSignal_ESRA_tsk3000_DAC_1_SPI_CS     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=DAC_1_SPI_CS
    Signal PinSignal_ESRA_tsk3000_DAC_1_SPI_DOUT   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=DAC_1_SPI_DOUT
    Signal PinSignal_ESRA_tsk3000_EC_1_SPI_CLK     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=EC_1_SPI_CLK
    Signal PinSignal_ESRA_tsk3000_EC_1_SPI_CS      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=EC_1_SPI_CS
    Signal PinSignal_ESRA_tsk3000_EC_1_SPI_DOUT    : STD_LOGIC; -- ObjectKind=Net|PrimaryId=EC_1_SPI_DOUT
    Signal PinSignal_ESRA_tsk3000_FLASH_1_SPI_CLK  : STD_LOGIC; -- ObjectKind=Net|PrimaryId=FLASH_1_SPI_CLK
    Signal PinSignal_ESRA_tsk3000_FLASH_1_SPI_CS   : STD_LOGIC; -- ObjectKind=Net|PrimaryId=FLASH_1_SPI_CS
    Signal PinSignal_ESRA_tsk3000_FLASH_1_SPI_DOUT : STD_LOGIC; -- ObjectKind=Net|PrimaryId=FLASH_1_SPI_DOUT
    Signal PinSignal_ESRA_tsk3000_GPIO_1_ADC       : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=adc_addr
    Signal PinSignal_ESRA_tsk3000_GPIO_1_DO_O      : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=NetU5_I[7..0]
    Signal PinSignal_ESRA_tsk3000_PWM_1_PWMP       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM
    Signal PinSignal_ESRA_tsk3000_PWM_2_PWMP       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM
    Signal PinSignal_ESRA_tsk3000_PWM_3_PWMP       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=PWM
    Signal PinSignal_U1_CLKDV                      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=CLK_25
    Signal PinSignal_U15_CLKDV                     : STD_LOGIC; -- ObjectKind=Net|PrimaryId=CLK_10MHZ
    Signal PinSignal_U17_INIT                      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=RST
    Signal PinSignal_U248_O                        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU248_O
    Signal PinSignal_U25_CLKA                      : STD_LOGIC; -- ObjectKind=Net|PrimaryId=CLK_MAIN
    Signal PinSignal_U27_O0                        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU27_O0
    Signal PinSignal_U27_O1                        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU27_O1
    Signal PinSignal_U27_O2                        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU27_O2
    Signal PinSignal_U27_O3                        : STD_LOGIC; -- ObjectKind=Net|PrimaryId=UART_1_TXD
    Signal PinSignal_U28_O                         : STD_LOGIC_VECTOR(7 downto 0); -- ObjectKind=Net|PrimaryId=NetU28_O[7..0]
    Signal PinSignal_U289_O0                       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU289_O0
    Signal PinSignal_U289_O1                       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU289_O1
    Signal PinSignal_U289_O2                       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU289_O2
    Signal PinSignal_U289_O3                       : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU289_O3
    Signal PinSignal_U5_O0                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU5_O0
    Signal PinSignal_U5_O1                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU5_O1
    Signal PinSignal_U5_O2                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU5_O2
    Signal PinSignal_U5_O3                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU5_O3
    Signal PinSignal_U5_O4                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=DIR_M1
    Signal PinSignal_U5_O5                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=DIR_M2
    Signal PinSignal_U5_O6                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=DIR_M3
    Signal PinSignal_U5_O7                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=NetU5_O7
    Signal PowerSignal_GND                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=GND
    Signal PowerSignal_VCC                         : STD_LOGIC; -- ObjectKind=Net|PrimaryId=VCC

Begin
    ESRA_tsk3000 : System                                    -- ObjectKind=Sheet Symbol|PrimaryId=ESRA_tsk3000
      Port Map
      (
        ADC_1_DATA_I     => PinSignal_AS1534_SPI_ADC0_adc_data, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-ADC_1_DATA_I[15..0]
        CLK_I            => NamedSignal_CLK_MAIN,            -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-CLK_I
        DAC_1_SPI_CLK    => PinSignal_ESRA_tsk3000_DAC_1_SPI_CLK, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-DAC_1_SPI_CLK
        DAC_1_SPI_CS     => PinSignal_ESRA_tsk3000_DAC_1_SPI_CS, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-DAC_1_SPI_CS
        DAC_1_SPI_DIN    => DAC_MISO,                        -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-DAC_1_SPI_DIN
        DAC_1_SPI_DOUT   => PinSignal_ESRA_tsk3000_DAC_1_SPI_DOUT, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-DAC_1_SPI_DOUT
        EC_1_SPI_CLK     => PinSignal_ESRA_tsk3000_EC_1_SPI_CLK, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-EC_1_SPI_CLK
        EC_1_SPI_CS      => PinSignal_ESRA_tsk3000_EC_1_SPI_CS, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-EC_1_SPI_CS
        EC_1_SPI_DIN     => SPI_EC_DIN,                      -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-EC_1_SPI_DIN
        EC_1_SPI_DOUT    => PinSignal_ESRA_tsk3000_EC_1_SPI_DOUT, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-EC_1_SPI_DOUT
        ENC_1_C_I        => PinSignal_ENC1_COUNTER,          -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-ENC_1_C_I[15..0]
        ENC_2_C_I        => PinSignal_ENC2_COUNTER,          -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-ENC_2_C_I[15..0]
        ENC_3_C_I        => PinSignal_ENC3_COUNTER,          -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-ENC_3_C_I[15..0]
        FLASH_1_SPI_CLK  => PinSignal_ESRA_tsk3000_FLASH_1_SPI_CLK, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-FLASH_1_SPI_CLK
        FLASH_1_SPI_CS   => PinSignal_ESRA_tsk3000_FLASH_1_SPI_CS, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-FLASH_1_SPI_CS
        FLASH_1_SPI_DIN  => F_DQ1,                           -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-FLASH_1_SPI_DIN
        FLASH_1_SPI_DOUT => PinSignal_ESRA_tsk3000_FLASH_1_SPI_DOUT, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-FLASH_1_SPI_DOUT
        GPIO_1_ADC       => PinSignal_ESRA_tsk3000_GPIO_1_ADC, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-GPIO_1_ADC[7..0]
        GPIO_1_DI        => PinSignal_U28_O,                 -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-GPIO_1_DI[7..0]
        GPIO_1_DO_I      => PinSignal_ESRA_tsk3000_GPIO_1_DO_O, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-GPIO_1_DO_I[7..0]
        GPIO_1_DO_O      => PinSignal_ESRA_tsk3000_GPIO_1_DO_O, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-GPIO_1_DO_O[7..0]
        PWM_1_PWMP       => PinSignal_ESRA_tsk3000_PWM_1_PWMP, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-PWM_1_PWMP
        PWM_2_PWMP       => PinSignal_ESRA_tsk3000_PWM_2_PWMP, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-PWM_2_PWMP
        PWM_3_PWMP       => PinSignal_ESRA_tsk3000_PWM_3_PWMP, -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-PWM_3_PWMP
        RST_I            => PinSignal_U17_INIT,              -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-RST_I
        UART_1_CTS       => PowerSignal_VCC,                 -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-UART_1_CTS
        UART_1_RXD       => NamedSignal_UART_1_TXD           -- ObjectKind=Sheet Entry|PrimaryId=System.OpenBus-UART_1_RXD
      );

    ENC3 : Encoder                                           -- ObjectKind=Sheet Symbol|PrimaryId=ENC3
      Port Map
      (
        CLK     => NamedSignal_CLK_BRD,                      -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-CLK
        COUNTER => PinSignal_ENC3_COUNTER,                   -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-COUNTER[15..0]
        ENC_A   => ENC_3_XP,                                 -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-ENC_A
        ENC_B   => ENC_3_YP                                  -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-ENC_B
      );

    ENC2 : Encoder                                           -- ObjectKind=Sheet Symbol|PrimaryId=ENC2
      Port Map
      (
        CLK     => NamedSignal_CLK_BRD,                      -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-CLK
        COUNTER => PinSignal_ENC2_COUNTER,                   -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-COUNTER[15..0]
        ENC_A   => ENC_2_XP,                                 -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-ENC_A
        ENC_B   => ENC_2_YP                                  -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-ENC_B
      );

    ENC1 : Encoder                                           -- ObjectKind=Sheet Symbol|PrimaryId=ENC1
      Port Map
      (
        CLK     => NamedSignal_CLK_BRD,                      -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-CLK
        COUNTER => PinSignal_ENC1_COUNTER,                   -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-COUNTER[15..0]
        ENC_A   => ENC_1_XP,                                 -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-ENC_A
        ENC_B   => ENC_1_YP                                  -- ObjectKind=Sheet Entry|PrimaryId=Encoder.SchDoc-ENC_B
      );

    DIR3 : Direction                                         -- ObjectKind=Sheet Symbol|PrimaryId=DIR3
      Port Map
      (
        DIR   => NamedSignal_DIR_M3,                         -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-DIR
        PWM   => PinSignal_ESRA_tsk3000_PWM_3_PWMP,          -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-PWM
        PWM_A => PinSignal_DIR3_PWM_A,                       -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-PWM_A
        PWM_B => PinSignal_DIR3_PWM_B                        -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-PWM_B
      );

    DIR2 : Direction                                         -- ObjectKind=Sheet Symbol|PrimaryId=DIR2
      Port Map
      (
        DIR   => NamedSignal_DIR_M2,                         -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-DIR
        PWM   => PinSignal_ESRA_tsk3000_PWM_2_PWMP,          -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-PWM
        PWM_A => PinSignal_DIR2_PWM_A,                       -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-PWM_A
        PWM_B => PinSignal_DIR2_PWM_B                        -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-PWM_B
      );

    DIR1 : Direction                                         -- ObjectKind=Sheet Symbol|PrimaryId=DIR1
      Port Map
      (
        DIR   => NamedSignal_DIR_M1,                         -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-DIR
        PWM   => PinSignal_ESRA_tsk3000_PWM_1_PWMP,          -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-PWM
        PWM_A => PinSignal_DIR1_PWM_A,                       -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-PWM_A
        PWM_B => PinSignal_DIR1_PWM_B                        -- ObjectKind=Sheet Entry|PrimaryId=Direction.SchDoc-PWM_B
      );

    AS1534_SPI_ADC0 : AS1543_spi_adc0                        -- ObjectKind=Sheet Symbol|PrimaryId=AS1534_SPI_ADC0
      Port Map
      (
        adc_addr       => PinSignal_ESRA_tsk3000_GPIO_1_ADC, -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-adc_addr[7..0]
        adc_data       => PinSignal_AS1534_SPI_ADC0_adc_data, -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-adc_data[15..0]
        clk            => NamedSignal_CLK_MAIN,              -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-clk
        reset          => NamedSignal_RST,                   -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-reset
        spi_adc_cs     => PinSignal_AS1534_SPI_ADC0_spi_adc_cs, -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-spi_adc_cs
        spi_adc_miso_0 => SPI_ADC0_DIN,                      -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-spi_adc_miso_0
        spi_adc_miso_1 => SPI_ADC1_DIN,                      -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-spi_adc_miso_1
        spi_adc_mosi   => PinSignal_AS1534_SPI_ADC0_spi_adc_mosi, -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-spi_adc_mosi
        spi_adc_sclk   => PinSignal_AS1534_SPI_ADC0_spi_adc_sclk -- ObjectKind=Sheet Entry|PrimaryId=AS1543_spi_adc0.vhd-spi_adc_sclk
      );

    U289 : INV4S                                             -- ObjectKind=Part|PrimaryId=U289|SecondaryId=1
      Port Map
      (
        I0 => PinSignal_U5_O0,                               -- ObjectKind=Pin|PrimaryId=U289-I0
        I1 => PinSignal_U5_O1,                               -- ObjectKind=Pin|PrimaryId=U289-I1
        I2 => PinSignal_U5_O2,                               -- ObjectKind=Pin|PrimaryId=U289-I2
        I3 => PinSignal_U5_O3,                               -- ObjectKind=Pin|PrimaryId=U289-I3
        O0 => PinSignal_U289_O0,                             -- ObjectKind=Pin|PrimaryId=U289-O0
        O1 => PinSignal_U289_O1,                             -- ObjectKind=Pin|PrimaryId=U289-O1
        O2 => PinSignal_U289_O2,                             -- ObjectKind=Pin|PrimaryId=U289-O2
        O3 => PinSignal_U289_O3                              -- ObjectKind=Pin|PrimaryId=U289-O3
      );

    U248 : INV                                               -- ObjectKind=Part|PrimaryId=U248|SecondaryId=1
      Port Map
      (
        I => NamedSignal_RST,                                -- ObjectKind=Pin|PrimaryId=U248-I
        O => PinSignal_U248_O                                -- ObjectKind=Pin|PrimaryId=U248-O
      );

    U28 : J8S_8B                                             -- ObjectKind=Part|PrimaryId=U28|SecondaryId=1
      Port Map
      (
        I0 => PinSignal_U27_O0,                              -- ObjectKind=Pin|PrimaryId=U28-I0
        I1 => PinSignal_U27_O1,                              -- ObjectKind=Pin|PrimaryId=U28-I1
        I2 => PinSignal_U27_O2,                              -- ObjectKind=Pin|PrimaryId=U28-I2
        I3 => PinSignal_U27_O3,                              -- ObjectKind=Pin|PrimaryId=U28-I3
        I4 => PowerSignal_GND,                               -- ObjectKind=Pin|PrimaryId=U28-I4
        I5 => PowerSignal_GND,                               -- ObjectKind=Pin|PrimaryId=U28-I5
        I6 => PowerSignal_GND,                               -- ObjectKind=Pin|PrimaryId=U28-I6
        I7 => PowerSignal_GND,                               -- ObjectKind=Pin|PrimaryId=U28-I7
        O  => PinSignal_U28_O                                -- ObjectKind=Pin|PrimaryId=U28-O[7..0]
      );

    U27 : INV4S                                              -- ObjectKind=Part|PrimaryId=U27|SecondaryId=1
      Port Map
      (
        I0 => SPARE_DI_1,                                    -- ObjectKind=Pin|PrimaryId=U27-I0
        I1 => SPARE_DI_2,                                    -- ObjectKind=Pin|PrimaryId=U27-I1
        I2 => SPARE_DI_3,                                    -- ObjectKind=Pin|PrimaryId=U27-I2
        I3 => SPARE_DI_4,                                    -- ObjectKind=Pin|PrimaryId=U27-I3
        O0 => PinSignal_U27_O0,                              -- ObjectKind=Pin|PrimaryId=U27-O0
        O1 => PinSignal_U27_O1,                              -- ObjectKind=Pin|PrimaryId=U27-O1
        O2 => PinSignal_U27_O2,                              -- ObjectKind=Pin|PrimaryId=U27-O2
        O3 => PinSignal_U27_O3                               -- ObjectKind=Pin|PrimaryId=U27-O3
      );

    U25 : Configurable_U25                                   -- ObjectKind=Part|PrimaryId=U25|SecondaryId=1
      Port Map
      (
        CLK  => CLK_BRD,                                     -- ObjectKind=Pin|PrimaryId=U25-CLK
        CLKA => PinSignal_U25_CLKA,                          -- ObjectKind=Pin|PrimaryId=U25-CLKA
        RST  => PowerSignal_GND                              -- ObjectKind=Pin|PrimaryId=U25-RST
      );

    U17 : FPGA_STARTUP8                                      -- ObjectKind=Part|PrimaryId=U17|SecondaryId=1
      Port Map
      (
        CLK   => PinSignal_U25_CLKA,                         -- ObjectKind=Pin|PrimaryId=U17-CLK
        DELAY => NamedSignal_VCC1_BUS,                       -- ObjectKind=Pin|PrimaryId=U17-DELAY[7..0]
        INIT  => PinSignal_U17_INIT                          -- ObjectKind=Pin|PrimaryId=U17-INIT
      );

    U15 : CDIV5                                              -- ObjectKind=Part|PrimaryId=U15|SecondaryId=1
      Port Map
      (
        CLKDV => PinSignal_U15_CLKDV,                        -- ObjectKind=Pin|PrimaryId=U15-CLKDV
        CLKIN => CLK_BRD                                     -- ObjectKind=Pin|PrimaryId=U15-CLKIN
      );

    U5 : J8B_8S                                              -- ObjectKind=Part|PrimaryId=U5|SecondaryId=1
      Port Map
      (
        I  => PinSignal_ESRA_tsk3000_GPIO_1_DO_O,            -- ObjectKind=Pin|PrimaryId=U5-I[7..0]
        O0 => PinSignal_U5_O0,                               -- ObjectKind=Pin|PrimaryId=U5-O0
        O1 => PinSignal_U5_O1,                               -- ObjectKind=Pin|PrimaryId=U5-O1
        O2 => PinSignal_U5_O2,                               -- ObjectKind=Pin|PrimaryId=U5-O2
        O3 => PinSignal_U5_O3,                               -- ObjectKind=Pin|PrimaryId=U5-O3
        O4 => PinSignal_U5_O4,                               -- ObjectKind=Pin|PrimaryId=U5-O4
        O5 => PinSignal_U5_O5,                               -- ObjectKind=Pin|PrimaryId=U5-O5
        O6 => PinSignal_U5_O6,                               -- ObjectKind=Pin|PrimaryId=U5-O6
        O7 => PinSignal_U5_O7                                -- ObjectKind=Pin|PrimaryId=U5-O7
      );

    U1 : CDIV2                                               -- ObjectKind=Part|PrimaryId=U1|SecondaryId=1
      Port Map
      (
        CLKDV => PinSignal_U1_CLKDV,                         -- ObjectKind=Pin|PrimaryId=U1-CLKDV
        CLKIN => CLK_BRD                                     -- ObjectKind=Pin|PrimaryId=U1-CLKIN
      );

    -- Signal Assignments
    ---------------------
    DAC_CLR                <= PowerSignal_VCC; -- ObjectKind=Net|PrimaryId=VCC
    DAC_LDAC               <= PowerSignal_GND; -- ObjectKind=Net|PrimaryId=GND
    DAC_MOSI               <= PinSignal_ESRA_tsk3000_DAC_1_SPI_DOUT; -- ObjectKind=Net|PrimaryId=DAC_1_SPI_DOUT
    DAC_SCK                <= PinSignal_ESRA_tsk3000_DAC_1_SPI_CLK; -- ObjectKind=Net|PrimaryId=DAC_1_SPI_CLK
    DAC_SYNC               <= PinSignal_ESRA_tsk3000_DAC_1_SPI_CS; -- ObjectKind=Net|PrimaryId=DAC_1_SPI_CS
    ECAT_CLK               <= PinSignal_U1_CLKDV; -- ObjectKind=Net|PrimaryId=CLK_25
    ECAT_PERR0             <= PowerSignal_VCC; -- ObjectKind=Net|PrimaryId=VCC
    ECAT_PERR1             <= PowerSignal_VCC; -- ObjectKind=Net|PrimaryId=VCC
    ECAT_RESET             <= PowerSignal_VCC; -- ObjectKind=Net|PrimaryId=VCC
    F_CLK                  <= PinSignal_ESRA_tsk3000_FLASH_1_SPI_CLK; -- ObjectKind=Net|PrimaryId=FLASH_1_SPI_CLK
    F_DQ0                  <= PinSignal_ESRA_tsk3000_FLASH_1_SPI_DOUT; -- ObjectKind=Net|PrimaryId=FLASH_1_SPI_DOUT
    F_DQ2                  <= PowerSignal_VCC; -- ObjectKind=Net|PrimaryId=VCC
    F_DQ3                  <= PowerSignal_VCC; -- ObjectKind=Net|PrimaryId=VCC
    F_S                    <= PinSignal_ESRA_tsk3000_FLASH_1_SPI_CS; -- ObjectKind=Net|PrimaryId=FLASH_1_SPI_CS
    FRUN                   <= PinSignal_U5_O7; -- ObjectKind=Net|PrimaryId=NetU5_O7
    M1_MODE1               <= PowerSignal_GND; -- ObjectKind=Net|PrimaryId=GND
    M1_MODE2               <= PowerSignal_VCC; -- ObjectKind=Net|PrimaryId=VCC
    M1_PWM_A               <= PinSignal_DIR1_PWM_A; -- ObjectKind=Net|PrimaryId=PWM_A
    M1_PWM_B               <= PinSignal_DIR1_PWM_B; -- ObjectKind=Net|PrimaryId=PWM_B
    M1_PWM_C               <= PowerSignal_GND; -- ObjectKind=Net|PrimaryId=GND
    M1_PWM_D               <= PowerSignal_GND; -- ObjectKind=Net|PrimaryId=GND
    M1_RESET_AB            <= PinSignal_U248_O; -- ObjectKind=Net|PrimaryId=NetU248_O
    M1_RESET_CD            <= PinSignal_U248_O; -- ObjectKind=Net|PrimaryId=NetU248_O
    M2_3_MODE1             <= PowerSignal_GND; -- ObjectKind=Net|PrimaryId=GND
    M2_3_MODE2             <= PowerSignal_GND; -- ObjectKind=Net|PrimaryId=GND
    M2_PWM_A               <= PinSignal_DIR2_PWM_A; -- ObjectKind=Net|PrimaryId=PWM_A
    M2_PWM_B               <= PinSignal_DIR2_PWM_B; -- ObjectKind=Net|PrimaryId=PWM_B
    M2_RESET_AB            <= PinSignal_U248_O; -- ObjectKind=Net|PrimaryId=NetU248_O
    M3_PWM_A               <= PinSignal_DIR3_PWM_A; -- ObjectKind=Net|PrimaryId=PWM_A
    M3_PWM_B               <= PinSignal_DIR3_PWM_B; -- ObjectKind=Net|PrimaryId=PWM_B
    M3_RESET_CD            <= PinSignal_U248_O; -- ObjectKind=Net|PrimaryId=NetU248_O
    NamedSignal_CLK_BRD    <= CLK_BRD; -- ObjectKind=Net|PrimaryId=CLK_BRD
    NamedSignal_CLK_MAIN   <= PinSignal_U25_CLKA; -- ObjectKind=Net|PrimaryId=CLK_MAIN
    NamedSignal_DIR_M1     <= PinSignal_U5_O4; -- ObjectKind=Net|PrimaryId=DIR_M1
    NamedSignal_DIR_M2     <= PinSignal_U5_O5; -- ObjectKind=Net|PrimaryId=DIR_M2
    NamedSignal_DIR_M3     <= PinSignal_U5_O6; -- ObjectKind=Net|PrimaryId=DIR_M3
    NamedSignal_RST        <= PinSignal_U17_INIT; -- ObjectKind=Net|PrimaryId=RST
    NamedSignal_UART_1_TXD <= PinSignal_U27_O3; -- ObjectKind=Net|PrimaryId=UART_1_TXD
    NamedSignal_VCC1_BUS   <= "11111111"; -- ObjectKind=Net|PrimaryId=VCC1_BUS[7..0]
    PowerSignal_GND        <= '0'; -- ObjectKind=Net|PrimaryId=GND
    PowerSignal_VCC        <= '1'; -- ObjectKind=Net|PrimaryId=VCC
    SPARE_DO_1             <= PinSignal_U289_O0; -- ObjectKind=Net|PrimaryId=NetU289_O0
    SPARE_DO_2             <= PinSignal_U289_O1; -- ObjectKind=Net|PrimaryId=NetU289_O1
    SPARE_DO_3             <= PinSignal_U289_O2; -- ObjectKind=Net|PrimaryId=NetU289_O2
    SPARE_DO_4             <= PinSignal_U289_O3; -- ObjectKind=Net|PrimaryId=NetU289_O3
    SPI_ADC0_CLK           <= PinSignal_AS1534_SPI_ADC0_spi_adc_sclk; -- ObjectKind=Net|PrimaryId=spi_adc_sclk
    SPI_ADC0_DOUT          <= PinSignal_AS1534_SPI_ADC0_spi_adc_mosi; -- ObjectKind=Net|PrimaryId=spi_adc_mosi
    SPI_ADC0_SEL           <= PinSignal_AS1534_SPI_ADC0_spi_adc_cs; -- ObjectKind=Net|PrimaryId=spi_adc_cs
    SPI_ADC1_CLK           <= PinSignal_AS1534_SPI_ADC0_spi_adc_sclk; -- ObjectKind=Net|PrimaryId=spi_adc_sclk
    SPI_ADC1_DOUT          <= PinSignal_AS1534_SPI_ADC0_spi_adc_mosi; -- ObjectKind=Net|PrimaryId=spi_adc_mosi
    SPI_ADC1_SEL           <= PinSignal_AS1534_SPI_ADC0_spi_adc_cs; -- ObjectKind=Net|PrimaryId=spi_adc_cs
    SPI_EC_CLK             <= PinSignal_ESRA_tsk3000_EC_1_SPI_CLK; -- ObjectKind=Net|PrimaryId=EC_1_SPI_CLK
    SPI_EC_DOUT            <= PinSignal_ESRA_tsk3000_EC_1_SPI_DOUT; -- ObjectKind=Net|PrimaryId=EC_1_SPI_DOUT
    SPI_EC_SEL             <= PinSignal_ESRA_tsk3000_EC_1_SPI_CS; -- ObjectKind=Net|PrimaryId=EC_1_SPI_CS

End Structure;
------------------------------------------------------------


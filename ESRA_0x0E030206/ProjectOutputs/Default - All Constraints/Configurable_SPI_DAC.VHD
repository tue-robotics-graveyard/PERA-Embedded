--------------------------------------------------------------------------------
Library IEEE;
Use IEEE.Std_Logic_1164.All;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Entity Configurable_SPI_DAC Is
  Port
  (
    STB_I              : in    std_logic;
    CYC_I              : in    std_logic;
    ACK_O              : out   std_logic;
    ADR_I              : in    std_logic_vector(2 downto 0);
    DAT_O              : out   std_logic_vector(31 downto 0);
    DAT_I              : in    std_logic_vector(31 downto 0);
    WE_I               : in    std_logic;
    CLK_I              : in    std_logic;
    RST_I              : in    std_logic;
    SPI_DIN            : in    std_logic;
    SPI_DOUT           : out   std_logic;
--    SPI_MODE           : out   std_logic; -- IncludeIf_ModePinEnabled
    SPI_CS             : out   std_logic;
--    SPI_CS0            : out   std_logic; -- IncludeIf_SlaveCountGT0
--    SPI_CS1            : out   std_logic; -- IncludeIf_SlaveCountGT1
--    SPI_CS2            : out   std_logic; -- IncludeIf_SlaveCountGT2
--    SPI_CS3            : out   std_logic; -- IncludeIf_SlaveCountGT3
--    SPI_CS4            : out   std_logic; -- IncludeIf_SlaveCountGT4
--    SPI_CS5            : out   std_logic; -- IncludeIf_SlaveCountGT5
--    SPI_CS6            : out   std_logic; -- IncludeIf_SlaveCountGT6
--    SPI_CS7            : out   std_logic; -- IncludeIf_SlaveCountGT7
    SPI_CLK            : out   std_logic
  );
End Configurable_SPI_DAC;

Architecture RTL Of Configurable_SPI_DAC Is
  Component WB_SPI32 Is
    port
    (
    STB_I         : in    std_logic;
    CYC_I         : in    std_logic;
    ACK_O         : out   std_logic;
    ADR_I         : in    std_logic_vector(2 downto 0);
    DAT_O         : out   std_logic_vector(31 downto 0);
    DAT_I         : in    std_logic_vector(31 downto 0);
    WE_I          : in    std_logic;
    CLK_I         : in    std_logic;
    RST_I         : in    std_logic;
    SPI_DIN       : in    std_logic;
    SPI_DOUT      : out   std_logic;
    SPI_CLK       : out   std_logic;
    SPI_MODE      : out   std_logic;
    SPI_IN0       : in    std_logic;
    SPI_IN1       : in    std_logic;
    SPI_IN2       : in    std_logic;
    SPI_IN3       : in    std_logic;
    SPI_IN4       : in    std_logic;
    SPI_IN5       : in    std_logic;
    SPI_IN6       : in    std_logic;
    SPI_IN7       : in    std_logic;
    SPI_CS0       : out   std_logic;
    SPI_CS1       : out   std_logic;
    SPI_CS2       : out   std_logic;
    SPI_CS3       : out   std_logic;
    SPI_CS4       : out   std_logic;
    SPI_CS5       : out   std_logic;
    SPI_CS6       : out   std_logic;
    SPI_CS7       : out   std_logic;
    SPI_CS        : out   std_logic
    );
  End Component;

Signal MODE_Signal, OUT0_Signal, OUT1_Signal, OUT2_Signal, OUT3_Signal,
       OUT4_Signal, OUT5_Signal, OUT6_Signal, OUT7_Signal   : Std_Logic;

Signal IN0_Signal, IN1_Signal, IN2_Signal, IN3_Signal,
         IN4_Signal, IN5_Signal, IN6_Signal, IN7_Signal     : Std_Logic;

Begin
  SubPart_Port : WB_SPI32
    Port Map
    (
    STB_I => STB_I,
    CYC_I => CYC_I,
    ACK_O => ACK_O,
    ADR_I => ADR_I,
    DAT_O => DAT_O,
    DAT_I => DAT_I,
    WE_I  => WE_I,
    CLK_I => CLK_I,
    RST_I => RST_I,
    SPI_DIN => SPI_DIN,
    SPI_DOUT => SPI_DOUT,
    SPI_CLK => SPI_CLK,
    SPI_IN0 => IN0_Signal,
    SPI_IN1 => IN1_Signal,
    SPI_IN2 => IN2_Signal,
    SPI_IN3 => IN3_Signal,
    SPI_IN4 => IN4_Signal,
    SPI_IN5 => IN5_Signal,
    SPI_IN6 => IN6_Signal,
    SPI_IN7 => IN7_Signal,
--    SPI_MODE => MODE_Signal,   -- IncludeIf_ModePinEnabled
    SPI_MODE => open,          -- IncludeIf_ModePinDisabled
--    SPI_CS0 => CS0_Signal,     -- IncludeIf_SlaveCountGT0
    SPI_CS0 => open,           -- IncludeIf_SlaveCountLT1
--    SPI_CS1 => CS1_Signal,     -- IncludeIf_SlaveCountGT1
    SPI_CS1 => open,           -- IncludeIf_SlaveCountLT2
--    SPI_CS2 => CS2_Signal,     -- IncludeIf_SlaveCountGT2
    SPI_CS2 => open,           -- IncludeIf_SlaveCountLT3
--    SPI_CS3 => CS3_Signal,     -- IncludeIf_SlaveCountGT3
    SPI_CS3 => open,           -- IncludeIf_SlaveCountLT4
--    SPI_CS4 => CS4_Signal,     -- IncludeIf_SlaveCountGT4
    SPI_CS4 => open,           -- IncludeIf_SlaveCountLT5
--    SPI_CS5 => CS5_Signal,     -- IncludeIf_SlaveCountGT5
    SPI_CS5 => open,           -- IncludeIf_SlaveCountLT6
--    SPI_CS6 => CS6_Signal,     -- IncludeIf_SlaveCountGT6
    SPI_CS6 => open,           -- IncludeIf_SlaveCountLT7
--    SPI_CS7 => CS7_Signal,     -- IncludeIf_SlaveCountGT7
    SPI_CS7 => open,           -- IncludeIf_SlaveCountLT8
    SPI_CS  => SPI_CS
);

IN0_Signal     <= '0';
IN1_Signal     <= '0';
IN2_Signal     <= '0';
IN3_Signal     <= '0';
IN4_Signal     <= '0';
IN5_Signal     <= '0';
IN6_Signal     <= '0';
IN7_Signal     <= '0';
--SPI_MODE   <= MODE_Signal;   -- IncludeIf_ModePinEnabled
--SPI_CS0    <= CS0_Signal;    -- IncludeIf_SlaveCountGT0
--SPI_CS1    <= CS1_Signal;    -- IncludeIf_SlaveCountGT1
--SPI_CS2    <= CS2_Signal;    -- IncludeIf_SlaveCountGT2
--SPI_CS3    <= CS3_Signal;    -- IncludeIf_SlaveCountGT3
--SPI_CS4    <= CS4_Signal;    -- IncludeIf_SlaveCountGT4
--SPI_CS5    <= CS5_Signal;    -- IncludeIf_SlaveCountGT5
--SPI_CS6    <= CS6_Signal;    -- IncludeIf_SlaveCountGT6
--SPI_CS7    <= CS7_Signal;    -- IncludeIf_SlaveCountGT7

End RTL;

-- ----------------------------------------------------------------------------
-- Xilinx: DCM_SP
-- ----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
entity Configurable_U25 is
    port (
           CLKA   : out   std_logic;                    -- IncludeIf_CLKA
                                                        
           LOCKED : out   std_logic;                   
           CLK    : in    std_logic;
           RST    : in    std_logic
    );
end;
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
architecture RTL of Configurable_U25 is
    signal CLKFB_IN     : std_logic;
    signal CLK0_BUF     : std_logic;
    signal GND_BIT      : std_logic;
    
    
    signal CLKA_BUF   : std_logic;                      -- IncludeIf_CLKA
                                                    
    component BUFG
        port (
            O : out std_ulogic;
            I : in std_ulogic
        );
    end component;
    component DCM_SP
	generic
	(
		CLKDV_DIVIDE         : real                            := 2.0;
		CLKFX_DIVIDE         : integer                         := 1;
		CLKFX_MULTIPLY       : integer                         := 4;
		CLKIN_DIVIDE_BY_2    : boolean                         := false;
		CLKIN_PERIOD         : real                            := 10.0;
		CLKOUT_PHASE_SHIFT   : string                          := "NONE";
		CLK_FEEDBACK         : string                          := "1X";
		DESKEW_ADJUST        : string                          := "SYSTEM_SYNCHRONOUS";
		DFS_FREQUENCY_MODE   : string                          := "LOW";
		DLL_FREQUENCY_MODE   : string                          := "LOW";
		DSS_MODE             : string                          := "NONE";
		DUTY_CYCLE_CORRECTION: boolean                         := true;
		--FACTORY_JF           : bit_vector                      := X"C080";
		PHASE_SHIFT          : integer                         := 0;
		STARTUP_WAIT         : boolean                         := false                     --non-simulatable
	);
	port
	(
		CLK0                 : out std_ulogic                  := '0';
		CLK180               : out std_ulogic                  := '0';
		CLK270               : out std_ulogic                  := '0';
		CLK2X                : out std_ulogic                  := '0';
		CLK2X180             : out std_ulogic                  := '0';
		CLK90                : out std_ulogic                  := '0';
		CLKDV                : out std_ulogic                  := '0';
		CLKFX                : out std_ulogic                  := '0';
		CLKFX180             : out std_ulogic                  := '0';
		LOCKED               : out std_ulogic                  := '0';
		PSDONE               : out std_ulogic                  := '0';
		STATUS               : out std_logic_vector(7 downto 0):= "00000000";
		CLKFB                : in std_ulogic                   := '0';
		CLKIN                : in std_ulogic                   := '0';
		DSSEN                : in std_ulogic                   := '0';
		PSCLK                : in std_ulogic                   := '0';
		PSEN                 : in std_ulogic                   := '0';
		PSINCDEC             : in std_ulogic                   := '0';
		RST                  : in std_ulogic                   := '0'
	);
    end component;
begin
    GND_BIT <= '0';
    CLKA_BUFG_INST : BUFG port map (I => CLKA_BUF, O => CLKA);          -- IncludeIf_CLKA
                                                                                    
    CLK0_BUFG_INST : BUFG port map (I => CLK0_BUF, O => CLKFB_IN);
    DCM_INST : DCM_SP
    generic map( CLK_FEEDBACK            => "1X",
                 CLKDV_DIVIDE            => 16.0000,   
                 CLKFX_DIVIDE            => 5,   
                 CLKFX_MULTIPLY          => 8, 
                 CLKIN_PERIOD            => 20.0000,   
                 CLKIN_DIVIDE_BY_2       => FALSE,
                 CLKOUT_PHASE_SHIFT      => "NONE",
                 DESKEW_ADJUST           => "SYSTEM_SYNCHRONOUS",
                 DFS_FREQUENCY_MODE      => "LOW",
                 DLL_FREQUENCY_MODE      => "LOW",
                 DUTY_CYCLE_CORRECTION   => TRUE,
                 --FACTORY_JF            => x"8080",
                 PHASE_SHIFT             => 0,
                 STARTUP_WAIT            => FALSE
            )
      port map ( 
                 DSSEN    => GND_BIT,
                 PSCLK    => GND_BIT,
                 PSEN     => GND_BIT,
                 PSINCDEC => GND_BIT,
                 PSDONE   => open,
                 STATUS   => open,
                 CLKFB    => CLKFB_IN,
                 CLKIN    => CLK,
                 RST      => RST,
                 LOCKED   => LOCKED,
                 CLK0     => CLK0_BUF,
                 CLKDV    => open,
                 CLKFX    => CLKA_BUF,
                 CLKFX180 => open,
                 CLK2X    => open,
                 CLK2X180 => open,
                 CLK90    => open,
                 CLK180   => open,
                 CLK270   => open
           );
end RTL;
-- ----------------------------------------------------------------------------

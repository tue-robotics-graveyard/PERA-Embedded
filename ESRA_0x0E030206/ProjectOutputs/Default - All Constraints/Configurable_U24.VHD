-- ----------------------------------------------------------------------------
Library IEEE;
    Use     IEEE.Std_Logic_1164.All;
    Use     IEEE.Std_Logic_Unsigned.All;
    Use     IEEE.Numeric_Std.All;
-- ----------------------------------------------------------------------------

-- ----------------------------------------------------------------------------
Entity Configurable_U24 Is
   -- ------------------------------------------------------------------------
   Port (
            BYTE_WE : In Std_Logic_Vector(4 - 1 Downto 0);        -- IncludeIf_ByteWrites    
            
            EN   : In Std_Logic;                                                            -- IncludeIf_EnablePin
            
--            RST  : In Std_Logic;                                                            -- IncludeIf_ResetPin
            
            CLK  : In  Std_Logic;
            WE   : In  Std_Logic;                                                           -- IncludeIf_RAM
            DIN  : In  Std_Logic_Vector(32 - 1 Downto 0);              -- IncludeIf_RAM             
            DOUT : Out Std_Logic_Vector(32 - 1 Downto 0);             
            ADDR : In  Std_Logic_Vector(15 - 1 Downto 0)
   );
   -- ------------------------------------------------------------------------
End;
-- ----------------------------------------------------------------------------

-- ----------------------------------------------------------------------------
Architecture RTL Of Configurable_U24 Is
-- ----------------------------------------------------------------------------
    -- ------------------------------------------------------------------------
    Component Memory_U24 Is
        Port(
            bytewe : In Std_Logic_Vector(4 - 1 Downto 0);         -- IncludeIf_ByteWrites    
            
            en   : In Std_Logic;                                                            -- IncludeIf_EnablePin
            
--            rst  : In Std_Logic;                                                            -- IncludeIf_ResetPin
            
            clk  : In  Std_Logic;
            we   : In  Std_Logic;                                                           
            din  : In  Std_Logic_Vector(32 - 1 Downto 0);                           
            dout : Out Std_Logic_Vector(32 - 1 Downto 0);             
            addr : In  Std_Logic_Vector(15 - 1 Downto 0)
        );
    End Component;
    -- ------------------------------------------------------------------------

--    Signal Signal_GND      : Std_Logic;                                                     -- IncludeIf_ROM
--    Signal Signal_GND_Bus  : Std_Logic_Vector(32 - 1 Downto 0);        -- IncludeIf_ROM 
                                                                                 

-- ----------------------------------------------------------------------------
Begin
-- ----------------------------------------------------------------------------

    -- ------------------------------------------------------------------------
    U_Memory_U24 : Memory_U24 Port Map (
        
        bytewe => BYTE_WE,                                                                  -- IncludeIf_ByteWrites
        
        en      => EN,                                                                      -- IncludeIf_EnablePin   
        
--        rst     => RST,                                                                     -- IncludeIf_ResetPin
        
        clk     => CLK,  

        we      => WE,                                                                      -- IncludeIf_RAM
        din     => DIN,                                                                     -- IncludeIf_RAM

--        we      => Signal_GND,                                                              -- IncludeIf_ROM
--        din     => Signal_GND_Bus,                                                          -- IncludeIf_ROM
                                                              
        dout    => DOUT,                                                             
        addr    => ADDR
    );
    -- ------------------------------------------------------------------------
    
--    Signal_GND      <= '0';                                                                 -- IncludeIf_ROM
--    Signal_GND_Bus  <= (Others=>'0');                                                       -- IncludeIf_ROM
    

-- ----------------------------------------------------------------------------
End RTL;
-- ----------------------------------------------------------------------------


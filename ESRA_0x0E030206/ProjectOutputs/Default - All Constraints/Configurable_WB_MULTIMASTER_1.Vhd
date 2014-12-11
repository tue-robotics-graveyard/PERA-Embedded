--------------------------------------------------------------------------------                    
Library IEEE;                                                                                       
Use IEEE.Std_Logic_1164.All;                                                                        
--------------------------------------------------------------------------------                    
                                                                                                    
--------------------------------------------------------------------------------                    
Entity Configurable_WB_MULTIMASTER_1 Is                                                                        
  Port(                                                                                             
        -- s0 Signals                                                               
        s0_STB_I   : In    Std_Logic;                                               
        s0_CYC_I   : In    Std_Logic;                                               
        s0_ACK_O   : Out   Std_Logic;                                               
        s0_ADR_I   : In    Std_Logic_Vector(17-1 DownTo 0);       
        s0_DAT_O   : Out   Std_Logic_Vector(32-1    DownTo 0);       
        s0_DAT_I   : In    Std_Logic_Vector(32-1    DownTo 0);       
        s0_SEL_I   : In    Std_Logic_Vector( 3 DownTo 0);                           
        s0_WE_I    : In    Std_Logic;                                               
                                                                                                    
        -- s1 Signals                                                               
        s1_STB_I   : In    Std_Logic;                                               
        s1_CYC_I   : In    Std_Logic;                                               
        s1_ACK_O   : Out   Std_Logic;                                               
        s1_ADR_I   : In    Std_Logic_Vector(17-1 DownTo 0);       
        s1_DAT_O   : Out   Std_Logic_Vector(32-1    DownTo 0);       
        s1_DAT_I   : In    Std_Logic_Vector(32-1    DownTo 0);       
        s1_SEL_I   : In    Std_Logic_Vector( 3 DownTo 0);                           
        s1_WE_I    : In    Std_Logic;                                               
                                                                                                    
        -- Slave Signals                                                                            
        m0_STB_O      : Out   Std_Logic;                                                               
        m0_CYC_O      : Out   Std_Logic;                                                               
        m0_ACK_I      : In    Std_Logic;                                                               
        m0_ADR_O      : Out   Std_Logic_Vector(17-1 DownTo 0);                       
        m0_DAT_I      : In    Std_Logic_Vector(32-1    DownTo 0);                       
        m0_DAT_O      : Out   Std_Logic_Vector(32-1    DownTo 0);                       
        m0_SEL_O      : Out   Std_Logic_Vector( 3 DownTo 0);                                           
        m0_WE_O       : Out   Std_Logic;                                                               
        CLK_I         : In    Std_Logic;                                                               
        RST_I         : In    Std_Logic                                                                
      );                                                                                            
End Configurable_WB_MULTIMASTER_1 ;                                                                            
--------------------------------------------------------------------------------                    
                                                                                                    
--------------------------------------------------------------------------------                    
Architecture RTL Of Configurable_WB_MULTIMASTER_1 Is                                                           
   SubType TFsmState is Std_Logic_Vector(1 downto 0) ;        
                                                                                                    
   Constant s0_AccessGranted_State  : TFsmState := "01" ;                
   Constant s1_AccessGranted_State  : TFsmState := "10" ;                
                                                                                                    
   Signal State               : TFsmState ;                                                         
   Signal Next_State          : TFsmState ;                                                         
   Signal Possible_Next_State : TFsmState ;                                                         
                                                                                                    
   Signal s0_AccessRequest : Std_Logic ;                                            
   Signal s1_AccessRequest : Std_Logic ;                                            
                                                                                                    
Begin                                                                                               
--------------------------------------------------------------------------------                    
   s0_AccessRequest  <= s0_STB_I And s0_CYC_I ;     
   s1_AccessRequest  <= s1_STB_I And s1_CYC_I ;     
    Process (                                                                                       
             s0_AccessRequest,                                                  
             s1_AccessRequest                                                   
             )                                                                                      
    Begin                                                                                           
        If s0_AccessRequest='1' Then                                       
           Possible_Next_State <= s0_AccessGranted_State ;                   
        ElsIf s1_AccessRequest='1' Then                                    
           Possible_Next_State <= s1_AccessGranted_State ;                   
        Else                                                                                        
           Possible_Next_State <= s0_AccessGranted_State ;                         
        End If ;                                                                                    
    End Process;                                                                                    
--------------------------------------------------------------------------------                    
                                                                                                    
--------------------------------------------------------------------------------                    
   Process (                                                                                        
               s0_AccessRequest        ,                                            
               s0_CYC_I                ,                                            
               s0_STB_I                ,                                            
               s0_ADR_I                ,                                            
               s0_DAT_I                ,                                            
               s0_SEL_I                ,                                            
               s0_WE_I                 ,                                            
               s1_AccessRequest        ,                                            
               s1_CYC_I                ,                                            
               s1_STB_I                ,                                            
               s1_ADR_I                ,                                            
               s1_DAT_I                ,                                            
               s1_SEL_I                ,                                            
               s1_WE_I                 ,                                            
               Possible_Next_State                        ,                                         
               State                                      ,                                         
               m0_ACK_I                                      ,                                         
               m0_DAT_I                                                                                
               )                                                                                    
  Begin                                                                                             
                                                                                                    
      Next_State  <= State ;                                                                        
                                                                                                    
      m0_CYC_O <= '0' ;                                                                              
      m0_STB_O <= '0' ;                                                                              
      m0_ADR_O <= (Others=>'0') ;                                                                    
      m0_DAT_O <= (Others=>'0') ;                                                                    
      m0_SEL_O <= (Others=>'0') ;                                                                    
      m0_WE_O  <= '0' ;                                                                              
                                                                                                    
      s0_ACK_O    <= '0' ;                                                        
      s0_DAT_O    <= m0_DAT_I ;                                                        
      s1_ACK_O    <= '0' ;                                                        
      s1_DAT_O    <= m0_DAT_I ;                                                        
                                                                                                    
      Case State is                                                                                 
                                                                                                    
         When s0_AccessGranted_State =>                                             
            If  (s0_STB_I='0') Then                                               
               Next_State <= Possible_Next_State;                                                   
            Elsif m0_ACK_I = '1' then                                                                
            End If ;                                                                                
                                                                                                    
            m0_CYC_O <= s0_CYC_I ;                                                     
            m0_STB_O <= s0_STB_I ;                                                     
            m0_ADR_O <= s0_ADR_I ;                                                     
            m0_DAT_O <= s0_DAT_I ;                                                     
            m0_SEL_O <= s0_SEL_I ;                                                     
            m0_WE_O  <= s0_WE_I ;                                                      
            s0_ACK_O <= m0_ACK_I ;                                                     
            s0_DAT_O <= m0_DAT_I ;                                                     
                                                                                                    
         When s1_AccessGranted_State =>                                             
            If  (s1_STB_I='0') Then                                               
               Next_State <= Possible_Next_State;                                                   
            Elsif m0_ACK_I = '1' then                                                                
               If                                                                                   
                  (s0_AccessRequest='1')                                    
                  Then                                                                              
                  Next_State <= Possible_Next_State ;                                               
               End If ;                                                                             
            End If ;                                                                                
                                                                                                    
            m0_CYC_O <= s1_CYC_I ;                                                     
            m0_STB_O <= s1_STB_I ;                                                     
            m0_ADR_O <= s1_ADR_I ;                                                     
            m0_DAT_O <= s1_DAT_I ;                                                     
            m0_SEL_O <= s1_SEL_I ;                                                     
            m0_WE_O  <= s1_WE_I ;                                                      
            s1_ACK_O <= m0_ACK_I ;                                                     
            s1_DAT_O <= m0_DAT_I ;                                                     
                                                                                                    
         When Others =>                                                                             
            Next_State <= s0_AccessGranted_State ;                                 
                                                                                                    
      End Case ;                                                                                    
                                                                                                    
   End Process ;                                                                                    
--------------------------------------------------------------------------------                    
                                                                                                    
--------------------------------------------------------------------------------                    
   Process (CLK_I)                                                              
   Begin                                                                                            
      If Rising_Edge(CLK_I) Then                                                
         If RST_I='1' Then                                                    
            State <= s0_AccessGranted_State ;                                      
         Else                                                                                       
            State <= Next_State ;                                                                   
         End If ;                                                                                   
      End If ;                                                                                      
   End Process ;                                                                                    
--------------------------------------------------------------------------------                    
                                                                                                    
--------------------------------------------------------------------------------                    
End RTL;                                                                                            
--------------------------------------------------------------------------------                    

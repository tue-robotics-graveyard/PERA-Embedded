library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;


--Library IEEE;
--USE ieee.std_logic_1164.all;
--USE ieee.std_logic_arith.all;
--USE work.user_pkg.all;

ENTITY pwm_fpga IS
PORT
  (
  clock, reset: in STD_LOGIC;
  Data_value: in std_logic_vector(7 downto 0);
  pwm_a, pwm_b: out STD_LOGIC
  );
END pwm_fpga;

ARCHITECTURE arch_pwm OF pwm_fpga IS
signal cntr: integer range 0 to 256 := 0;
signal dir: std_logic;

BEGIN

process(clock, cntr, reset)
  begin
    if (reset = '1') then
       cntr <= 0;
       dir <= '1';
    elsif (rising_edge(clock)) then
       if (dir='1') then
         cntr <= cntr + 1;
         if (cntr = 254) then dir<='0';end if;
       elsif (dir='0') then
         cntr <= cntr - 1;
         if (cntr=0) then dir<='1'; end if;
       end if;
    end if;
end process;


process (clock, dir, cntr, reset, Data_value)
  begin
    if (reset='1') then
      pwm_a <= '0';
      pwm_b <= '0';
    elsif (rising_edge(clock)) then
      if (dir = '0') then
        if (cntr= unsigned(Data_value)) then pwm_a <= '0'; end if;
        if (cntr = 255-unsigned(Data_value)) then pwm_b <= '0'; end if;
      elsif (dir = '1') then
        if (cntr = unsigned(Data_value)) then pwm_a <= '1'; end if;
        if (cntr = 255-unsigned(Data_value)) then pwm_b <= '1'; end if;
      end if;
    end if;
end process;


END arch_pwm;

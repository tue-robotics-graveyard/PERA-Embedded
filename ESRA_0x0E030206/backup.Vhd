  clk_gen:process(clk,reset)
  variable clk_cnt   : integer range 0 to 17 :=0;
  variable cnt       : integer range 0 to 4 := 0;
--  variable ctrl      : std_logic_vector(0 to 15):="1010001101111000";
  variable ctrl      : std_logic_vector(0 to 15):="1100011111111111";
  begin
    if reset='1' then
      current_s<=idle;  --default state on reset.
--      mem(0)<="0000111111111111";
--      mem(1)<="0001111111111111";
--      mem(2)<="0010111111111111";
--      mem(3)<="0011111111111111";
--      mem(4)<="0100111111111111";
--      mem(5)<="0101111111111111";
--      mem(6)<="0110111111111111";
--      mem(7)<="0111111111111111";
    elsif rising_edge(clk) then
      current_s <= next_s;   --state change.
      adc(15)<=start_spi;
      if start_spi='1' then
        if clk_cnt=0 then
--          ctrl:=ctrlhi&adc_addr(2 downto 0)&ctrllo;
--          ctrl(3 to 5):=adc_addr(2 downto 0);
          busy_spi<='1';
          spi_adc_cs<='0';
          spi_adc_sclk<='1';
          spi_adc_mosi<=ctrl(0);
          cnt:=0;
          clk_cnt:=1;
        elsif clk_cnt<16 then
          cnt:=cnt+1;
          if cnt=2 then -- falling edge
            spi_adc_cs<='0';
            spi_adc_sclk<='0';
          elsif cnt>=4 then -- rising edge
            spi_adc_cs<='0';
            spi_adc_sclk<='1';
            spi_adc_mosi<=ctrl(clk_cnt);
            clk_cnt:=clk_cnt+1;
            adc(16-clk_cnt)<=spi_adc_miso;
            cnt:=0;
          end if;
        elsif clk_cnt=16 then
          cnt:=cnt+1;
          if cnt=2 then -- falling edge
            spi_adc_cs<='0';
            spi_adc_sclk<='0';
          elsif cnt>=4 then -- rising edge
            spi_adc_cs<='0';
            spi_adc_sclk<='1';
            spi_adc_mosi<='0';
            clk_cnt:=clk_cnt+1;
            cnt:=0;
          end if;
        else
          mem(to_integer(unsigned(adc(14 downto 12))))<=adc;
          spi_adc_cs<='0';
          busy_spi<='0';
          clk_cnt:=0;
          cnt:=0;
        end if;
      else
        spi_adc_cs<='1';
        busy_spi<='0';
        ctrl:="0000000000000000";
        clk_cnt:=0;
        cnt:=0;
      end if;
    end if;
  end process;
--  adc_get:process(clk)
  adc_get:process(clk,current_s,adc_addr(7),busy_spi)
  begin
--    if rising_edge(clk) then
      case current_s is
      when idle =>
        if adc_addr(7)='1' then
          start_spi<='1';
          next_s<=wait_adc;
        else
          start_spi<='0';
          next_s<=idle;
        end if;
      when wait_adc =>
        start_spi<='1';
        if adc_addr(7)='0' then
          next_s<=read_adc;
        else
          next_s<=wait_adc;
        end if;
      when read_adc =>
        start_spi<='1';
        if busy_spi='1' then
          next_s<=read_adc;
        else
          next_s<=idle;
        end if;
      end case;
--    end if;
  end process;



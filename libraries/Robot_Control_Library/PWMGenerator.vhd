library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- CLK decides frequency of PWM output. 
-- freq = CLK/(2^PWM_WIDTH)
entity PWMGenerator is
  generic (
    C_PWM_WIDTH : integer := 8;
    C_PWM_TYPE : integer := 1           -- 2 phase, 1 phase or Enable chopping
  );
  port ( 
    Clk : in std_logic;
--    Dir : in std_logic;
    Duty : in std_logic_vector(C_PWM_WIDTH-1 downto 0) := (others => '0');
    Out1 : out std_logic;
    Out2 : out std_logic    
  );
end PWMGenerator;

architecture Behavioral of PWMGenerator is

  signal duty_cnt : unsigned(C_PWM_WIDTH-2 downto 0) := (others => '0');
  signal duty_i : unsigned(C_PWM_WIDTH-1 downto 0) := (others => '0');
  signal pwm_i : std_logic := '0';
begin
	duty_i <= unsigned(Duty);
	
  Process(CLK)
  begin
    if Clk='1' and Clk'event then
      duty_cnt <= duty_cnt + 1;
      if duty_i >= 0 then
        if duty_cnt < CONV_UNSIGNED(duty_i(C_PWM_WIDTH-2 downto 0),C_PWM_WIDTH-1) then
          pwm_i <= '1';
        else
          pwm_i <= '0';
        end if;
      else
        if duty_cnt < CONV_UNSIGNED(duty_i(C_PWM_WIDTH-2 downto 0),C_PWM_WIDTH-1) then
          pwm_i <= '0';
        else
          pwm_i <= '1';
        end if;
      end if;
    end if;
  end Process;

G_2_PHASE_CHOPPING : if C_PWM_TYPE=0 generate
  Process( CLK ) 
  --variable duty_cnt : signed(C_PWM_WIDTH-1 downto 0) := (others => '0');
  --variable pwm_i : std_logic;
  begin
    if Clk='1' and Clk'event then
--      CONV_UNSIGNED(<signed_sig>, <integer>)
--      if duty_cnt < Duty then
--        pwm_i := '1';
--      else
--        pwm_i := '0';
--      end if;
      --if dir='1' then
      if duty_i >= 0 then 
        Out1 <= pwm_i;
        Out2 <= '0';
      else
        Out1 <= '0';
        Out2 <= pwm_i;
      end if;
      --duty_cnt := duty_cnt + 1;
    end if;
  end Process;
end generate G_2_PHASE_CHOPPING;

G_1_PHASE_CHOPPING : if C_PWM_TYPE=1 generate
  Process( Clk ) 
  --variable duty_cnt : unsigned(C_PWM_WIDTH-1 downto 0) := (others => '0');
  --variable pwm_i : std_logic;
  begin
    if Clk='1' and Clk'event then
--      if duty_cnt < CONV_UNSIGNED(Duty,C_PWM_WIDTH) then        
--        pwm_i := '1';
--      else
--        pwm_i := '0';
--      end if;
      --if Dir='1' then
      if duty_i >= 0 then
        Out1 <= pwm_i;
        Out2 <= '0';
      else
        Out1 <= not pwm_i;
        Out2 <= '1';        
      end if;
      --duty_cnt := duty_cnt + 1;
    end if;
  end Process;
end generate G_1_PHASE_CHOPPING;      

G_ENABLE_CHOPPING : if C_PWM_TYPE=2 generate
  Process( Clk ) 
  --variable duty_cnt : unsigned(C_PWM_WIDTH-1 downto 0) := (others => '0');
  begin
    if Clk='1' and Clk'event then
--      if duty_cnt < CONV_UNSIGNED(Duty,C_PWM_WIDTH) then
--        Out1 <= '1';
--      else
--        Out1 <= '0';
--      end if;
--      duty_cnt := duty_cnt + 1;
      Out1 <= pwm_i;
      if duty_i >= 0 then
        Out2 <= '0';
      else
        Out2 <= '1';
      end if;
    end if;
  end Process;
end generate G_ENABLE_CHOPPING;      

          
end Behavioral;

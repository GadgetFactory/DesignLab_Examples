library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
-- use IEEE.MATH_REAL.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity quad_inst is
  generic (
    C_QE_CLK_COUNT_WIDTH : integer := 32;
    C_QE_PULSE_COUNT_WIDTH : integer := 32;
    C_QE_REV_COUNT_WIDTH : integer := 32;
    C_QE_NUM_COUNT : integer := 5;
    C_QE_SPEED_WIDTH : integer := 32;
    C_QE_ACCELERATION_WIDTH : integer := 32;
    C_QE_SPEED_TYPE : integer := 0 --0: clock ticks between C_QE_NUM_COUNT number of A_CLK's. 1: A_CLK's in timers timeinterval 
  );
  port (
    CLK : in std_logic; -- clk for timer
    Reset : in std_logic; -- reset
    A_CLK : in std_logic; -- clk
    B_CLK : in std_logic; -- 90 phase clk
    I_CLK : in std_logic; -- Revolutions clk
    PULSE_COUNT : out std_logic_vector(C_QE_PULSE_COUNT_WIDTH-1 downto 0); -- pulse count 
    REV_COUNT : out std_logic_vector(C_QE_REV_COUNT_WIDTH-1 downto 0); -- Revolutions count
    TSPEED : out std_logic_vector(C_QE_SPEED_WIDTH-1 downto 0); -- number of clk's between 1 puls
    TACCEL : out std_logic_vector(C_QE_ACCELERATION_WIDTH-1 downto 0)  -- number of clk's between each speed measurement
  );
end quad_inst;

architecture Behavioral of quad_inst is
  signal A_CLK_i, B_CLK_i, I_CLK_i : std_logic := '0';
  signal timer_reset,sreset,mreset : std_logic := '0';
  signal timer : signed(C_QE_CLK_COUNT_WIDTH-1 downto 0) := (others => '0');
  signal pulse_count_i : signed(C_QE_PULSE_COUNT_WIDTH-1 downto 0) := (others => '0'); -- pulse count internal
  signal rev_count_i : signed(C_QE_REV_COUNT_WIDTH-1 downto 0) := (others => '0'); -- revolution count internal
  signal speed : signed(C_QE_SPEED_WIDTH-1 downto 0) := (others => '0');
  signal accel : signed(C_QE_ACCELERATION_WIDTH-1 downto 0) := (others => '0');


begin
  PULSE_COUNT <= std_logic_vector(pulse_count_i); 
  REV_COUNT <= std_logic_vector(rev_count_i); 
  TSPEED <= std_logic_vector(speed); 
  TACCEL <= std_logic_vector(accel);
  timer_reset <= sreset xor mreset;
  
  -- Process synchronizing A, B and I and to handle timer
  Process(CLK)
  begin
    if CLK'event and CLK='1' then
      if timer_reset='1' then
        timer <= (others => '0');
        mreset <= not mreset;
      else
        timer <= timer + 1;
      end if;
      A_CLK_i <= A_CLK;
      B_CLK_i <= B_CLK;
      I_CLK_i <= I_CLK;
    end if;    
  end process;

  -- Process handling A pulse count
--  Process(A_CLK_i)
  Process(Clk, Reset)
    variable A_CLK_i_last : std_logic := '0';
  begin
--    if A_CLK_i'event and A_CLK_i='1' then
    if CLK'event and CLK='1' then
      if Reset='1' then
        pulse_count_i <= (others=>'0');
      else
        if A_CLK_i = not A_CLK_i_last then
          A_CLK_i_last := A_CLK_i;
          if B_CLK_i='1' then
            pulse_count_i <= pulse_count_i-A_CLK_i;
          else
            pulse_count_i <= pulse_count_i+A_CLK_i;
          end if;
        end if;
      end if;
    end if;
  end Process;

  SPEED0: if C_QE_SPEED_TYPE = 0 generate
    -- Process handling speed and acceleration
    -- count clock ticks between C_QE_NUM_COUNT number of A_CLK's
--    Process(A_CLK_i)
    process (CLK)
      variable pulses : integer range 0 to C_QE_NUM_COUNT := 0;
      variable last_speed : signed(C_QE_SPEED_WIDTH-1 downto 0) := (others => '0');
      variable A_CLK_i_last : std_logic := '0';
    begin
--      if A_CLK_i'event and A_CLK_i='1' then
      if CLK'event and CLK='1' then
        if A_CLK_i = not A_CLK_i_last then
          A_CLK_i_last := not A_CLK_i_last;
          pulses := pulses + conv_integer(A_CLK_i);
          if pulses = C_QE_NUM_COUNT then
            pulses := 0;
            if B_CLK_i='1' then
              speed <= -timer;
            else
              speed <= timer;
            end if;
            if timer(C_QE_CLK_COUNT_WIDTH-1)='1' then
              speed <= (others=>'0');          
            end if;
            accel <= speed-last_speed;
            last_speed := speed;
            sreset <= not sreset;
          end if;
        end if;      
      end if;
      
    end process;
  end generate;

  SPEED1: if C_QE_SPEED_TYPE = 1 generate
    -- Other process handling speed and acceleration
    -- Number of A_CLK's in timers timeinterval
    Process(CLK)
    variable last_pulse_count_i : signed(C_QE_PULSE_COUNT_WIDTH-1 downto 0) := (others => '0');
    variable last_speed : signed(C_QE_SPEED_WIDTH-1 downto 0) := (others => '0');
    begin
      if CLK'event and CLK='0' then -- down flank to ensure timer reset
        if timer(C_QE_CLK_COUNT_WIDTH-1)='1' then -- signed timer overflow
          speed <= pulse_count_i - last_pulse_count_i;
          last_pulse_count_i := pulse_count_i;
          accel <= speed-last_speed;
          last_speed := speed;
          sreset <= not sreset; -- toggle timer_reset
        end if;
      end if;
    end Process;
  end generate;

  --Process handling revolution count
--Process(I_CLK_i)
  process(CLK)
    variable I_CLK_i_last : std_logic := '0';
  begin
    --if I_CLK_i'event and I_CLK_i = '1' then
    if CLK'event and CLK='1' then
      if I_CLK_i = not I_CLK_i_last then
        I_CLK_i_last := not I_CLK_i_last;
        if B_CLK_i = '1' then
          rev_count_i <= rev_count_i - I_CLK_i;
        else
          rev_count_i <= rev_count_i + I_CLK_i; 
        end if;
      end if;
    end if;
  end Process;

--  Process(CLK)
--  --variable clk_count : unsigned(15 downto 0) := x"0000";
--  --constant clk_rollover : unsigned(7 downto 0) := x"00";
--  variable timer : signed(C_QE_CLK_COUNT_WIDTH-1 downto 0) := (others => '0');
--  constant max : signed(C_QE_CLK_COUNT_WIDTH-1 downto 0) := (0 => '0', others => '1');
--  variable overflow : std_logic := '0';
--  variable a_last : std_logic := '0';
--  variable i_last : std_logic := '0';
--
--  variable p_count : signed(C_QE_PULSE_COUNT_WIDTH-1 downto 0) := (others => '0');
--  variable r_count : signed(C_QE_REV_COUNT_WIDTH-1 downto 0) := (others => '0');
--  
--  --variable lasttime : unsigned(15 downto 0) := x"0000";
--  --variable a_count : unsigned (LOG2(C_QE_NUM_COUNT) downto 0) := (others => '0');
--  variable a_count : std_logic_vector (1 downto 0) := (others => '0');
--  variable speed : signed(C_QE_SPEED_WIDTH-1 downto 0) := (others => '0');
--  variable lastspeed : signed(C_QE_SPEED_WIDTH-1 downto 0) := (others => '0');
--  variable accel : signed(C_QE_ACCELERATION_WIDTH-1 downto 0) := (others => '0');
--   
--  begin
--    if CLK'event and CLK='1' then
--      if Reset = '1' then
--        p_count := (others => '0');
--        r_count := (others => '0');
--        timer := (others => '0');
--        speed := (others => '0');
--        lastspeed := (others => '0');
--        accel := (others => '0');
--        TSPEED <= (others => '0');
--        TACCEL <= (others => '0');
--      else
--        if(timer = max) then
--          overflow := '1';
--          speed := (others => '0');
--          TSPEED <= (others => '0');
--          TACCEL <= (others => '0');
--        end if;
--        timer := timer + 1;
--  --      clk_count := clk_count + 1;
--  --      if(clk_count >= clk_rollover) then
--  --        clk_count := (others => '0');
--  --        if(timer = max) then
--  --          overflow := '1';
--  --          TSPEED <= (others => '0');
--  --        end if;
--  --        timer := timer + 1;
--  --      end if;
--        -- if A has changed:
--        if A_CLK = not a_last then
--          a_last := A_CLK;
--          if A_CLK = '1' then
--            -- update the position:
--            if B_CLK = '1' then
--              p_count := p_count - 1;
--            else
--              p_count := p_count + 1; 
--            end if;
--            PULSE_COUNT <= p_count;
--
--            -- update the speed 
--            if overflow = '1' then
--              --TSPEED og speed nulstilles ved overflow længere oppe
--              overflow := '0';
--            else
--              if a_count = 2 then
--                --speed := CONV_SIGNED(timer, C_QE_CLK_COUNT_WIDTH);
--                speed := timer;
--                --if C_QE_CLK_COUNT_WIDTH < C_QE_SPEED_WIDTH then
--                  --speed(C_QE_CLK_COUNT_WIDTH-1 to 0) := timer(C_QE_CLK_COUNT_WIDTH-1 to 0);
--                --end if;
--                if B_CLK = '1' then
--                  speed := -speed;
--                end if;
--                a_count := (others => '0');
--                timer := (others => '0');
--              else
--                a_count := a_count + 1;
--              end if;
--              TSPEED <= speed;
--            end if;          
--          
--            
--            -- update the accel
--  --          if speed>lastspeed then
--  --            accel := speed-lastspeed;
--  --          else
--  --            accel := (x"ffff"-lastspeed)+ speed;
--  --          end if;    
--  --          lastspeed := speed;
--  --          TACCEL <= accel;
--            accel := speed-lastspeed;
--            lastspeed := speed;
--            TACCEL <= accel;
--          end if;  --A_CLK = '1'
--        end if; --A_CLK = not a_last
--        -- if I has changed:
--        if I_CLK = not i_last then
--          i_last := I_CLK;
--          if I_CLK = '1' then
--            -- update the revolution
--            if B_CLK = '1' then
--              r_count := r_count - 1;
--            else
--              r_count := r_count + 1; 
--            end if;
--            --p_count := "00000000000";
--            REV_COUNT <= r_count;
--          end if;
--        end if;
--      end if; -- Reset
--    end if; -- CLK'event
--  End Process;
end Behavioral;

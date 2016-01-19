library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Simulate_Your_CCL_Design is
end entity;


architecture sim of Simulate_Your_CCL_Design is

  constant period: time := 10 ns;

  signal clk: std_logic := '1';
  signal rst: std_logic := '0';
	
	COMPONENT BENCHY_wb_SumpBlaze_LogicAnalyzer32
	PORT(
		clk_32Mhz : IN std_logic;
		wishbone_in : IN std_logic_vector(100 downto 0);
		la : IN std_logic_vector(31 downto 0);          
		wishbone_out : OUT std_logic_vector(100 downto 0);
		wishbone_slot_video_in : out std_logic_vector(100 downto 0);
		wishbone_slot_video_out : in std_logic_vector(100 downto 0);		
		reset : IN std_logic;
		tx : OUT std_logic
		);
	END COMPONENT;	

  signal wb_dat_o:   std_logic_vector(31 downto 0);
  signal wb_dat_i:   std_logic_vector(31 downto 0);
  signal wb_adr_i:   std_logic_vector(31 downto 0);
  signal wb_we_i:    std_logic := '0';
  signal wb_cyc_i:   std_logic := '0';
  signal wb_stb_i:   std_logic := '0';
  signal wb_ack_o:   std_logic;
  
  signal wb_in:   std_logic_vector(100 downto 0);
  signal wb_out:   std_logic_vector(100 downto 0);
  
  signal wb_v_out:   std_logic_vector(100 downto 0);
  signal wb_v_in:   std_logic_vector(100 downto 0);
  
  signal wb_dat_o_dly:   std_logic_vector(31 downto 0);
  
  --Define your Register addresses here
  constant REGISTER0_ADDR:   std_logic_vector(31 downto 0) := x"00000000";
  constant REGISTER1_ADDR:   std_logic_vector(31 downto 0) := x"00000001";
  constant REGISTER2_ADDR:   std_logic_vector(31 downto 0) := x"00000002";
  
  --Define your external connections here
	signal count : std_logic_vector(31 downto 0);
	signal count_en : std_logic;  

begin

  clk <= not clk after period/2;

  -- Reset
  process
  begin
    wait for 5 ns;
    rst <= '1';
    wait for 20 ns;
    rst <= '0';
    wait;
  end process;
  
  process(clk, rst)
  begin
	 if rst = '1' then
		count <= X"00000000";
	 elsif rising_edge(clk) then
		if count_en = '1' then
		  count <= count + 1;
		end if;
	 end if;
  end process;  

	Inst_BENCHY_wb_SumpBlaze_LogicAnalyzer32: BENCHY_wb_SumpBlaze_LogicAnalyzer32 PORT MAP(
		clk_32Mhz => clk,
		wishbone_in => wb_in,
		wishbone_out => wb_out,
		wishbone_slot_video_in => wb_v_in,
		wishbone_slot_video_out => wb_v_out,	
--		la => "10101010101010101010101010101010",
		la => count,
		reset => rst,
		tx => OPEN
	);
	
  wb_in(61) <= clk;
  wb_in(60) <= rst;
  wb_in(59 downto 28) <= wb_dat_i;
  wb_in(27 downto 3) <= wb_adr_i(24 downto 0);
  wb_in(2) <= wb_we_i;
  wb_in(1) <= wb_cyc_i;
  wb_in(0) <= wb_stb_i; 
  wb_dat_o <= wb_out(33 downto 2);
  wb_ack_o <= wb_out(1);
  --wb_inta_o <= wb_out(0);

  -- Delayed read
  wb_dat_o_dly<=transport wb_dat_o after 1 ps;

  process
    procedure wbwrite(a: in std_logic_vector(31 downto 0); d: in std_logic_vector(31 downto 0) ) is
    begin
      wb_cyc_i<='1';
      wb_stb_i<='1';
      wb_we_i<='1';
      wb_dat_i<=d;
      wb_adr_i<=a;
      wait until rising_edge(clk);
		if wb_ack_o /= '1' then
			wait until wb_ack_o='1';
		end if;
      wait until rising_edge(clk);
      wb_cyc_i<='0';
      wb_stb_i<='0';
      wb_we_i <='0';
    end procedure;

    procedure wbread( a: in std_logic_vector(31 downto 0); d: out std_logic_vector(31 downto 0)) is
    begin
      wb_cyc_i<='1';
      wb_stb_i<='1';
      wb_we_i<='0';
      wb_adr_i<=a;
      wait until rising_edge(clk);
		if wb_ack_o /= '1' then
			wait until wb_ack_o='1';
		end if;
      wait until rising_edge(clk);
      d := wb_dat_o_dly;
      wb_cyc_i<='0';
      wb_stb_i<='0';
      wb_we_i <='0';
    end procedure;
	

    variable r : std_logic_vector(31 downto 0);

  begin
    
    wait until rst='1';
    wait until rst='0';
	 count_en <= '1';
    wait until rising_edge(clk);
	 

	-- This is where you should start providing your stimulus to test your design.
	
	-- Test register R/W
	-- Read and write to the Wishbone Bus
	-- Write a reset
		wbwrite( REGISTER1_ADDR, x"00000000");	
   -- Execute
		wbwrite( REGISTER0_ADDR, x"00000001");
		wbwrite( REGISTER0_ADDR, x"00000000");		
		wait for 100 ns;	
	-- Init all settings
	
	-- Trigger Masks
		wbwrite( REGISTER1_ADDR, x"000000C0");	
		wbwrite( REGISTER2_ADDR, x"00000000");	
   -- Execute
		wbwrite( REGISTER0_ADDR, x"00000001");
		wbwrite( REGISTER0_ADDR, x"00000000");
	-- Trigger Values
		wbwrite( REGISTER1_ADDR, x"000000C1");	
		wbwrite( REGISTER2_ADDR, x"00000000");	
   -- Execute
		wbwrite( REGISTER0_ADDR, x"00000001");
		wbwrite( REGISTER0_ADDR, x"00000000");
	-- Trigger Configuration
		wbwrite( REGISTER1_ADDR, x"000000C2");	
		wbwrite( REGISTER2_ADDR, x"08000000");	
   -- Execute
		wbwrite( REGISTER0_ADDR, x"00000001");
		wbwrite( REGISTER0_ADDR, x"00000000");		
	-- Set Divider
		wbwrite( REGISTER1_ADDR, x"00000080");	
		wbwrite( REGISTER2_ADDR, x"00000000");	
   -- Execute
		wbwrite( REGISTER0_ADDR, x"00000001");
		wbwrite( REGISTER0_ADDR, x"00000000");	
	-- Set Read and Delay Count
		wbwrite( REGISTER1_ADDR, x"00000081");	
		wbwrite( REGISTER2_ADDR, x"01ff01ff");	
   -- Execute
		wbwrite( REGISTER0_ADDR, x"00000001");
		wbwrite( REGISTER0_ADDR, x"00000000");	
	-- Set Flags
		wbwrite( REGISTER1_ADDR, x"00000082");	
		wbwrite( REGISTER2_ADDR, x"00000002");	
   -- Execute
		wbwrite( REGISTER0_ADDR, x"00000001");
		wbwrite( REGISTER0_ADDR, x"00000000");		
	-- Arm the trigger
		wbwrite( REGISTER1_ADDR, x"00000001");
   -- Execute
		wbwrite( REGISTER0_ADDR, x"00000001");
		wbwrite( REGISTER0_ADDR, x"00000000");
	
    wait for 80 us;
    report "Finsihed" severity failure;
  end process;


end sim;


-- VHDL Instantiation Created from source file BitCoin_Miner.vhd -- 14:42:48 03/31/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT BitCoin_Miner
	PORT(
		clk_32Mhz : IN std_logic;
		RxD : IN std_logic;
		disp_switch : IN std_logic;          
		TxD : OUT std_logic;
		anode : OUT std_logic_vector(3 downto 0);
		segment : OUT std_logic_vector(7 downto 0);
		led : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	Inst_BitCoin_Miner: BitCoin_Miner PORT MAP(
		clk_32Mhz => ,
		RxD => ,
		TxD => ,
		anode => ,
		segment => ,
		disp_switch => ,
		led => 
	);



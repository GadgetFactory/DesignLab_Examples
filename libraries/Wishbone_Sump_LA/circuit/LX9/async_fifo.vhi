
-- VHDL Instantiation Created from source file async_fifo.vhd -- 10:03:08 01/22/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT async_fifo
	PORT(
		clk_r : IN std_logic;
		clk_w : IN std_logic;
		arst : IN std_logic;
		wr : IN std_logic;
		rd : IN std_logic;
		write : IN std_logic_vector(7 downto 0);          
		read : OUT std_logic_vector(7 downto 0);
		almost_full : OUT std_logic;
		empty : OUT std_logic
		);
	END COMPONENT;

	Inst_async_fifo: async_fifo PORT MAP(
		clk_r => ,
		clk_w => ,
		arst => ,
		wr => ,
		rd => ,
		write => ,
		read => ,
		almost_full => ,
		empty => 
	);



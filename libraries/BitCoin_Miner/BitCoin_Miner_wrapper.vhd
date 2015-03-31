--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : 
--  /   /         Filename : xil_12112_30
-- /___/   /\     Timestamp : 09/23/2014 15:24:59
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: 
--
-- This file just wraps a schematic based symbol with a VHDL wrapper so it will show up in the unused module libaries section instead of the top level in ISE Navigator.

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

library DesignLab;
use DesignLab.ALL;

entity BitCoin_Miner_wrapper is
   port ( wishbone_in  : in    std_logic_vector (100 downto 0); 
          wishbone_out : out   std_logic_vector (100 downto 0);
			 
			 --Put your external connections here
			 leds : out std_logic_vector(3 downto 0);
			 buttons : in std_logic_vector(3 downto 0)
			 );
end BitCoin_Miner_wrapper;

architecture BEHAVIORAL of BitCoin_Miner_wrapper is

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

begin

	Inst_BitCoin_Miner: BitCoin_Miner PORT MAP(
		led => OPEN
	);

end BEHAVIORAL;



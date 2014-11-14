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

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Wishbone_Symbol_Example is
   port ( wishbone_in  : in    std_logic_vector (61 downto 0); 
          wishbone_out : out   std_logic_vector (33 downto 0);
			 
			 --Put your external connections here
			 leds : out std_logic_vector(3 downto 0);
			 buttons : in std_logic_vector(3 downto 0)
			 );
end Wishbone_Symbol_Example;

architecture BEHAVIORAL of Wishbone_Symbol_Example is

	COMPONENT Wishbone_to_Registers
	PORT(
		wishbone_in : IN std_logic_vector(61 downto 0);
		register0_in : IN std_logic_vector(31 downto 0);
		register1_in : IN std_logic_vector(31 downto 0);
		register2_in : IN std_logic_vector(31 downto 0);          
		wishbone_out : OUT std_logic_vector(33 downto 0);
		register0_out : OUT std_logic_vector(31 downto 0);
		register1_out : OUT std_logic_vector(31 downto 0);
		register2_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal register0_in: std_logic_vector(31 downto 0);
	signal register0_out: std_logic_vector(31 downto 0);
	signal register1_in: std_logic_vector(31 downto 0);
	signal register1_out: std_logic_vector(31 downto 0);
	signal register2_in: std_logic_vector(31 downto 0);
	signal register2_out: std_logic_vector(31 downto 0);	
	
	--Put your unique register names here

begin

	--Put your code here
	leds <= register0_out(3 downto 0);
	register1_in(3 downto 0) <= buttons;

	--Do not touch
	Inst_Wishbone_to_Registers: Wishbone_to_Registers PORT MAP(
		wishbone_in => wishbone_in,
		wishbone_out => wishbone_out,
		register0_in => register0_in,
		register0_out => register0_out,
		register1_in => register1_in,
		register1_out => register1_out,
		register2_in => register2_in,
		register2_out => register2_out
	);

end BEHAVIORAL;



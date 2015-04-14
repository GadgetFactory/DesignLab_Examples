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

--library work;
--use work.Wishbone_to_Registers_n_package.all;

library DesignLab;
use DesignLab.ALL;
use DesignLab.Wishbone_to_Registers_n_package.all;

entity Robot_Control_Library is
	generic ( register_count : integer := 2 );
   port ( wishbone_in  : in    std_logic_vector (100 downto 0); 
          wishbone_out : out   std_logic_vector (100 downto 0);
			 
			 --Put your external connections here
			 leds : out std_logic_vector(3 downto 0);
			 buttons : in std_logic_vector(3 downto 0)
			 );
end Robot_Control_Library;

architecture BEHAVIORAL of Robot_Control_Library is

	COMPONENT Wishbone_to_Registers_n
	generic ( register_count : integer := register_count );
	PORT(
		wishbone_in : IN std_logic_vector(100 downto 0);         
		wishbone_out : OUT std_logic_vector(100 downto 0);
		register_in : in register_type(0 to register_count-1);
		register_out : out register_type(0 to register_count-1)
		);
	END COMPONENT;
	
  signal register_in_array : register_type(0 to register_count-1);
  signal register_out_array : register_type(0 to register_count-1);	
	
	--Put your unique register names here

begin

	--Put your code here
	leds <= register_out_array(0)(3 downto 0);
	register_in_array(1)(3 downto 0) <= buttons;

	--Do not touch
	Inst_Wishbone_to_Registers_n: Wishbone_to_Registers_n 
	generic map (register_count => register_count) 
	PORT MAP(
		wishbone_in => wishbone_in,
		wishbone_out => wishbone_out,
		register_in => register_in_array,
		register_out => register_out_array
	);

end BEHAVIORAL;



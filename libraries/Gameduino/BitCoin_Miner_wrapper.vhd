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

entity Gameduino_wrapper is
   port ( wishbone_in  : in    std_logic_vector (100 downto 0); 
          wishbone_out : out   std_logic_vector (100 downto 0);
			 
			 --Put your external connections here
			 leds : out std_logic_vector(3 downto 0);
			 buttons : in std_logic_vector(3 downto 0)
			 );
end Gameduino_wrapper;

architecture BEHAVIORAL of Gameduino_wrapper is

	COMPONENT Gameduino
	PORT(
		clk_25Mhz : IN std_logic;
		SCK : IN std_logic;
		MOSI : IN std_logic;
		SSEL : IN std_logic;
		flashMISO : IN std_logic;    
		VGA_Bus : INOUT std_logic_vector(32 downto 0);
		MISO : INOUT std_logic;
		AUX : INOUT std_logic;      
		vga_red : OUT std_logic_vector(2 downto 0);
		vga_green : OUT std_logic_vector(2 downto 0);
		vga_blue : OUT std_logic_vector(2 downto 0);
		vga_hsync_n : OUT std_logic;
		vga_vsync_n : OUT std_logic;
		AUDIOL : OUT std_logic;
		AUDIOR : OUT std_logic;
		flashMOSI : OUT std_logic;
		flashSCK : OUT std_logic;
		flashSSEL : OUT std_logic
		);
	END COMPONENT;

begin

	Inst_Gameduino: Gameduino PORT MAP(
		AUDIOR => OPEN
	);

end BEHAVIORAL;



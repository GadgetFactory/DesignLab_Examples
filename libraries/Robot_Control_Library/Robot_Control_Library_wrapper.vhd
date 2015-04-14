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

entity Robot_Control_Library_wrapper is
   port ( wishbone_in  : in    std_logic_vector (100 downto 0); 
          wishbone_out : out   std_logic_vector (100 downto 0);
			 
			 --Put your external connections here
			 leds : out std_logic_vector(3 downto 0);
			 buttons : in std_logic_vector(3 downto 0)
			 );
end Robot_Control_Library_wrapper;

architecture BEHAVIORAL of Robot_Control_Library_wrapper is

   COMPONENT Robot_Control_Library
   PORT( wishbone_out	:	OUT	STD_LOGIC_VECTOR (100 DOWNTO 0); 
          wishbone_in	:	IN	STD_LOGIC_VECTOR (100 DOWNTO 0); 
          leds	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          buttons	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0));
   END COMPONENT;

begin

   VHDL_Wrapper: Robot_Control_Library PORT MAP(
		leds => OPEN
   );

end BEHAVIORAL;



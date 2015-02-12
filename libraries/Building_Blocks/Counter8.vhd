--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : 
--  /   /         Filename : xil_20436_30
-- /___/   /\     Timestamp : 04/30/2014 13:59:41
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: 
--

library ieee;
use ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Counter8 is
   port ( clk    : in    std_logic;
			 reset  : in    std_logic;
          count0 : out   std_logic; 
          count1 : out   std_logic; 
          count2 : out   std_logic; 
          count3 : out   std_logic; 
          count4 : out   std_logic; 
          count5 : out   std_logic; 
          count6 : out   std_logic; 
          count7 : out   std_logic);
end Counter8;

architecture BEHAVIORAL of Counter8 is
	signal counter : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin

   --Counter to drive divider 
   count: process(clk)
   begin
		if reset='1' then 
			counter <= (others => '0');	
		elsif rising_edge(clk) then
			counter <= counter+1;
		end if;
   end process;
	
	count0 <= counter(0);
	count1 <= counter(1);
	count2 <= counter(2);
	count3 <= counter(3);
	count4 <= counter(4);
	count5 <= counter(5);
	count6 <= counter(6);
	count7 <= counter(7);
end BEHAVIORAL;


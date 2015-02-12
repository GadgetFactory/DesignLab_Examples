--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : 
--  /   /         Filename : xil_10848_32
-- /___/   /\     Timestamp : 04/29/2014 16:01:15
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

entity clk_divider is
   port ( clk   : in    std_logic; 
          div2  : out   std_logic; 
          div4   : out   std_logic; 
          div8   : out   std_logic; 
          div16   : out   std_logic; 
          div32   : out   std_logic; 
          div64 : out   std_logic; 
          div128 : out   std_logic; 
          div256 : out   std_logic);
end clk_divider;

architecture BEHAVIORAL of clk_divider is
	signal counter : STD_LOGIC_VECTOR(12 downto 0) := (others => '0');
begin

   --Counter to drive divider 
   count: process(clk)
   begin
     if rising_edge(clk) then
       counter <= counter+1;
     end if;
   end process;
	
	div2 <= counter(0);
	div4 <= counter(1);
	div8 <= counter(2);
	div16 <= counter(3);
	div32 <= counter(4);
	div64 <= counter(5);
	div128 <= counter(6);
	div256 <= counter(7);

end BEHAVIORAL;



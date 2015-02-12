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

entity clk_divider_32Mhz is
   port ( clk_32Mhz   : in    std_logic; 
          div1_16Mhz  : out   std_logic; 
          div2_8Mhz   : out   std_logic; 
          div3_4Mhz   : out   std_logic; 
          div4_2Mhz   : out   std_logic; 
          div5_1Mhz   : out   std_logic; 
          div6_500Khz : out   std_logic; 
          div7_250Khz : out   std_logic; 
          div8_125Khz : out   std_logic);
end clk_divider_32Mhz;

architecture BEHAVIORAL of clk_divider_32Mhz is
	signal counter : STD_LOGIC_VECTOR(47 downto 0) := (others => '0');
begin

   --Counter to drive divider 
   count: process(clk_32Mhz)
   begin
     if rising_edge(clk_32Mhz) then
       counter <= counter+1;
     end if;
   end process;
	
	div1_16Mhz <= counter(0);
	div2_8Mhz <= counter(2);
	div3_4Mhz <= counter(3);
	div4_2Mhz <= counter(4);
	div5_1Mhz <= counter(5);
	div6_500Khz <= counter(6);
	div7_250Khz <= counter(7);
	div8_125Khz <= counter(12);

end BEHAVIORAL;



--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : 
--  /   /         Filename : xil_10848_33
-- /___/   /\     Timestamp : 04/29/2014 16:24:14
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

entity clk_divider_32Mhz_low_speed is
   port ( clk_32Mhz    : in    std_logic; 
          div12_7812hz : out   std_logic; 
          div13_3906hz : out   std_logic; 
          div14_1953hz : out   std_logic; 
          div15_976hz  : out   std_logic; 
          div16_488hz  : out   std_logic; 
          div17_244hz  : out   std_logic; 
          div18_122hz  : out   std_logic; 
          div19_61hz   : out   std_logic);
end clk_divider_32Mhz_low_speed;

architecture BEHAVIORAL of clk_divider_32Mhz_low_speed is
	signal counter : STD_LOGIC_VECTOR(47 downto 0) := (others => '0');
	signal clk_32Mhz_b, div19_61hz_s : std_logic;
begin

--	 clkin_inst: BUFG
--    port map (
--      I =>  clk_32Mhz,
--      O =>  clk_32Mhz_b
--    );

	 clkin_inst1: BUFG
    port map (
      I =>  div19_61hz_s,
      O =>  div19_61hz
    );

   --Counter to drive divider 
   count: process(clk_32Mhz)
   begin
     if rising_edge(clk_32Mhz) then
       counter <= counter+1;
     end if;
   end process;
	
	div12_7812hz <= counter(12);
	div13_3906hz <= counter(13);
	div14_1953hz <= counter(14);
	div15_976hz <= counter(15);
	div16_488hz <= counter(16);
	div17_244hz <= counter(17);
	div18_122hz <= counter(18);
	div19_61hz_s <= counter(23);
end BEHAVIORAL;



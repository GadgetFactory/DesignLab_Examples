--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : 
--  /   /         Filename : xil_20436_31
-- /___/   /\     Timestamp : 04/30/2014 14:12:17
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

entity clk_divider_30to1hz is
   port ( clk_32Mhz  : in    std_logic; 
          div19_30hz : out   std_logic; 
          div20_15hz : out   std_logic; 
          div21_8hz  : out   std_logic; 
          div22_4hz  : out   std_logic; 
          div23_2hz  : out   std_logic; 
          div24_1hz  : out   std_logic);
end clk_divider_30to1hz;

architecture BEHAVIORAL of clk_divider_30to1hz is
	signal counter : STD_LOGIC_VECTOR(47 downto 0) := (others => '0');
	signal clk_32Mhz_b, div19_61hz_s : std_logic;
begin

--	 clkin_inst: BUFG
--    port map (
--      I =>  clk_32Mhz,
--      O =>  clk_32Mhz_b
--    );

--	 clkin_inst1: BUFG
--    port map (
--      I =>  div19_61hz_s,
--      O =>  div19_61hz
--    );

   --Counter to drive divider 
   count: process(clk_32Mhz)
   begin
     if rising_edge(clk_32Mhz) then
       counter <= counter+1;
     end if;
   end process;
	
	div19_30hz <= counter(19);
	div20_15hz <= counter(20);
	div21_8hz <= counter(21);
	div22_4hz <= counter(22);
	div23_2hz <= counter(23);
	div24_1hz <= counter(24);

end BEHAVIORAL;



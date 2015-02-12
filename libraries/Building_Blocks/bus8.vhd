--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : 
--  /   /         Filename : xil_10848_21
-- /___/   /\     Timestamp : 04/29/2014 15:00:31
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

entity bus8 is
   port ( bus8 : in    std_logic_vector (7 downto 0); 
          bus0 : out   std_logic; 
          bus1 : out   std_logic; 
          bus2 : out   std_logic; 
          bus3 : out   std_logic; 
          bus4 : out   std_logic; 
          bus5 : out   std_logic; 
          bus6 : out   std_logic; 
          bus7 : out   std_logic);
end bus8;

architecture BEHAVIORAL of bus8 is
begin
bus0 <= bus8(0);
bus1 <= bus8(1);
bus2 <= bus8(2);
bus3 <= bus8(3);
bus4 <= bus8(4);
bus5 <= bus8(5);
bus6 <= bus8(6);
bus7 <= bus8(7);
end BEHAVIORAL;

-- synopsys translate_off
configuration CFG_bus8 of  bus8 is
   for BEHAVIORAL
   end for;
end CFG_bus8;
-- synopsys translate_on


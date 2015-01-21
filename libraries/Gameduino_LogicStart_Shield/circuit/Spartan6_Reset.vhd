--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.1
--  \   \         Application : 
--  /   /         Filename : xil_844_21
-- /___/   /\     Timestamp : 12/10/2014 17:26:31
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

entity Spartan6_Reset is
   port ( reset : in    std_logic);
end Spartan6_Reset;

architecture BEHAVIORAL of Spartan6_Reset is
begin

--Connect to the startup primitive's reset pin

STARTUP_SPARTAN6_inst : STARTUP_SPARTAN6
port map (
   CFGCLK => OPEN,       -- 1-bit output: Configuration logic main clock output.
   CFGMCLK => OPEN,     -- 1-bit output: Configuration internal oscillator clock output.
   EOS => OPEN,             -- 1-bit output: Active high output signal indicates the End Of Configuration.
   CLK => '0',             -- 1-bit input: User startup-clock input
   GSR => reset,             -- 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
   GTS => '0',             -- 1-bit input: Global 3-state input (GTS cannot be used for the port name)
   KEYCLEARB => '0'  -- 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
);

end BEHAVIORAL;


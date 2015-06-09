--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : 
--  /   /         Filename : xil_9628_32
-- /___/   /\     Timestamp : 06/09/2015 09:47:39
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

entity RGB_Matrix_Wing is
   port ( B        : in    std_logic_vector (1 downto 0); 
          CLK      : in    std_logic; 
          COL      : in    std_logic_vector (3 downto 0); 
          G        : in    std_logic_vector (1 downto 0); 
          OE       : in    std_logic; 
          R        : in    std_logic_vector (1 downto 0); 
          STB      : in    std_logic; 
          wt_miso0 : inout   std_logic_vector (7 downto 0); 
          wt_miso1 : inout   std_logic_vector (7 downto 0); 
          wt_mosi0 : inout   std_logic_vector (7 downto 0); 
          wt_mosi1 : inout   std_logic_vector (7 downto 0));
end RGB_Matrix_Wing;

architecture BEHAVIORAL of RGB_Matrix_Wing is
begin

--CH
wt_miso1(7) <= wt_mosi1(7);
wt_miso1(6) <= G(0);
wt_miso1(5) <= R(0);
wt_miso1(4) <= B(0);
wt_miso1(3) <= G(1);
wt_miso1(2) <= R(1);
wt_miso1(1) <= B(1);
wt_miso1(0) <= wt_mosi1(0);

--CL
wt_miso0(7) <= COL(0);
wt_miso0(6) <= COL(1);
wt_miso0(5) <= COL(2);
wt_miso0(4) <= COL(3);
wt_miso0(3) <= CLK;
wt_miso0(2) <= STB;
wt_miso0(1) <= OE;
wt_miso0(0) <= wt_mosi0(0);



--wt_miso1(0) <= wt_mosi1(0);
--wt_miso1(1) <= OE;
--wt_miso1(2) <= STB;
--wt_miso1(3) <= CLK;
--wt_miso1(4) <= COL(3);
--wt_miso1(5) <= COL(2);
--wt_miso1(6) <= COL(1);
--wt_miso1(7) <= COL(0);


--wt_miso0(0) <= wt_mosi0(0);
--wt_miso0(1) <= B(0);
--wt_miso0(2) <= R(0);
--wt_miso0(3) <= G(0);
--wt_miso0(4) <= B(1);
--wt_miso0(5) <= R(1);
--wt_miso0(6) <= G(1);
--wt_miso0(7) <= wt_mosi0(7);

end BEHAVIORAL;



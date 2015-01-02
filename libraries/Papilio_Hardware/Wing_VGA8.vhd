----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:54:01 11/26/2013 
-- Design Name: 
-- Module Name:    Wing_VGA8 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Wing_VGA8 is
   port (    
			 vga_hsync : in std_logic;
			 vga_vsync : in std_logic;
			 vga_red1 : in std_logic;
			 vga_red0 : in std_logic;
			 vga_green1 : in std_logic;
			 vga_green0 : in std_logic;
			 vga_blue1 : in std_logic;
			 vga_blue0 : in std_logic;
			 VGA_Bus : inout std_logic_vector(32 downto 0);
			 wt_miso: out std_logic_vector(7 downto 0); 
			 wt_mosi: inout std_logic_vector(7 downto 0)			 
			 );	
end Wing_VGA8;

architecture Behavioral of Wing_VGA8 is

begin


wt_miso(0) <= vga_vsync OR VGA_Bus(31);
wt_miso(1) <= vga_hsync OR VGA_Bus(30);
wt_miso(2) <= vga_blue0 OR VGA_Bus(28);
wt_miso(3) <= vga_blue1 OR VGA_Bus(29);
wt_miso(4) <= vga_green1 OR VGA_Bus(19);
wt_miso(5) <= vga_red1 OR VGA_Bus(9);
wt_miso(6) <= vga_green0 OR VGA_Bus(18);
wt_miso(7) <= vga_red0 OR VGA_Bus(8);

--Always connect the highest bits of VGA for best results
--wt_miso(0) <= VGA_Bus(31);	--vsync
--wt_miso(1) <= VGA_Bus(30); --hsync
--wt_miso(2) <= VGA_Bus(28);	--b0
--wt_miso(3) <= VGA_Bus(29);	--b1
--wt_miso(4) <= VGA_Bus(19);	--g1
--wt_miso(5) <= VGA_Bus(9);	--r1
--wt_miso(6) <= VGA_Bus(18);	--g0
--wt_miso(7) <= VGA_Bus(8);	--r0

end Behavioral;


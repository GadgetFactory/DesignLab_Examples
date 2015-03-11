----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:54:01 11/26/2013 
-- Design Name: 
-- Module Name:    Wing_Audio - Behavioral 
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

entity Wing_GPIO is
   port (    
			 wt_miso: inout std_logic_vector(7 downto 0); 
			 wt_mosi: inout std_logic_vector(7 downto 0)			 
			 );	
end Wing_GPIO;

architecture Behavioral of Wing_GPIO is

begin
wt_miso(0) <= wt_mosi(0);
wt_miso(1) <= wt_mosi(1);
wt_miso(2) <= wt_mosi(2);
wt_miso(3) <= wt_mosi(3);
wt_miso(4) <= wt_mosi(4);
wt_miso(5) <= wt_mosi(5);
wt_miso(6) <= wt_mosi(6);
wt_miso(7) <= wt_mosi(7);

end Behavioral;


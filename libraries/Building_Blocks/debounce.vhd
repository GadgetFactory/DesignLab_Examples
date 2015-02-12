----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:41:36 02/05/2015 
-- Design Name: 
-- Module Name:    debounce - Behavioral 
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

entity debounce is
    Port ( reset : in  STD_LOGIC;
			  clk_32Mhz : in  STD_LOGIC;
           button_in : in  STD_LOGIC;
           debounced_button : out  STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
	signal Q1, Q2, Q3 : std_logic;
begin
	process(clk_32Mhz)
	begin
		if (clk_32Mhz'event and clk_32Mhz = '1') then
			if (reset = '1') then
				Q1 <= '0';
				Q2 <= '0';
				Q3 <= '0'; 
			else
				Q1 <= button_in;
				Q2 <= Q1;
				Q3 <= Q2;
			end if;
		end if;
	end process;
	 
	debounced_button <= Q1 and Q2 and (not Q3);

end Behavioral;


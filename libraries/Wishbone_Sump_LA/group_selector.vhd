----------------------------------------------------------------------------------
-- group_selector.vhd
--
-- Copyright (C) 2011
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-- General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
--
----------------------------------------------------------------------------------
--
-- Details: http://www.sump.org/projects/analyzer/
--
-- multiplexes valid groups, output is registered
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity group_selector is
	port(
		clock : in std_logic;
		la_input : in std_logic_vector(31 downto 0);
		la_input_ready : in std_logic;
		output : out std_logic_vector(31 downto 0);
		output_ready : out std_logic;
		disabledGroups : in std_logic_vector(3 downto 0)
	);
end group_selector;

architecture behavioral of group_selector is

	signal ib0, ib1, ib2, ib3 : std_logic_vector(7 downto 0);
	signal tmp : std_logic_vector(31 downto 0);
	
begin

	ib0 <= la_input(7 downto 0);
	ib1 <= la_input(15 downto 8);
	ib2 <= la_input(23 downto 16);
	ib3 <= la_input(31 downto 24);

	tmp <=	-- select 8-bit enabled group
		x"000000" & ib0 when disabledGroups = "1110" else
		x"000000" & ib1 when disabledGroups = "1101" else
		x"000000" & ib2 when disabledGroups = "1011" else
		x"000000" & ib3 when disabledGroups = "0111" else
		-- select 2 8-bit enabled groups
		x"0000" & ib1 & ib0 when disabledGroups = "1100" else
		x"0000" & ib2 & ib0 when disabledGroups = "1010" else
		x"0000" & ib3 & ib0 when disabledGroups = "0110" else
		x"0000" & ib2 & ib1 when disabledGroups = "1001" else
		x"0000" & ib3 & ib1 when disabledGroups = "0101" else
		x"0000" & ib3 & ib2 when disabledGroups = "0011" else
		-- clear unused group
		ib3 & ib2 & ib1 & x"00" when disabledGroups = "0001" else
		ib3 & ib2 & x"00" & ib0 when disabledGroups = "0010" else
		ib3 & x"00" & ib1 & ib0 when disabledGroups = "0100" else
		x"00" & ib2 & ib1 & ib0 when disabledGroups = "1000" else
		-- full
		la_input when disabledGroups = "0000" else
		(others => 'X');

	process (clock)
	begin
		if rising_edge(clock) then
			output <= tmp;
			output_ready <= la_input_ready;
		end if;
	end process;

end behavioral;
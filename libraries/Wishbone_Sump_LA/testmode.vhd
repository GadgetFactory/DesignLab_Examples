----------------------------------------------------------------------------------
-- muldex.vhd
--
-- Copyright (C) 2011 Kinsa
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
-- generates test data
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity testmode is
	port(
		clock : in std_logic;
		enable : in std_logic;
		la_input : in std_logic_vector (31 downto 0);
		output : out std_logic_vector (31 downto 0)
	);
end testmode;

architecture behavioral of testmode is

	signal counter : std_logic_vector (27 downto 0);
	signal a,b,c : std_logic_vector (7 downto 0);
	signal d : std_logic;

begin

	process(clock)
	begin
		if rising_edge(clock) then
			counter <= counter + 1;
			if counter(9 downto 0) = "1111111111" then
				d <= not d;
			end if;
		end if;
	end process;
	
	a <= counter(9 downto 2);
	b <= not a;
	
	c <= a when d = '0' else b;

	process(clock)
	begin
		if rising_edge(clock) then
			if enable = '0' then
				output <= la_input;
			else
				output <= counter(27 downto 12) & counter(7 downto 0) & c;
			end if;
		end if;
	end process;

end behavioral;
	
	
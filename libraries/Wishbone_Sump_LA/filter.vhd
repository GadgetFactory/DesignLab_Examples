----------------------------------------------------------------------------------
-- filter.vhd
--
-- Copyright (C) 2006 Michael Poppitz
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
-- Fast 32 channel digital noise filter using a single LUT function for each
-- individual channel. It will filter out all pulses that only appear for half
-- a clock cycle. This way a pulse has to be at least 5-10ns long to be accepted
-- as valid. This is sufficient for sample rates up to 100MHz.
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity filter is
	port(
		la_input : in std_logic_vector (31 downto 0);
		la_input180 : in std_logic_vector (31 downto 0);
		clock : in std_logic;
		output : out std_logic_vector (31 downto 0)
	);
end filter;

architecture behavioral of filter is

	signal la_input360, la_input180Delay, result : std_logic_vector (31 downto 0);

begin

	process(clock)
	begin
		if rising_edge(clock) then
			-- determine next result
			for i in 31 downto 0 loop
				result(i) <= (result(i) or la_input360(i) or la_input(i)) and la_input180Delay(i);
			end loop;

			-- shift in la_input data
			la_input360 <= la_input;
			la_input180Delay <= la_input180;
		end if;
	end process;
	output <= result;

end behavioral;

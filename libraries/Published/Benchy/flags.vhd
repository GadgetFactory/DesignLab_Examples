----------------------------------------------------------------------------------
-- flags.vhd
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
-- Flags register.
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity flags is
	port(
		data : in std_logic_vector(10 downto 0);
		clock : in std_logic;
		write : in std_logic;
		demux : out std_logic;
		filter : out std_logic;
		external : out std_logic;
		inverted : out std_logic;
		disabledGroups : out std_logic_vector (3 downto 0);
		rle : out std_logic;
		test_mode : out std_logic;
		data_size : out std_logic_vector (1 downto 0);
		num_scheme : out std_logic
	);
end flags;

architecture behavioral of flags is

	signal ds : std_logic_vector (1 downto 0);

begin

	-- write flags
	process (clock)
	begin
		if rising_edge(clock) then
			if write = '1' then
				demux <= data(0);
				filter <= data(1);
				external <= data(6);
				inverted <= data(7);
				disabledGroups <= data(5 downto 2);
				rle <= data(8);
				num_scheme <= data(9);
				test_mode <= data(10);
				data_size <= ds;
			end if;
		end if;
	end process;

	ds <= 
		"01" when data(5 downto 2) = "1110" else
		"01" when data(5 downto 2) = "1101" else
		"01" when data(5 downto 2) = "1011" else
		"01" when data(5 downto 2) = "0111" else
		"10" when data(5 downto 2) = "1100" else
		"10" when data(5 downto 2) = "1010" else
		"10" when data(5 downto 2) = "0110" else
		"10" when data(5 downto 2) = "1001" else
		"10" when data(5 downto 2) = "0101" else
		"10" when data(5 downto 2) = "0011" else
		"00";

end behavioral;


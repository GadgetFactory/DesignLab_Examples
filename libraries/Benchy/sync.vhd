----------------------------------------------------------------------------------
-- sync.vhd
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
-- Synchronizes la_input with clock on rising or falling edge and does some
-- optional preprocessing. (Noise filter and demux.)
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sync is
	port(
		la_input : in std_logic_vector (31 downto 0);
		clock : in std_logic;
		enableFilter : in std_logic;
		enableDemux : in  std_logic;
		falling : in std_logic;
		output : out std_logic_vector (31 downto 0)
	);
end sync;

architecture behavioral of sync is

	component demux
		port(
			la_input : in std_logic_vector(15 downto 0);
			la_input180 : in std_logic_vector(15 downto 0);
			clock : in std_logic;
			output : out std_logic_vector(31 downto 0)
		);
	end component;

	component filter
		port(
			la_input : in std_logic_vector(31 downto 0);
			la_input180 : in std_logic_vector(31 downto 0);
			clock : in std_logic;
			output : out std_logic_vector(31 downto 0)
		);
	end component;

	attribute equivalent_register_removal : string;
	signal filteredla_input, demuxedla_input, synchronizedla_input, synchronizedla_input180: std_logic_vector (31 downto 0);
	attribute equivalent_register_removal of demuxedla_input : signal is "no";

begin
	Inst_demux: demux 
	port map(
		la_input => synchronizedla_input(15 downto 0),
		la_input180 => synchronizedla_input180(15 downto 0),
		clock => clock,
		output => demuxedla_input
	);

	Inst_filter: filter 
	port map(
		la_input => synchronizedla_input,
		la_input180 => synchronizedla_input180,
		clock => clock,
		output => filteredla_input
	);

	-- synch la_input guarantees use of iob ff on spartan 3 (as filter and demux do)
	process (clock)
	begin
		if rising_edge(clock) then
			synchronizedla_input <= la_input;
		end if;
		if falling_edge(clock) then
			synchronizedla_input180 <= la_input;
		end if;
	end process;

	-- add another pipeline step for la_input selector to not decrease maximum clock rate
	process (clock) 
	begin
		if rising_edge(clock) then
			if enableDemux = '1' then
				output <= demuxedla_input;
			else
				if enableFilter = '1' then
					output <= filteredla_input;
				else
					if falling = '1' then
						output <= synchronizedla_input180;
					else
						output <= synchronizedla_input;
					end if;
				end if;
			end if;
		end if;
	end process;

end behavioral;


----------------------------------------------------------------------------------
-- sampler.vhd
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
-- Produces samples from la_input applying a programmable divider to the clock.
-- Sampling rate can be calculated by:
--
--     r = f / (d + 1)
--
-- Where r is the sampling rate, f is the clock frequency and d is the value
-- programmed into the divider register.
--
-- As of version 0.6 sampling on an external clock is also supported. If external
-- is set '1', the external clock will be used to sample data. (Divider is
-- ignored for this.)
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sampler is
	port(
		la_input : in std_logic_vector(31 downto 0);		-- 32 la_input channels
		clock : in std_logic;							-- internal clock
		exClock : in std_logic;							-- external clock
		external : in std_logic;						-- clock selection
		data : in std_logic_vector(23 downto 0);		-- configuration data
		wrDivider : in std_logic;						-- write divider register
		sample : out std_logic_vector(31 downto 0);		-- sampled data
		ready : out std_logic;							-- new sample ready
		trig_delay : out std_logic_vector(1 downto 0);
		num_scheme : in std_logic
	);
end sampler;

architecture behavioral of sampler is

	signal divider, counter : std_logic_vector (23 downto 0);
	signal lastExClock, syncExClock : std_logic;
	signal la_input_i : std_logic_vector(31 downto 0);

begin

	trig_delay <=
		"01" when divider = 0 else
		"10" when divider = 1 else
		"00";

	process(la_input, num_scheme)
	begin
		if num_scheme = '1' then
			for i in 31 downto 0 loop
				la_input_i(i) <= la_input(31 - i);
			end loop;
		else
			la_input_i <= la_input;
		end if;
	end process;

	-- sample data
	process(clock)
	begin
		if rising_edge(clock) then
			syncExClock <= exClock;

			if wrDivider = '1' then
				divider <= data(23 downto 0);
				counter <= (others => '0');
				ready <= '0';

			elsif external = '1' then
				if syncExClock = '0' and lastExClock = '1' then
					ready <= '1';
				else
					sample <= la_input_i;
					ready <= '0';
				end if;
				lastExClock <= syncExClock;

			elsif counter = divider then
				sample <= la_input_i;
				counter <= (others => '0');
				ready <= '1';

			else
				counter <= counter + 1;
				ready <= '0';

			end if;
		end if;
	end process;

end behavioral;


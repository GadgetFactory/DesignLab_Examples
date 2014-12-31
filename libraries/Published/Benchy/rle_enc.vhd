----------------------------------------------------------------------------------
-- rle_enc.vhd
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
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity rle_enc is
	generic(
		data_width : integer := 32
	);
	port(
		clock : in std_logic;
		raw_inp : in std_logic_vector ((data_width-1) downto 0);
		rle_out : out std_logic_vector ((data_width-1) downto 0);
		raw_inp_valid : in std_logic;
		rle_out_valid : out std_logic;
		rle_bit : out std_logic
	);
end rle_enc;

architecture behavioral of rle_enc is

	signal count, data, rle_out_i : std_logic_vector ((data_width-1) downto 0);
	signal c0, c1, c2, c3, valid, rle : std_logic;
	signal state : std_logic_vector(3 downto 0);

begin

	-- count repeating data
	process(clock)
	begin
		if rising_edge(clock) then
			if raw_inp_valid = '1' then
				if data = raw_inp then
					count <= count + 1;
				else
					data <= raw_inp;
					count <= (others => '0');
				end if;
			end if;
		end if;
	end process;


	-- previous and current data is not the same; send old data
	c0 <= '1' when data /= raw_inp and count = 0 else '0';
	-- start of repeating data; send current data
	c1 <= '1' when data = raw_inp and count = 0 else '0';
	-- end of repeating data; send count
	c2 <= '1' when data /= raw_inp and count /= 0 else '0';
	-- count overflow; send count
	c3 <= '1' when data = raw_inp and 0 = not count else '0';

	state <= c3 & c2 & c1 & c0;
	
	rle_out_i <= 
		data  when state = "0001" else
		data  when state = "0010" else
		count when state = "0100" else
		count when state = "1000" else
		(others => 'X');

	valid <= 
		'1' when state = "0001" else
		'1' when state = "0010" else
		'1' when state = "0100" else
		'1' when state = "1000" else
		'0';

	rle <= 
		'1' when state = "0100" else
		'1' when state = "1000" else
		'0';

	process(clock)
	begin
		if rising_edge(clock) then
			if raw_inp_valid = '1' then
				rle_out <= rle_out_i; 
				rle_out_valid <= valid;
				rle_bit <= rle;
			else
				rle_out_valid <= '0'; 
				rle_bit <= '0';
			end if;
		end if;
	end process;

end behavioral;

---------------------------------------------------------------------------------
-- rle_fmt.vhd
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
-- inserts a zero count when the rle bit is not set.
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity rle_fmt is
	generic(
		data_width : integer := 32
	);
	port(
		clock : in std_logic;
		reset : in std_logic;
		rle_inp : in std_logic_vector (data_width downto 0);
		fmt_out : out std_logic_vector ((data_width-1) downto 0);
		rle_inp_valid : in std_logic;
		busy : out std_logic;
		raw_ready : in std_logic;
		rle_ready : out std_logic
	);
end rle_fmt;

architecture behavioral of rle_fmt is

	type state_type is (S0, S1, S2, S3, S4);
	
	signal state, nstate : state_type;
	signal tmp, tmp_r, fmt_out_i, fmt_out_r : std_logic_vector ((data_width-1) downto 0);
	signal busy_i, rle_ready_i : std_logic;

begin

	fmt_out <= fmt_out_i;

	process(clock)
	begin
		if rising_edge(clock) then
			if reset = '1' then
				state <= S0;
			else
				state <= nstate;
				tmp_r <= tmp;
				busy <= busy_i;
				fmt_out_r <= fmt_out_i;
				rle_ready <= rle_ready_i;
			end if;
		end if;
	end process;

	busy_i <= '1' when state = S4 else '0';

	process(state, rle_inp_valid, raw_ready, rle_inp, tmp, tmp_r, fmt_out_r)
	begin
		case state is
			when S0 =>
				if rle_inp_valid = '1' then
					nstate <= S1;
				else
					nstate <= state;
				end if;
				fmt_out_i <= fmt_out_r;
				tmp <= tmp_r;
				rle_ready_i <= '0';
			when S1 =>
				if raw_ready = '1' then
					if rle_inp(data_width) = '1' then
						nstate <= S2;
						fmt_out_i <= rle_inp((data_width - 1) downto 0);
					else
						nstate <= S4;
						fmt_out_i <= (others => '0');
					end if;
				else
					nstate <= state;
					fmt_out_i <= fmt_out_r;
				end if;
				tmp <= rle_inp((data_width - 1) downto 0);
				rle_ready_i <= raw_ready;
			when S2 => -- send RLE data
				if rle_inp_valid = '1' then
					nstate <= S3;
				else
					nstate <= state;
				end if;
				fmt_out_i <= rle_inp((data_width - 1) downto 0);
				tmp <= tmp_r;
				rle_ready_i <= '0';
			when S3 =>
				if raw_ready = '1' then
					nstate <= S0;
				else
					nstate <= state;
				end if;
				fmt_out_i <= rle_inp((data_width - 1) downto 0);
				tmp <= tmp_r;
				rle_ready_i <= raw_ready;
			when S4 => -- send RLE data, counts = 0
				if rle_inp_valid = '1' then
					nstate <= S0;
					fmt_out_i <= tmp;
				else
					nstate <= state;
					fmt_out_i <= fmt_out_r;
				end if;
				tmp <= tmp_r;
				rle_ready_i <= rle_inp_valid;
		end case;
	end process;
	
end behavioral;

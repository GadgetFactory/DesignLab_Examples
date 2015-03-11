----------------------------------------------------------------------------------
-- muldex_8.vhd
--
-- Copyright (C) 2011 Kinsa
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public Licenstate_wre as published by
-- the Free Software Foundation; either version 2 of the Licenstate_wre, or (at
-- your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-- General Public Licenstate_wre for more details.
--
-- You should have received a copy of the GNU General Public Licenstate_wre along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
--
----------------------------------------------------------------------------------
--
-- Details: http://www.sump.org/projects/analyzer/
--
-- Multiplexes and demultiplexes the 16 bit data into a 32 bit memory bus.
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity muldex_16 is
	port(
		clock : in std_logic;
		reset : in std_logic;
		data_inp : in std_logic_vector (15 downto 0);
		data_out : out std_logic_vector (15 downto 0);
		data_wr : in std_logic;
		data_rd : in std_logic;
		mem_inp : in std_logic_vector (33 downto 0);
		mem_out : out std_logic_vector (33 downto 0);
		mem_wr : out std_logic;
		mem_rd : out std_logic;
		rle_in : in std_logic;
		rle_out : out std_logic
	);
end muldex_16;

architecture behavioral of muldex_16 is

	type wr_state_type is (W0, W1);
	type rd_state_type is (RI, R0, R1);
	
	signal state_wr, nstate_wr : wr_state_type; 
	signal state_rd, nstate_rd : rd_state_type; 
	signal wrtmp, wrtmp_r, rdtmp, rdtmp_r : std_logic_vector (33 downto 0);
	signal mw, mr  : std_logic;
	
begin

	process(clock)
	begin
		if rising_edge(clock) then
			if reset = '1' then
				state_wr <= W0;
				state_rd <= RI;
			else
				state_wr <= nstate_wr;
				state_rd <= nstate_rd;
			end if;
			wrtmp_r <= wrtmp;
			rdtmp_r <= rdtmp;

			-- registered outputs
			mem_out <= wrtmp;
			mem_wr <= mw;
			mem_rd <= mr;
		end if;
	end process;

	process(state_wr, data_wr, rle_in, wrtmp_r, data_inp)
	begin
		case state_wr is
			when W0 =>
				if data_wr = '1' then
					nstate_wr <= W1;
					wrtmp <= wrtmp_r(33) & rle_in 
							& wrtmp_r(31 downto 16) & data_inp;
				else
					nstate_wr <= state_wr;
					wrtmp <= wrtmp_r;
				end if;
				mw <= '0';
			when W1 =>
				if data_wr = '1' then
					nstate_wr <= W0;
					wrtmp <= rle_in & wrtmp_r(32) & data_inp 
							& wrtmp_r(15 downto 0);
					mw <= '1';
				else
					nstate_wr <= state_wr;
					wrtmp <= wrtmp_r;
					mw <= '0';
				end if;
		end case;
	end process;

	process(state_rd, data_rd, state_wr, wrtmp, rdtmp_r, mem_inp)
	begin
		case state_rd is
			when RI =>
				if data_rd = '1' then
					if state_wr = W0 then
						nstate_rd <= R0;
						mr <= '1';
					else 
						nstate_rd <= R1;
						mr <= '0';
					end if;
				else
					nstate_rd <= state_rd;
					mr <= '0';
				end if;
				rdtmp <= wrtmp;
				data_out <= (others => 'X');
				rle_out <= 'X';
			when R0 =>
				if data_rd = '1' then
					nstate_rd <= R1;
				else
					nstate_rd <= state_rd;
				end if;
				rdtmp <= rdtmp_r;
				mr <= '0';
				data_out <= rdtmp_r(31 downto 16);
				rle_out <= rdtmp_r(33);
			when R1 =>
				if data_rd = '1' then
					nstate_rd <= R0;
					rdtmp <= mem_inp;
					mr <= '1';
				else
					nstate_rd <= state_rd;
					rdtmp <= rdtmp_r;
					mr <= '0';
				end if;
				data_out <= rdtmp_r(15 downto 0);
				rle_out <= rdtmp_r(32);
		end case;
	end process;

end behavioral;

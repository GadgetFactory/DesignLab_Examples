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

entity rle is
	port(
		clock : in std_logic;
		reset : in std_logic;
		enable : in std_logic;
		raw_inp : in std_logic_vector (31 downto 0);
		raw_inp_valid : in std_logic;
		rle_out : out std_logic_vector (32 downto 0);
		rle_out_valid : out std_logic;
		rle_inp : in std_logic_vector (32 downto 0);
		rle_inp_valid : in std_logic;
		fmt_out : out std_logic_vector (31 downto 0);
		busy : out std_logic;
		rle_ready : out std_logic;
		raw_ready : in std_logic;
--		start_count : in std_logic;
--		data_count : out std_logic_vector(15 downto 0);
		data_size : in std_logic_vector(1 downto 0)
	);
end rle;

architecture behavioral of rle is

	component rle_enc
		generic(
			data_width : integer
		);
		port(
			clock : in std_logic;
			raw_inp : in std_logic_vector ((data_width-1) downto 0);
			rle_out : out std_logic_vector ((data_width-1) downto 0);
			raw_inp_valid : in std_logic;
			rle_out_valid : out std_logic;
			rle_bit : out std_logic
		);
	end component;
	
	component rle_fmt
		generic(
			data_width : integer
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
	end component;

	signal rle_tmp, valid_out : std_logic;

begin

	rle_out_valid <= valid_out;

	format_block: block
		signal fmt_out_8 : std_logic_vector (7 downto 0);
		signal fmt_out_16 : std_logic_vector (15 downto 0);
		signal fmt_out_i, fmt_out_32 : std_logic_vector (31 downto 0);
		signal rle_inp_8 : std_logic_vector (8 downto 0);
		signal rle_inp_16 : std_logic_vector (16 downto 0);
		signal busy_i, busy_8, busy_16, busy_32 : std_logic;
		signal delayed_ready : std_logic;
		signal rle_ready_i, rle_ready_8, rle_ready_16, rle_ready_32 : std_logic;
	begin

		rle_inp_8 <= rle_inp(32 downto 32) & rle_inp(7 downto 0);
		rle_inp_16 <= rle_inp(32 downto 32) & rle_inp(15 downto 0);

		busy_i <=	
			'0'		when enable = '0' else
			busy_8	when data_size = "01" else
			busy_16	when data_size = "10" else
			busy_32	when data_size = "00" else
			'X';

		rle_ready_i <= 
			delayed_ready	when enable = '0' else
			rle_ready_8		when data_size = "01" else
			rle_ready_16	when data_size = "10" else
			rle_ready_32	when data_size = "00" else
			'X';

		fmt_out_i <= 
			rle_inp(31 downto 0)	when enable = '0' else
			x"000000" & fmt_out_8	when data_size = "01" else
			x"0000" & fmt_out_16	when data_size = "10" else
			fmt_out_32				when data_size = "00" else
			(others => 'X');

		-- register outputs
		process(clock)
		begin
			if rising_edge(clock) then
				fmt_out <= fmt_out_i;
				busy <= busy_i;
				rle_ready <= rle_ready_i;
				delayed_ready <= raw_ready;
			end if;
		end process;

		Inst_rle_fmt_8: rle_fmt 
		generic map(
			data_width => 8
		)
		port map (
			clock => clock,
			reset => reset,
			rle_inp => rle_inp_8,
			fmt_out => fmt_out_8,
			rle_inp_valid => rle_inp_valid,
			busy => busy_8,
			raw_ready => raw_ready,
			rle_ready => rle_ready_8
		);

		Inst_rle_fmt_16: rle_fmt 
		generic map(
			data_width => 16
		)
		port map (
			clock => clock,
			reset => reset,
			rle_inp => rle_inp_16,
			fmt_out => fmt_out_16,
			rle_inp_valid => rle_inp_valid,
			busy => busy_16,
			raw_ready => raw_ready,
			rle_ready => rle_ready_16
		);

		Inst_rle_fmt_32: rle_fmt 
		generic map(
			data_width => 32
		)
		port map (
			clock => clock,
			reset => reset,
			rle_inp => rle_inp,
			fmt_out => fmt_out_32,
			rle_inp_valid => rle_inp_valid,
			busy => busy_32,
			raw_ready => raw_ready,
			rle_ready => rle_ready_32
		);

	end block;

	encoder_block: block
		signal out_8 : std_logic_vector (7 downto 0);
		signal out_16 : std_logic_vector (15 downto 0);
		signal out_32 : std_logic_vector (31 downto 0);
		signal val_out_8, val_out_16, val_out_32,
			   rle_bit_8, rle_bit_16, rle_bit_32 : std_logic;
	begin
		rle_tmp <=
			rle_bit_8	when data_size = "01" else
			rle_bit_16	when data_size = "10" else
			rle_bit_32	when data_size = "00" else
			'X';

		valid_out <=	
			raw_inp_valid	when enable = '0' else
			val_out_8		when data_size = "01" else
			val_out_16		when data_size = "10" else
			val_out_32		when data_size = "00" else
			'X';

		rle_out <= 
			'0' & raw_inp				when enable = '0' else
			rle_tmp & x"000000" & out_8	when data_size = "01" else
			rle_tmp & x"0000" & out_16	when data_size = "10" else
			rle_tmp & out_32			when data_size = "00" else
			(others => 'X');

		Inst_rle_enc_8: rle_enc 
		generic map(
			data_width => 8
		)
		port map (
			clock => clock,
			raw_inp => raw_inp(7 downto 0),
			raw_inp_valid => raw_inp_valid,
			rle_out => out_8,
			rle_out_valid => val_out_8,
			rle_bit => rle_bit_8
		);

		Inst_rle_enc_16: rle_enc 
		generic map(
			data_width => 16
		)
		port map (
			clock => clock,
			raw_inp => raw_inp(15 downto 0),
			raw_inp_valid => raw_inp_valid,
			rle_out => out_16,
			rle_out_valid => val_out_16,
			rle_bit => rle_bit_16
		);

		Inst_rle_enc_32: rle_enc 
		generic map(
			data_width => 32
		)
		port map (
			clock => clock,
			raw_inp => raw_inp(31 downto 0),
			raw_inp_valid => raw_inp_valid,
			rle_out => out_32,
			rle_out_valid => val_out_32,
			rle_bit => rle_bit_32
		);
	end block;
	
	-- data counter
--	counter_block: block
--		type state_type is (S0, S1);
--		signal cs, ns : state_type; 
--		signal dcnt, dcntreg : std_logic_vector (15 downto 0);
--	begin
--		-- synchronous
--		process(clock, reset)
--		begin
--			if rising_edge(clock) then
--				if reset = '1' then
--					cs <= S0;
--				else
--					cs <= ns;
--				end if;
--				dcntreg <= dcnt;
--			end if;
--		end process;
--
--		-- combinatorial
--		process(cs, dcntreg, rle_tmp, valid_out, start_count)
--		begin
--			case cs is
--			when S0 =>
--				if start_count = '1' then
--					ns <= S1;
--				else
--					ns <= cs;
--				end if;
--				dcnt <= (others => '0');
--			when S1 =>
--				-- counts the current data transitions
--				if valid_out = '1' and rle_tmp = '0' then
--					dcnt <= dcntreg + 1;
--				else
--					dcnt <= dcntreg;
--				end if;
--				ns <= cs;
--			end case;
--		end process;
--
--		data_count <= dcnt;
--
--	end block;
	
end behavioral;

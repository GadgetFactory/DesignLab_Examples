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
-- with this program; if not, data_wr to the Free Software Foundation, Inc.,
-- 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
--
----------------------------------------------------------------------------------
--
-- Details: http://www.sump.org/projects/analyzer/
--
-- Performs dynamic sample depth.
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity muldex is
	port(
		clock : in std_logic;
		reset : in std_logic;
		data_inp : in std_logic_vector (32 downto 0);
		data_out : out std_logic_vector (32 downto 0);
		data_rd : in std_logic;
		data_wr : in std_logic;
		mem_inp : in std_logic_vector (35 downto 0);
		mem_out : out std_logic_vector (35 downto 0);
		mem_rd : out std_logic;
		mem_wr : out std_logic;
		data_size : in std_logic_vector(1 downto 0);
		rdstate : in std_logic;
		data_ready : out std_logic
	);
end muldex;

architecture behavioral of muldex is

	component muldex_16
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
	end component;

	component muldex_8
		port(
			clock : in std_logic;
			reset : in std_logic;
			data_inp : in std_logic_vector (7 downto 0);
			data_out : out std_logic_vector (7 downto 0);
			data_wr : in std_logic;
			data_rd : in std_logic;
			mem_inp : in std_logic_vector (35 downto 0);
			mem_out : out std_logic_vector (35 downto 0);
			mem_wr : out std_logic;
			mem_rd : out std_logic;
			rle_in : in std_logic;
			rle_out : out std_logic
		);
	end component;

	signal mem_wr_8, mem_rd_8, mem_wr_16, mem_rd_16, rle_in : std_logic;
	signal data_out_8 : std_logic_vector (7 downto 0);
	signal data_out_16 : std_logic_vector (15 downto 0);
	signal mem_out_8 : std_logic_vector (35 downto 0);
	signal mem_out_16 : std_logic_vector (33 downto 0);
	signal rle_out_8, rle_out_16 : std_logic;
	signal data_out_i : std_logic_vector (32 downto 0);
	signal mem_wr_i, mem_rd_i : std_logic;

begin

	-- generate data_ready after 3 clk cycles from data_rd
	output_block: block
		signal a : std_logic_vector (2 downto 0);
	begin
		process(clock)
		begin
			if rising_edge(clock) then
				a <= a(1 downto 0) & data_rd;
				data_ready <= a(2);
				if a(2) = '1' then
					data_out <= data_out_i;
				end if;
			end if;
		end process;
	end block;

	-- generate extra mem_rd pulse when there is a previous mem_wr pulse
	sync_mem_block: block
		signal a, b : std_logic;
	begin

		mem_rd <= mem_rd_i or (not mem_wr_i and b) ;
		mem_wr <= mem_wr_i;

		process(clock)
		begin
			if rising_edge(clock) then
				a <= rdstate;
				-- check for rdstate rising edge
				if a = '0' and rdstate = '1' then
					b <= '1';
				else
					--extend only when dynamic sample depth is enabled 
					if b = '1' and (mem_wr_i = '1' or (mem_rd_i ='1' and data_size /= "00")) then
						b <= '1';
					else
						b <= '0';
					end if;
				end if;
			end if;
		end process;
	end block;

	mem_out <=	
		mem_out_8			when data_size = "01" else
		"00" & mem_out_16	when data_size = "10" else
		"000" & data_inp	when data_size = "00" else
		(others => 'X');

	mem_rd_i <=	
		mem_rd_8	when data_size = "01" else
		mem_rd_16	when data_size = "10" else
		data_rd		when data_size = "00" else
		'X';

	mem_wr_i <=	
		mem_wr_8	when data_size = "01" else
		mem_wr_16	when data_size = "10" else
		data_wr		when data_size = "00" else
		'X';

	data_out_i <=
		rle_out_8 & x"000000" & data_out_8	when data_size = "01" else
		rle_out_16 & x"0000" & data_out_16	when data_size = "10" else
		mem_inp(32 downto 0)				when data_size = "00" else
		(others => 'X');

	rle_in <= data_inp(32);

	Inst_m16: muldex_16
	port map(
		clock => clock,
		reset => reset,
		data_inp => data_inp(15 downto 0),
		data_out => data_out_16,
		data_wr => data_wr,
		data_rd => data_rd,
		mem_inp => mem_inp(33 downto 0),
		mem_out => mem_out_16,
		mem_wr => mem_wr_16,
		mem_rd => mem_rd_16,
		rle_in => rle_in,
		rle_out => rle_out_16
	);

	Inst_m8: muldex_8
	port map(
		clock => clock,
		reset => reset,
		data_inp => data_inp(7 downto 0),
		data_out => data_out_8,
		data_wr => data_wr,
		data_rd => data_rd,
		mem_inp => mem_inp,
		mem_out => mem_out_8,
		mem_wr => mem_wr_8,
		mem_rd => mem_rd_8,
		rle_in => rle_in,
		rle_out => rle_out_8
	);
	
end behavioral;

----------------------------------------------------------------------------------
-- sram_bram.vhd
--
-- Copyright (C) 2007 Jonas Diemer
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
-- Simple BlockRAM interface.
--
-- This module should be used instead of sram.vhd if no external SRAM is present.
-- Instead, it will use internal BlockRAM (16 Blocks).
--
-- Modified to use BRAM4k32bit to fit on Butterfly Platform
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity sram_bram is
	generic (
	 brams: integer := 12
	);
	port(
		clock : in std_logic;
		output : out std_logic_vector(35 downto 0);
		la_input : in std_logic_vector(35 downto 0);
		read : in std_logic;
		write : in std_logic
	);
end sram_bram;

architecture behavioral of sram_bram is

	component Mem_Gen_36bit -- SampleRAM
		generic (
		 brams: integer := 12
		);	
		port (
			clk: IN std_logic;
			we: IN std_logic;
			addr: IN std_logic_VECTOR(12 downto 0);
			din: IN std_logic_VECTOR(35 downto 0);
			dout: OUT std_logic_VECTOR(35 downto 0)
		);
	end component;

	signal addra : std_logic_vector (12 downto 0) := (others => '0');
	signal writeSignal : std_logic;
	signal bramIn, bramOut : std_logic_vector (35 downto 0);

begin

	-- assign signals
	output <= bramOut;

	-- memory io interface state controller
	bramIn <= la_input;

	writeSignal <= write;

	-- memory address controller
	process(clock)
	begin
		if rising_edge(clock) then
			if write = '1' then
				if addra >= (brams*512) - 1 then
					addra <= (others => '0');
				else
					addra <= addra + 1;
				end if;
			elsif read = '1' then
				if addra = "0" then
					addra <= std_logic_vector(to_unsigned((brams*512) - 1, addra'length));
				else
					addra <= addra - 1;
				end if;
			end if;
		end if;
	end process;

	 Inst_SampleRAM : Mem_Gen_36bit
	generic map (
		brams => brams
	)	 
	 port map (
		 clk => clock,
		 we => writeSignal,
		 addr => addra,
		 din => bramIn,
		 dout => bramOut
	 );

end behavioral;


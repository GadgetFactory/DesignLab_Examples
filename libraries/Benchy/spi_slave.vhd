----------------------------------------------------------------------------------
-- spi_slave.vhd
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
-- spi_slave
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity spi_slave is
	port(
		clock : in std_logic;
		data : in std_logic_vector(31 downto 0);
		send : in std_logic;
		mosi : in std_logic;
		sclk : in std_logic;
		cs : in std_logic;
		miso : out std_logic;
		cmd : out std_logic_vector(39 downto 0);
		execute : out std_logic;
		busy : out std_logic;
		dataReady : out std_logic;
		reset : in std_logic;
		tx_bytes : in integer range 0 to 4
	);
end spi_slave;

architecture behavioral of spi_slave is

	component spi_receiver
		port(
			rx : in std_logic;
			clock : in std_logic;
			sclk : in std_logic;
			cmd : out std_logic_vector(39 downto 0);
			execute : out std_logic;
			reset : in std_logic;
			cs : in std_logic
		);
	end component;

	component spi_transmitter
		port(
			data : in std_logic_vector(31 downto 0);
			tx_bytes : in integer range 0 to 4;
			send : in std_logic;
			clock : in std_logic;
			sclk : in std_logic;
			tx : out std_logic;
			cs : in std_logic;
			busy : out std_logic;
			reset : in std_logic;
			dataReady : out std_logic
		);
	end component;

begin

	Inst_spi_receiver: spi_receiver
	port map(
		rx => mosi,
		clock => clock,
		sclk => sclk,
		cmd => cmd,
		execute => execute,
		reset => reset,
		cs => cs
	);

	Inst_spi_transmitter: spi_transmitter
	port map(
		data => data,
		tx_bytes => tx_bytes,
		send => send,
		clock => clock,
		sclk => sclk,
		tx => miso,
		cs => cs,
		busy => busy,
		reset => reset,
		dataReady => dataReady
	);

end behavioral;


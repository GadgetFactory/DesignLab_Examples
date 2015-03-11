----------------------------------------------------------------------------------
-- spi_receiver.vhd
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
-- Receives commands from the SPI port. The first byte is the command
-- opcode, the following (optional) four byte are the command data.
-- Commands that do not have the highest bit in their opcode set are
-- considered short commands without data (1 byte long). All other commands are
-- long commands which are 5 bytes long.
--
-- After a full command has been received the data it will be latched until the
-- next command is issued. A valid command can be detected by checking if the
-- execute output is set. 
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity spi_receiver is
	port(
		rx : in std_logic;
		clock : in std_logic;
		sclk : in std_logic;
		cmd : out std_logic_vector (39 downto 0);
		execute : out std_logic;
		reset : in std_logic;
		cs : in std_logic
	);
end spi_receiver;

architecture behavioral of spi_receiver is

	type states is (IDLE, READ_OPCODE, WAIT_CS, READ_DATA);

	signal state: states;
	signal rx_buf : std_logic_vector(7 downto 0);
	signal data_buf : std_logic_vector(31 downto 0);
	signal bits : integer range 0 to 8;
	signal bytes : integer range 0 to 4;
	signal code : std_logic_vector (7 downto 0);
	signal data : std_logic_vector (31 downto 0);
	signal exec : std_logic := '0';
	signal rsync_sclk, rsync_cs : std_logic_vector (1 downto 0);

begin

	cmd <= data & code;

	process(clock)
	begin
		if rising_edge(clock) then

			execute <= exec;
			rsync_sclk <= rsync_sclk(0) & sclk;
			rsync_cs <= rsync_cs(0) & cs;

			case state is
				when IDLE =>
					-- cs falling edge starts rx
					if rsync_cs = "10" then
						state <= READ_OPCODE;
					end if;
					rx_buf <= (others => '0');
					data_buf <= (others => '0');
					bits <= 0;
					bytes <= 0;
					exec <= '0';
				when READ_OPCODE =>
					-- read bit at sclk rising edge
					if reset = '1' then
						state <= IDLE;
					elsif rsync_sclk = "01" then
						rx_buf <= rx_buf(6 downto 0) & rx;
						bits <= bits + 1;
					elsif bits = 8 then
						-- if hi bit is set then wait for cmd data
						if rx_buf(7) = '1' then
							state <= WAIT_CS;
						else
							state <= IDLE;
							exec <= '1';
						end if;
						code <= rx_buf;
					end if;
				when WAIT_CS =>
					-- wait for cs falling edge before reading next data
					if reset = '1' then
						state <= IDLE;
					elsif rsync_cs = "10" then
						state <= READ_DATA;
						bytes <= bytes + 1;
					elsif bytes = 4 then
						state <= IDLE;
						data <= data_buf;
						exec <= '1';
					end if;
					rx_buf <= (others => '0');
					bits <= 0;
				when READ_DATA =>
					-- read bit at sclk rising edge
					if reset = '1' then
						state <= IDLE;
					elsif rsync_sclk = "01" then
						rx_buf <= rx_buf(6 downto 0) & rx;
						bits <= bits + 1;
					elsif bits = 8 then
						state <= WAIT_CS;
						data_buf <= rx_buf & data_buf(31 downto 8);
					end if;
			end case;	
		end if;
	end process;

end behavioral;
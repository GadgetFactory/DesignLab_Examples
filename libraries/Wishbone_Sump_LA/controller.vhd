----------------------------------------------------------------------------------
-- controller.vhd
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
-- Controls the capturing & readback operation.
--
-- If no other operation has been activated, the controller samples data
-- into the memory. When the run signal is received, it continues to do so
-- for fwd * 4 samples and then sends bwd * 4 samples	 to the transmitter.
-- This allows to capture data from before the trigger match which is a nice
-- feature.
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity controller is
	port(
		clock : in std_logic;
		reset : in std_logic;
		la_input : in std_logic_vector (32 downto 0);
		la_inputReady : in std_logic;
		run : in std_logic;
		wrSize : in std_logic;
		data : in std_logic_vector (31 downto 0);
		busy : in std_logic;
		send : out std_logic;
		output : out std_logic_vector (31 downto 0);
		memoryIn : in std_logic_vector (31 downto 0);
		memoryOut : out std_logic_vector (32 downto 0);
		memoryRead : out std_logic;
		memoryWrite : out std_logic;
		rle_busy : in std_logic;
		rle_read : out std_logic;
		rle_mode : in std_logic;
		rdstate : out std_logic;
		data_ready : in std_logic;
		trig_delay : in std_logic_vector(1 downto 0);
		abort : in std_logic
	);
end controller;

architecture behavioral of controller is

	type CONTROLLER_STATES is (SAMPLE, DELAY, READ, DATAWAIT, READWAIT, RLE_POSTSCRIPT);

	signal fwd, bwd : std_logic_vector (15 downto 0);
	signal ncounter, counter, ctr_delay : std_logic_vector (17 downto 0);
	signal nstate, state : CONTROLLER_STATES;
	signal sendReg, memoryWrite_i, memoryRead_i, rle_read_i, send_i : std_logic;
	signal output_i : std_logic_vector (31 downto 0);

begin

	rdstate <= '1' when state /= SAMPLE and state /= DELAY else '0';

	ctr_delay <= 
		"00" & x"0000" when trig_delay = "01" else
		"11" & x"fffe" when trig_delay = "10" else
		"11" & x"fffd";

	-- synchronization and reset logic
	process(clock)
	begin
		if rising_edge(clock) then
			if reset = '1' then
				state <= SAMPLE;
			else
				state <= nstate;
				counter <= ncounter;
			end if;
			-- register outputs
			output <= output_i;
			memoryOut <= la_input;
			memoryWrite <= memoryWrite_i;
			memoryRead <= memoryRead_i;
			send_i <= sendReg;
			send <= sendReg;
			rle_read <= rle_read_i;
		end if;
	end process;

	-- FSM to control the controller action
	process(state, run, counter, fwd, la_inputReady, bwd, busy, rle_busy, 
			data_ready, send_i, ctr_delay, abort, rle_mode, memoryIn)
	begin
		case state is
			-- default mode: sample data from la_input to memory
			when SAMPLE =>
				if run = '1' then
					nstate <= DELAY;
				else
					nstate <= state;
				end if;
				ncounter <= ctr_delay;
				memoryWrite_i <= la_inputReady;
				memoryRead_i <= '0';
				sendReg <= '0';
				rle_read_i <= '0';
				output_i <= memoryIn;

			-- keep sampling for 4 * fwd + 4 samples after run condition
			when DELAY =>
				if (counter = fwd & "00") or (abort = '1') then
					ncounter <= (others => '1');
					nstate <= READ;
				else
					if la_inputReady = '1' then
						ncounter <= counter + 1;
					else
						ncounter <= counter;
					end if;
					nstate <= state;
				end if;
				memoryWrite_i <= la_inputReady;
				memoryRead_i <= '0';
				sendReg <= '0';
				rle_read_i <= '0';
				output_i <= memoryIn;

			-- read back 4 * bwd + 4 samples after DELAY
			-- go into wait state after each sample to give transmitter time
			when READ =>
				if counter = bwd & "11" then
					if rle_busy = '1' then
						ncounter <= counter;
						nstate <= DATAWAIT;
						rle_read_i <= '1';
					else
						ncounter <= (others => '0');
						if rle_mode = '1' then
							nstate <= RLE_POSTSCRIPT;
						else
							nstate <= SAMPLE;
						end if;
						rle_read_i <= '0';
					end if;
					memoryRead_i <= '0';
				else
					if rle_busy = '1' then
						ncounter <= counter;
						memoryRead_i <= '0';
					else
						ncounter <= counter + 1;
						memoryRead_i <= '1';
					end if;
					nstate <= DATAWAIT;
					rle_read_i <= '1';
				end if;
				memoryWrite_i <= '0';
				sendReg <= '0';
				output_i <= memoryIn;

			when DATAWAIT =>
				if data_ready = '1' then
					nstate <= READWAIT;
					sendReg <= '1';
				else
					nstate <= state;
					sendReg <= '0';
				end if;
				ncounter <= counter;
				memoryWrite_i <= '0';
				memoryRead_i <= '0';
				rle_read_i <= '0';
				output_i <= memoryIn;

			-- wait for the transmitter to become ready again
			when READWAIT =>
				if busy = '0' and send_i = '0' then
					nstate <= READ;
				else
					nstate <= state;
				end if;
				ncounter <= counter;
				memoryWrite_i <= '0';
				memoryRead_i <= '0';
				sendReg <= '0';
				rle_read_i <= '0';
				output_i <= memoryIn;

			-- send 0x00 0x00 0x00 0x00 0x55 as stop marker after the RLE data
			when RLE_POSTSCRIPT =>
				if busy = '0' then
					if counter = 5 then
						sendReg <= '0';
						ncounter <= (others => '0');
						nstate <= SAMPLE;
						output_i <= (others => '0');
					elsif counter = 4 and send_i = '0' then
						sendReg <= '1';
						ncounter <= counter + 1;
						nstate <= state;
						output_i <= x"00000055";
					elsif send_i = '0' then
						sendReg <= '1';
						ncounter <= counter + 1;
						nstate <= state;
						output_i <= (others => '0');
					else
						sendReg <= '0';
						ncounter <= counter;
						nstate <= state;
						output_i <= (others => '0');
					end if;
				else
					sendReg <= '0';
					ncounter <= counter;
					nstate <= state;
					output_i <= (others => '0');
				end if;
				memoryWrite_i <= '0';
				memoryRead_i <= '0';
				rle_read_i <= '0';

		end case;
	end process;

	-- set speed and size registers if indicated
	process(clock)
	begin
		if rising_edge(clock) then
			if wrSize = '1' then
				fwd <= data(31 downto 16);
				bwd <= data(15 downto 0);
			end if;
		end if;
	end process;

end behavioral;


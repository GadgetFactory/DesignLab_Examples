----------------------------------------------------------------------------------
-- core.vhd
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
-- The core contains all "platform independent" modules and provides a
-- simple interface to those components. The core makes the analyzer
-- memory type and computer interface independent.
--
-- This module also provides a better target for test benches as commands can
-- be sent to the core easily.
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

entity core is
	port(
		clock : in std_logic;
		cmd : in std_logic_vector (39 downto 0);
		execute : in std_logic;
		la_input : in std_logic_vector (31 downto 0);
		la_inputClock : in std_logic;
		output : out std_logic_vector (31 downto 0);
		outputSend : out std_logic;
		outputBusy : in std_logic;
		memoryIn : in std_logic_vector (35 downto 0);
		memoryOut : out std_logic_vector (35 downto 0);
		memoryRead : out std_logic;
		memoryWrite : out std_logic;
		extTriggerIn : in std_logic;
		extTriggerOut : out std_logic;
		extClockOut : out std_logic;
		armLED : out std_logic;
		triggerLED : out std_logic;
		reset : out std_logic;
		tx_bytes : out integer range 0 to 4
	);
end core;

architecture behavioral of core is

	component decoder
		port(
			opcode : in std_logic_vector (7 downto 0);
			execute : in std_logic;
			clock : in std_logic;
			wrtrigmask : out std_logic_vector(3 downto 0);
			wrtrigval : out std_logic_vector(3 downto 0);
			wrtrigcfg : out std_logic_vector(3 downto 0);
			wrspeed : out std_logic;
			wrsize : out std_logic;
			wrFlags : out std_logic;
			arm : out std_logic;
			reset : out std_logic;
			abort : out std_logic;
			ident : out std_logic;
			meta : out std_logic
		);
	end component;

	component flags
		port(
			data : in std_logic_vector(10 downto 0);
			clock : in std_logic;
			write : in std_logic;
			demux : out std_logic;
			filter : out std_logic;
			external : out std_logic;
			inverted : out std_logic;
			disabledGroups : out std_logic_vector (3 downto 0);
			rle : out std_logic;
			test_mode : out std_logic;
			data_size : out std_logic_vector (1 downto 0);
			num_scheme : out std_logic
		);
	end component;

	component sync is
		port(
			la_input : in std_logic_vector (31 downto 0);
			clock : in std_logic;
			enableFilter : in std_logic;
			enableDemux : in  std_logic;
			falling : in std_logic;
			output : out std_logic_vector (31 downto 0)
		);
	end component;

	component testmode is
		port(
			clock : in std_logic;
			enable : in std_logic;
			la_input : in std_logic_vector (31 downto 0);
			output : out std_logic_vector (31 downto 0)
		);
	end component;

	component sampler
		port(
			la_input : in std_logic_vector(31 downto 0);
			clock : in std_logic;
			exClock : in std_logic;
			external : in std_logic;
			data : in std_logic_vector(23 downto 0);
			wrDivider : in std_logic;
			sample : out std_logic_vector(31 downto 0);
			ready : out std_logic;
			trig_delay : out std_logic_vector(1 downto 0);
			num_scheme : in std_logic
		);
	end component;

	component trigger
		port(
			la_input : in std_logic_vector(31 downto 0);
			la_inputReady : in std_logic;
			data : in std_logic_vector(31 downto 0);
			clock : in std_logic;
			reset : in std_logic;
			wrMask : in std_logic_vector(3 downto 0);
			wrValue : in std_logic_vector(3 downto 0);
			wrConfig : in std_logic_vector(3 downto 0);
			arm : in std_logic;
			demuxed : in std_logic;
			run : out std_logic;
			ExtTriggerIn : in std_logic
		);
	end component;

	component group_selector
		port(
			clock : in std_logic;
			la_input : in std_logic_vector(31 downto 0);
			la_input_ready : in std_logic;
			output : out std_logic_vector(31 downto 0);
			output_ready : out std_logic;
			disabledGroups : in std_logic_vector(3 downto 0)
		);
	end component;
	
	component rle
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
	end component;
	
	component controller
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
	end component;
	
	component muldex
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
	end component;

	signal opcode : std_logic_vector (7 downto 0);
	signal data : std_logic_vector (31 downto 0);
	signal sample, syncedla_input : std_logic_vector (31 downto 0);
	signal sampleClock, run : std_logic;
	signal wrtrigmask, wrtrigval, wrtrigcfg : std_logic_vector(3 downto 0);
	signal wrDivider, wrsize, arm, resetCmd: std_logic;
	signal flagDemux, flagFilter, flagExternal, flagInverted : std_logic;
	signal wrFlags, sampleReady, flagRLE, flagTest : std_logic;
	signal armLEDreg : std_logic := '0';
	signal triggerLEDreg : std_logic := '0';

	signal data_rd, data_wr, controller_la_inputReady : std_logic;
	signal rle_busy, rle_inp_valid, raw_inp_ready : std_logic;

	signal data_size : std_logic_vector(1 downto 0);
	signal disabledGroups : std_logic_vector (3 downto 0);
	signal la_input_sampler : std_logic_vector(31 downto 0);
	signal controller_memoryIn, raw_inp : std_logic_vector (31 downto 0);
	signal data_inp, controller_la_input, rle_inp : std_logic_vector (32 downto 0);
	signal data_ready, raw_ready, rdstate : std_logic := '0';
	signal trig_delay : std_logic_vector(1 downto 0);
	signal num_scheme, abort, ident, meta : std_logic;
	signal output_i : std_logic_vector (31 downto 0);
	signal outputSend_i : std_logic;
	signal tx_bytes_i : integer range 0 to 4;

begin
		
	data <= cmd(39 downto 8);
	opcode <= cmd(7 downto 0);
	reset <= resetCmd;
	--armLED <= not armLEDreg; --Logic Sniffers LEDs are connected to 3.3V so a logic 0 turns the LED on.
	--triggerLED <= not triggerLEDreg;
	--extClockOut <= sampleClock;
	--extTriggerOut <= run;

	tx_bytes_i <= 
		1 when data_size = "01" else
		2 when data_size = "10" else
		3 when disabledGroups = "1000" and flagRLE = '0' else
		3 when disabledGroups = "0100" and flagRLE = '0' else
		3 when disabledGroups = "0010" and flagRLE = '0' else
		3 when disabledGroups = "0001" and flagRLE = '0' else
		4;

	-- process commands
	process_cmd_block : block

		constant rom_size : natural := 18;
		type states is (IDLE, IDENTIFY, METADATA, BUSYWAIT);
		type rom_type is array (rom_size-1 downto 0) of
			std_logic_vector (31 downto 0);

		constant rom : rom_type := (
			0 => x"00000020", 1 => x"00002120",		-- 0x20 0x00000020
			2 => x"00220018", 3 => x"23001800",		-- 0x21 0x00001800
			4 => x"00e1f505", 5 => x"00000024",		-- 0x22 0x00001800
			6 => x"41204002", 7 => x"704f0102",		-- 0x23 0x05f5e100
			8 => x"65626e65", 9 => x"2068636e",		-- 0x24 0x00000002
			10 => x"69676f4c", 11 => x"6e532063",	-- 0x40 0x20
			12 => x"65666669", 13 => x"31762072",	-- 0x41 0x02
			14 => x"0031302e", 15 => x"302e3302",
			16 => x"48560300",  others => x"00004c44"
			);	

			-- 0x01 "Openbench Logic Sniffer v1.01"
			-- 0x02 "3.0"
			-- 0x03 "VHDL"

		signal state : states;
		signal send_cmd : std_logic;
		signal cmd_output : std_logic_vector (31 downto 0);
		signal addr : integer range 0 to rom_size + 1;

	begin
	
		tx_bytes <= 4		 when send_cmd = '1' else tx_bytes_i;
		output <= cmd_output when send_cmd = '1' else output_i;
		outputSend <= '1'	 when send_cmd = '1' else outputSend_i;

		process(clock)
		begin
			if rising_edge(clock) then
				case state is
					when IDLE =>
						if outputBusy = '0' then
							if ident = '1' then
								state <= IDENTIFY;
							end if;
							--Disabled, this was wreaking havoc with SPI slave
--							if meta = '1' then
--								state <= METADATA;
--							end if;
						end if;
						send_cmd <= '0';
						addr <= 0;
					when IDENTIFY =>
						send_cmd <= '1';
						cmd_output <= x"534c4131";	-- "SLA1"
						state <= IDLE;
					when METADATA =>
						send_cmd <= '1';
						cmd_output <= rom(addr);
						addr <= addr + 1;
						state <= BUSYWAIT;
					when BUSYWAIT =>
						send_cmd <= '0';
						if outputBusy = '0' and send_cmd = '0' then
							if addr = rom_size then
								state <= IDLE;
							else
								state <= METADATA;
							end if;
						end if;
				end case;
			end if;
		end process;
	end block;

	--Generates observable trigger and arm LED signals
--	process (clock)
--	begin
--		if rising_edge(clock) then
--			if arm = '1' then
--				armLEDreg <= '1';
--				triggerLEDreg <= '0';
--			elsif run = '1' then
--				armLEDreg <= '0';
--				triggerLEDreg <= '1';
--			end if;
--		end if;
--	end process;

	-- select between internal and external sampling clock
--	BUFGMUX_intex: BUFGMUX
--	port map (
--		O => sampleClock,			-- Clock MUX output
--		I0 => clock,				-- Clock0 la_input
--		I1 => la_inputClock,			-- Clock1 la_input
--		S => flagExternal			-- Clock select la_input
--	);

	sampleClock <= clock;

	Inst_decoder: decoder
	port map(
		opcode => opcode,
		execute => execute,
		clock => clock,
		wrtrigmask => wrtrigmask,
		wrtrigval => wrtrigval,
		wrtrigcfg => wrtrigcfg,
		wrspeed => wrDivider,
		wrsize => wrsize,
		wrFlags => wrFlags,
		arm => arm,
		reset => resetCmd,
		abort => abort,
		ident => ident,
		meta => meta
	);

	Inst_flags: flags
	port map(
		data => data(10 downto 0),
		clock => clock,
		write => wrFlags,
		demux => flagDemux,
		filter => flagFilter,
		external => flagExternal,
		inverted => flagInverted,
		disabledGroups => disabledGroups,
		rle => flagRLE,
		test_mode => flagTest,
		data_size => data_size,
		num_scheme => num_scheme
	);

	Inst_sync: sync
	port map(
		la_input => la_input,
		clock => sampleClock,
		enableFilter => flagFilter,
		enableDemux => flagDemux,
		falling => flagInverted,
		output => syncedla_input
	);

--	Inst_testmode: testmode
--	port map(
--		clock => clock,
--		enable => flagTest,
--		la_input => syncedla_input,
--		output => la_input_sampler
--	);

	Inst_sampler: sampler
	port map(
		la_input => syncedla_input,
		clock => clock,
		exClock => la_inputClock,
		external => flagExternal,
		data => data(23 downto 0),
		wrDivider => wrDivider,
		sample => sample,
		ready => sampleReady,
		trig_delay => trig_delay,
		num_scheme => num_scheme
	);

	Inst_trigger: trigger
	port map(
		la_input => sample,
		la_inputReady => sampleReady,
		data => data,
		clock => clock,
		reset => resetCmd,
		wrMask => wrtrigmask,
		wrValue => wrtrigval,
		wrConfig => wrtrigcfg,
		arm => arm,
		demuxed => flagDemux,
		run => run,
		extTriggerIn => extTriggerIn
	);

	Inst_group_selector: group_selector
	port map(
		clock => clock,
		la_input => sample,
		la_input_ready => sampleReady,
		output => raw_inp,
		output_ready => raw_inp_ready,
		disabledGroups => disabledGroups
	);

	 Inst_rle: rle
	 port map(
		clock => clock,
		reset => resetCmd,
		raw_inp => raw_inp,
		fmt_out => controller_memoryIn,
		enable => flagRLE,
		raw_inp_valid => raw_inp_ready,
		rle_inp_valid => rle_inp_valid,
--		start_count => run,
		data_size => data_size,
		rle_out => controller_la_input,
		rle_inp => rle_inp,
		rle_out_valid => controller_la_inputReady,
		busy => rle_busy,
		rle_ready => data_ready,
		raw_ready => raw_ready
	 );

	Inst_controller: controller
	port map(
		clock => clock,
		reset => resetCmd,
		la_input => controller_la_input,
		la_inputReady => controller_la_inputReady,
		run => run,
		wrSize => wrSize,
		data => data,
		busy => outputBusy,
		send => outputSend_i,
		output => output_i,
		memoryIn => controller_memoryIn,
		memoryOut => data_inp,
		memoryRead => data_rd,
		memoryWrite => data_wr,
		rle_busy => rle_busy,
		rle_read => rle_inp_valid,
		rle_mode => flagRLE,
		rdstate => rdstate,
		data_ready => data_ready,
		trig_delay => trig_delay,
		abort => abort
	);

	Inst_muldex : muldex
	port map(
		clock => clock,
		reset => resetCmd,
		data_inp => data_inp,
		data_out => rle_inp,
		data_rd => data_rd,
		data_wr => data_wr,
		mem_inp => memoryIn,
		mem_out => memoryOut,
		mem_rd => memoryRead,
		mem_wr => memoryWrite,
		data_size => data_size,
		rdstate => rdstate,
		data_ready => raw_ready
	);

end behavioral;

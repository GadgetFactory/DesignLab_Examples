----------------------------------------------------------------------------------
-- Papilio_Logic.vhd
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
-- Logic Analyzer top level module. It connects the core with the hardware
-- dependent IO modules and defines all la_inputs and outputs that represent
-- phyisical pins of the fpga.
--
-- It defines two constants FREQ and RATE. The first is the clock frequency
-- used for receiver and transmitter for generating the proper baud rate.
-- The second defines the speed at which to operate the serial port.
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity BENCHY_sa_SumpBlaze_LogicAnalyzer8_jtag is
	generic (
	 brams: integer := 12
	);	
	port(
		clk_32Mhz : in std_logic;
		--extClockIn : in std_logic;
--		extClockOut : out std_logic;
		--extTriggerIn : in std_logic;
		--extTriggerOut : out std_logic;
		--la_input : in std_logic_vector(31 downto 0);
		la0	: in std_logic;
		la1	: in std_logic;
		la2	: in std_logic;
		la3	: in std_logic;
		la4	: in std_logic;
		la5	: in std_logic;
		la6	: in std_logic;
		la7	: in std_logic
--		rx : in std_logic;
--		tx : out std_logic
--		miso : out std_logic;
--		mosi : in std_logic;
--		sclk : in std_logic;
--		cs : in std_logic
--		dataReady : out std_logic;
--		adc_cs_n : inout std_logic;
		--armLED : out std_logic;
		--triggerLED : out std_logic
	);
end BENCHY_sa_SumpBlaze_LogicAnalyzer8_jtag;

architecture behavioral of BENCHY_sa_SumpBlaze_LogicAnalyzer8_jtag is

	component clockman
		port(
			clkin : in  STD_LOGIC;
			clk0 : out std_logic
		);
	end component;
	
	COMPONENT bscan_spi
	PORT(
		SPI_MISO : IN std_logic;       
		SPI_MOSI : INOUT std_logic;
		SPI_CS : INOUT std_logic;
		SPI_SCK : INOUT std_logic
		);
	END COMPONENT;	
	
	COMPONENT eia232
	generic (
		FREQ : integer;
		SCALE : integer;
		RATE : integer
	);
	PORT(
		clock : IN std_logic;
		reset : in std_logic;
		speed : IN std_logic_vector(1 downto 0);
		rx : IN std_logic;
		data : IN std_logic_vector(31 downto 0);
		send : IN std_logic;          
		tx : OUT std_logic;
		cmd : OUT std_logic_vector(39 downto 0);
		execute : OUT std_logic;
		busy : OUT std_logic
		);
	END COMPONENT;	

	component spi_slave
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
	end component;

	component core
		port(
			clock : in std_logic;
			cmd : in std_logic_vector(39 downto 0);
			execute : in std_logic;
			la_input : in std_logic_vector(31 downto 0);
			la_inputClock : in std_logic;
			output : out std_logic_vector (31 downto 0);
			outputSend : out std_logic;
			outputBusy : in std_logic;
			memoryIn : in std_logic_vector(35 downto 0);
			memoryOut : out std_logic_vector(35 downto 0);
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
	end component;

	component sram_bram
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
	end component;

	signal cmd : std_logic_vector (39 downto 0);
	signal memoryIn, memoryOut : std_logic_vector (35 downto 0);
	signal output, la_input : std_logic_vector (31 downto 0);
	signal clock : std_logic;
	signal read, write, execute, send, busy : std_logic;
	signal tx_bytes : integer range 0 to 4;
	signal extClockIn, extTriggerIn : std_logic;
	signal dataReady, reset : std_logic;
	signal mosi, miso, sclk, cs : std_logic;
	
	--Constants for UART
	constant FREQ : integer := 100000000;				-- limited to 100M by onboard SRAM
	constant TRXSCALE : integer := 54; 					-- 16 times the desired baud rate. Example 100000000/(16*115200) = 54
	constant RATE : integer := 115200;					-- maximum & base rate	
	constant SPEED	: std_logic_vector (1 downto 0) := "00";	--Sets the speed for UART communications
	
	
begin
	--la_input <= (others => '0');
	la_input(0) <= la0;
	la_input(1) <= la1;
	la_input(2) <= la2;
	la_input(3) <= la3;
	la_input(4) <= la4;
	la_input(5) <= la5;
	la_input(6) <= la6;
	la_input(7) <= la7;


--	adc_cs_n <= '1';		--Disables ADC
	
	Inst_clockman: clockman
	port map(
		clkin => clk_32Mhz,
		clk0 => clock
	);
	
	Inst_bscan_spi: bscan_spi PORT MAP(
		SPI_MISO => miso,
		SPI_MOSI => mosi,
		SPI_CS => cs,
		SPI_SCK => sclk
	);	
	
--	Inst_eia232: eia232
--	generic map (
--		FREQ => FREQ,
--		SCALE => TRXSCALE,
--		RATE => RATE
--	)
--	PORT MAP(
--		clock => clock,
--		reset => '0',
--		speed => SPEED,
--		rx => rx,
--		tx => tx,
--		cmd => cmd,
--		execute => execute,
--		data => output,
--		send => send,
--		busy => busy
--	);	

	Inst_spi_slave: spi_slave
	port map(
		clock => clock,
		data => output,
		send => send,
		mosi => mosi,
		sclk => sclk,
		cs => cs,
		miso => miso,
		cmd => cmd,
		execute => execute,
		busy => busy,
		dataReady => dataReady,
		reset => reset,
		tx_bytes => tx_bytes
	);

extClockIn <= '0';		--External clock disabled
extTriggerIn <= '0';		--External trigger disabled

	Inst_core: core
	port map(
		clock => clock,
		cmd => cmd,
		execute => execute,
		la_input => la_input,
		la_inputClock => extClockIn,
		output => output,
		outputSend => send,
		outputBusy => busy,
		memoryIn => memoryIn,
		memoryOut => memoryOut,
		memoryRead => read,
		memoryWrite => write,
		extTriggerIn => extTriggerIn,
		extTriggerOut => open,
		extClockOut => open,
		armLED => open,
		triggerLED => open,
		reset => reset,
		tx_bytes => tx_bytes
	);

	Inst_sram: sram_bram
	generic map (
		brams => brams
	)		
	port map(
		clock => clock,
		output => memoryIn,
		la_input => memoryOut,
		read => read,
		write => write
	);
end behavioral;


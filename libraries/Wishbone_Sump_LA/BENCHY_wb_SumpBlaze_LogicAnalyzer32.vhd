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

entity BENCHY_wb_SumpBlaze_LogicAnalyzer32 is
	port(
		wishbone_in : in std_logic_vector(100 downto 0);
		wishbone_out : out std_logic_vector(100 downto 0);	
		wishbone_slot_video_in : out std_logic_vector(100 downto 0);
		wishbone_slot_video_out : in std_logic_vector(100 downto 0);		
		la : in std_logic_vector(31 downto 0)
	);
end BENCHY_wb_SumpBlaze_LogicAnalyzer32;

architecture behavioral of BENCHY_wb_SumpBlaze_LogicAnalyzer32 is

  signal  core_reset:  std_logic;
--signals for unpacking the wishbone array
  signal  wb_clk_i:    std_logic;                     -- Wishbone clock
  signal  wb_rst_i:    std_logic;                     -- Wishbone reset (synchronous)
  signal  wb_dat_i:    std_logic_vector(31 downto 0); -- Wishbone data input  (32 bits)
  signal  wb_adr_i:    std_logic_vector(26 downto 2); -- Wishbone address input  (32 bits)
  signal  wb_we_i:     std_logic;                     -- Wishbone write enable signal
  signal  wb_cyc_i:    std_logic;                     -- Wishbone cycle signal
  signal  wb_stb_i:    std_logic;                     -- Wishbone strobe signal  

  signal  wb_dat_o:    std_logic_vector(31 downto 0); -- Wishbone data output (32 bits)
  signal  wb_ack_o:    std_logic;                      -- Wishbone acknowledge out signal
  signal  wb_inta_o:   std_logic;
  signal  id:    std_logic_vector(15 downto 0); -- ZPUino Wishbone id
--end signals for unpacking the wishbone array

--signals for unpacking DMA array
	signal mi_wb_dat_i: std_logic_vector(31 downto 0);
	signal mi_wb_dat_o: std_logic_vector(31 downto 0);
	signal mi_wb_adr_o: std_logic_vector(27 downto 0);
	signal mi_wb_sel_o: std_logic_vector(3 downto 0);
	signal mi_wb_cti_o: std_logic_vector(2 downto 0);
	signal mi_wb_we_o: std_logic;
	signal mi_wb_cyc_o: std_logic;
	signal mi_wb_stb_o: std_logic;
	signal mi_wb_ack_i: std_logic;
	signal mi_wb_stall_i: std_logic;
--end signals for unpacking DMA array

	signal cmd : std_logic_vector (39 downto 0);
	signal memoryIn, memoryOut : std_logic_vector (35 downto 0);
	signal output, la_input : std_logic_vector (31 downto 0);
	signal clock : std_logic;
	signal read, write, execute, send, busy, resetInternal, reset, run : std_logic;
	signal tx_bytes : integer range 0 to 4;
	signal extClockIn, extTriggerIn : std_logic;
	
	begin
-- Unpack the wishbone array into signals so the modules code is not confusing.
  wb_clk_i <= wishbone_in(61);
  wb_rst_i <= wishbone_in(60);
  wb_dat_i <= wishbone_in(59 downto 28);
  wb_adr_i <= wishbone_in(27 downto 3);
  wb_we_i <= wishbone_in(2);
  wb_cyc_i <= wishbone_in(1);
  wb_stb_i <= wishbone_in(0); 
  
  wishbone_out(49 downto 34) <= id;
  wishbone_out(33 downto 2) <= wb_dat_o;
  wishbone_out(1) <= wb_ack_o;
  wishbone_out(0) <= wb_inta_o;
-- End unpacking Wishbone array 

--Unpack DMA array
	wishbone_slot_video_in(31 downto 0) <= mi_wb_dat_o;
	wishbone_slot_video_in(77 downto 50) <= mi_wb_adr_o;
	wishbone_slot_video_in(100) <= mi_wb_we_o;
	wishbone_slot_video_in(99) <= mi_wb_cyc_o;
	wishbone_slot_video_in(98) <= mi_wb_stb_o;
	
	mi_wb_dat_i <= wishbone_slot_video_out(31 downto 0);
	mi_wb_ack_i <= wishbone_slot_video_out(100);
	mi_wb_stall_i <= wishbone_slot_video_out(99);
--End upack DMA array 

	--la_input <= (others => '0');
	la_input <= la;

--	adc_cs_n <= '1';		--Disables ADC
	
  extClockIn <= '0';		--External clock disabled
  extTriggerIn <= '0';		--External trigger disabled

  clock <= wb_clk_i;

	Inst_core: entity work.core
	port map(
		clock => clock,
		cmd => cmd,
		execute => execute,
		la_input => la_input,
		la_inputClock => extClockIn,
		output => output,
		outputSend => send,
		outputBusy => '1',
		memoryIn => memoryIn,
		memoryOut => memoryOut,
		memoryRead => read,
		memoryWrite => write,
    run   => run,
		extTriggerIn => extTriggerIn,
		extTriggerOut => open,
		extClockOut => open,
		armLED => open,
		triggerLED => open,
--		resetInternal => resetInternal,
		reset => core_reset,
		tx_bytes => tx_bytes
	);

  SumpWb_Inst: entity work.sump_wishbone
    port map (
    clk =>        wb_clk_i,
    rst =>        wb_rst_i,
    -- Main wishbone signals
    wb_dat_i      => wb_dat_i,
    wb_adr_i      => wb_adr_i,
    wb_we_i       => wb_we_i,
    wb_cyc_i      => wb_cyc_i,
    wb_stb_i      => wb_stb_i,

    wb_dat_o      => wb_dat_o,
    wb_ack_o      => wb_ack_o,

    -- Signals to/from core
    -- clock         => clock, -- not used.
    reset         => core_reset,
    write         => write,
    memoryOut     => memoryOut(31 downto 0),
    run           => run,
    send          => send,
    cmd           => cmd,
    execute       => execute,
    -- DMA
    mi_wb_dat_i   => mi_wb_dat_i,
    mi_wb_dat_o   => mi_wb_dat_o,
    mi_wb_adr_o   => mi_wb_adr_o,
    mi_wb_sel_o   => mi_wb_sel_o,
    mi_wb_cti_o   => mi_wb_cti_o,
    mi_wb_we_o    => mi_wb_we_o,
    mi_wb_cyc_o   => mi_wb_cyc_o,
    mi_wb_stb_o   => mi_wb_stb_o,
    mi_wb_ack_i   => mi_wb_ack_i,
    mi_wb_stall_i => mi_wb_stall_i
  );

end behavioral;


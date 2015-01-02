--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.3
--  \   \         Application : 
--  /   /         Filename : xil_10080_19
-- /___/   /\     Timestamp : 02/08/2013 16:21:11
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: 
--  The Papilio Default Pinout device defines the pins for a Papilio board that does not have a MegaWing attached to it.

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

-- Unfortunately the Xilinx Schematic Editor does not support records, so we have to put all wishbone signals into one array.
-- This is a little cumbersome but is better then dealing with all the signals in the schematic editor.
-- This is what the original record base approach looked like:
--
-- type gpio_bus_in_type is record
--    gpio_i:   std_logic_vector(48 downto 0);
--    gpio_spp_data: std_logic_vector(48 downto 0);
-- end record; 
-- 
-- type gpio_bus_out_type is record
--	 gpio_clk:  std_logic;
--    gpio_o:    std_logic_vector(48 downto 0);
--    gpio_t:    std_logic_vector(48 downto 0);
--    gpio_spp_read:  std_logic_vector(48 downto 0); 
-- end record; 
--
-- Turning them into an array looks like this:
--
-- gpio_bus_in : in std_logic_vector(97 downto 0);
--
--	gpio_bus_in(97 downto 49) <= gpio_i;
--	gpio_bus_in(48 downto 0) <= gpio_bus_in_record.gpio_spp_data;
--
-- gpio_bus_out : out std_logic_vector(146 downto 0);
--
--	gpio_o <= gpio_bus_out(146 downto 98);
--	gpio_t <= gpio_bus_out(97 downto 49);
--	gpio_bus_out_record.gpio_spp_read <= gpio_bus_out(48 downto 0);

entity Papilio_DUO_Wing_Pinout is
   port (    
 
			gpio_bus_in : out std_logic_vector(200 downto 0);
			gpio_bus_out : in std_logic_vector(200 downto 0);	 			 

			 WingType_miso_AH: inout std_logic_vector(7 downto 0); 
			 WingType_mosi_AH: inout std_logic_vector(7 downto 0);			 
			 WING_AH0	: inout std_logic;
			 WING_AH1	: inout std_logic;
			 WING_AH2	: inout std_logic;
			 WING_AH3	: inout std_logic;
			 WING_AH4	: inout std_logic;
			 WING_AH5	: inout std_logic;
--			 WING_AH6	: inout std_logic;
--			 WING_AH7	: inout std_logic;

			 WingType_miso_AL: inout std_logic_vector(7 downto 0); 
			 WingType_mosi_AL: inout std_logic_vector(7 downto 0);			 
			 WING_AL0	: inout std_logic;
			 WING_AL1	: inout std_logic;
			 WING_AL2	: inout std_logic;
			 WING_AL3	: inout std_logic;
			 WING_AL4	: inout std_logic;
			 WING_AL5	: inout std_logic;
			 WING_AL6	: inout std_logic;
			 WING_AL7	: inout std_logic;

--			 WingType_miso_BH: inout std_logic_vector(7 downto 0); 
--			 WingType_mosi_BH: inout std_logic_vector(7 downto 0);
--			 WING_BH0	: inout std_logic;
--			 WING_BH1	: inout std_logic;
--			 WING_BH2	: inout std_logic;
--			 WING_BH3	: inout std_logic;
--			 WING_BH4	: inout std_logic;
--			 WING_BH5	: inout std_logic;
--			 WING_BH6	: inout std_logic;
--			 WING_BH7	: inout std_logic;

			 WingType_miso_BL: inout std_logic_vector(7 downto 0); 
			 WingType_mosi_BL: inout std_logic_vector(7 downto 0);
			 WING_BL0	: inout std_logic;
			 WING_BL1	: inout std_logic;
			 WING_BL2	: inout std_logic;
			 WING_BL3	: inout std_logic;
			 WING_BL4	: inout std_logic;
			 WING_BL5	: inout std_logic;
			 WING_BL6	: inout std_logic;
			 WING_BL7	: inout std_logic;

			 WingType_miso_CH: inout std_logic_vector(7 downto 0); 
			 WingType_mosi_CH: inout std_logic_vector(7 downto 0);
			 WING_CH0	: inout std_logic;
			 WING_CH1	: inout std_logic;
			 WING_CH2	: inout std_logic;
			 WING_CH3	: inout std_logic;
			 WING_CH4	: inout std_logic;
			 WING_CH5	: inout std_logic;
			 WING_CH6	: inout std_logic;
			 WING_CH7	: inout std_logic;
			 
			 WingType_miso_CL: inout std_logic_vector(7 downto 0); 
			 WingType_mosi_CL: inout std_logic_vector(7 downto 0);
			 WING_CL0	: inout std_logic;
			 WING_CL1	: inout std_logic;
			 WING_CL2	: inout std_logic;
			 WING_CL3	: inout std_logic;
			 WING_CL4	: inout std_logic;
			 WING_CL5	: inout std_logic;
			 WING_CL6	: inout std_logic;
			 WING_CL7	: inout std_logic;
			 
			 WingType_miso_DH: inout std_logic_vector(7 downto 0); 
			 WingType_mosi_DH: inout std_logic_vector(7 downto 0);
			 WING_DH0	: inout std_logic;
			 WING_DH1	: inout std_logic;
			 WING_DH2	: inout std_logic;
			 WING_DH3	: inout std_logic;
			 WING_DH4	: inout std_logic;
			 WING_DH5	: inout std_logic;
			 WING_DH6	: inout std_logic;
			 WING_DH7	: inout std_logic;
			 
			 WingType_miso_DL: inout std_logic_vector(7 downto 0); 
			 WingType_mosi_DL: inout std_logic_vector(7 downto 0);
			 WING_DL0	: inout std_logic;
			 WING_DL1	: inout std_logic;
			 WING_DL2	: inout std_logic;
			 WING_DL3	: inout std_logic;
			 WING_DL4	: inout std_logic;
			 WING_DL5	: inout std_logic;
			 WING_DL6	: inout std_logic;
			 WING_DL7	: inout std_logic;

			 Flex_Pin_out_0: in std_logic;
			 Flex_Pin_out_1: in std_logic;
			 Flex_Pin_out_2: in std_logic;
			 Flex_Pin_out_3: in std_logic;
			 Flex_Pin_out_4: in std_logic;
			 Flex_Pin_out_5: in std_logic;
			 
			 Flex_Pin_in_0: out std_logic;
			 Flex_Pin_in_1: out std_logic;
			 Flex_Pin_in_2: out std_logic;
			 Flex_Pin_in_3: out std_logic;
			 Flex_Pin_in_4: out std_logic;
			 Flex_Pin_in_5: out std_logic			 
			 
			 );			 
end Papilio_DUO_Wing_Pinout;

architecture BEHAVIORAL of Papilio_DUO_Wing_Pinout is

constant wordPower			: integer := 5;
constant wordSize			: integer := 2**wordPower;
constant maxAddrBitIncIO		: integer := 27;
constant maxIOBit: integer := maxAddrBitIncIO - 1;
constant minIOBit: integer := 2;
constant maxAddrBitBRAM		: integer := 20;
constant	DontCareValue		: std_logic := 'X';

component iopad is
  port(
    I: in std_logic;
    O: out std_logic;
    T: in std_logic;
    C: in std_logic;
    PAD: inout std_logic
  );
end component iopad;

  signal gpio_o:      std_logic_vector(54 downto 0);
  signal gpio_t:      std_logic_vector(54 downto 0);
  signal gpio_i:      std_logic_vector(54 downto 0);
  
  signal gpio_spp_data: std_logic_vector(54 downto 0);
  signal gpio_spp_read: std_logic_vector(54 downto 0); 

  signal gpio_clk: std_logic;  

begin
--Unpack the signal array into a record so the modules code is easier to understand.
	--gpio_bus_in(97 downto 49) <= gpio_spp_data;
	--gpio_bus_in(48 downto 0) <= gpio_i;
	
	gpio_clk <= gpio_bus_out(165);
	gpio_o <= gpio_bus_out(164 downto 110);
	gpio_t <= gpio_bus_out(109 downto 55);
	gpio_spp_read <= gpio_bus_out(54 downto 0);	
  

  pin00: IOPAD port map(I => gpio_o(0), O => gpio_bus_in(0), T => gpio_t(0), C => gpio_clk,PAD => WingType_mosi_AL(0) );
  pin01: IOPAD port map(I => gpio_o(1), O => gpio_bus_in(1), T => gpio_t(1), C => gpio_clk,PAD => WingType_mosi_AL(1) );
  pin02: IOPAD port map(I => gpio_o(2), O => gpio_bus_in(2), T => gpio_t(2), C => gpio_clk,PAD => WingType_mosi_AL(2) );
  pin03: IOPAD port map(I => gpio_o(3), O => gpio_bus_in(3), T => gpio_t(3), C => gpio_clk,PAD => WingType_mosi_AL(3) );
  pin04: IOPAD port map(I => gpio_o(4), O => gpio_bus_in(4), T => gpio_t(4), C => gpio_clk,PAD => WingType_mosi_AL(4) );
  pin05: IOPAD port map(I => gpio_o(5), O => gpio_bus_in(5), T => gpio_t(5), C => gpio_clk,PAD => WingType_mosi_AL(5) );
  pin06: IOPAD port map(I => gpio_o(6), O => gpio_bus_in(6), T => gpio_t(6), C => gpio_clk,PAD => WingType_mosi_AL(6) );
  pin07: IOPAD port map(I => gpio_o(7), O => gpio_bus_in(7), T => gpio_t(7), C => gpio_clk,PAD => WingType_mosi_AL(7) );
  pin08: IOPAD port map(I => gpio_o(8), O => gpio_bus_in(8), T => gpio_t(8), C => gpio_clk,PAD => WingType_mosi_AH(0) );
  pin09: IOPAD port map(I => gpio_o(9), O => gpio_bus_in(9), T => gpio_t(9), C => gpio_clk,PAD => WingType_mosi_AH(1) );
  pin10: IOPAD port map(I => gpio_o(10),O => gpio_bus_in(10),T => gpio_t(10),C => gpio_clk,PAD => WingType_mosi_AH(2) );
  pin11: IOPAD port map(I => gpio_o(11),O => gpio_bus_in(11),T => gpio_t(11),C => gpio_clk,PAD => WingType_mosi_AH(3) );
  pin12: IOPAD port map(I => gpio_o(12),O => gpio_bus_in(12),T => gpio_t(12),C => gpio_clk,PAD => WingType_mosi_AH(4) );
  pin13: IOPAD port map(I => gpio_o(13),O => gpio_bus_in(13),T => gpio_t(13),C => gpio_clk,PAD => WingType_mosi_AH(5) );
  
  pin14: IOPAD port map(I => gpio_o(14),O => gpio_bus_in(14),T => gpio_t(14),C => gpio_clk,PAD => WingType_mosi_BL(7) );
  pin15: IOPAD port map(I => gpio_o(15),O => gpio_bus_in(15),T => gpio_t(15),C => gpio_clk,PAD => WingType_mosi_BL(6) );
  pin16: IOPAD port map(I => gpio_o(16),O => gpio_bus_in(16),T => gpio_t(16),C => gpio_clk,PAD => WingType_mosi_BL(5) );
  pin17: IOPAD port map(I => gpio_o(17),O => gpio_bus_in(17),T => gpio_t(17),C => gpio_clk,PAD => WingType_mosi_BL(4) );
  pin18: IOPAD port map(I => gpio_o(18),O => gpio_bus_in(18),T => gpio_t(18),C => gpio_clk,PAD => WingType_mosi_BL(3) );
  pin19: IOPAD port map(I => gpio_o(19),O => gpio_bus_in(19),T => gpio_t(19),C => gpio_clk,PAD => WingType_mosi_BL(2) );
  pin20: IOPAD port map(I => gpio_o(20),O => gpio_bus_in(20),T => gpio_t(20),C => gpio_clk,PAD => WingType_mosi_BL(1) );
  pin21: IOPAD port map(I => gpio_o(21),O => gpio_bus_in(21),T => gpio_t(21),C => gpio_clk,PAD => WingType_mosi_BL(0) );
  
  pin22: IOPAD port map(I => gpio_o(22),O => gpio_bus_in(22),T => gpio_t(22),C => gpio_clk,PAD => WingType_mosi_CL(0) );
  pin23: IOPAD port map(I => gpio_o(23),O => gpio_bus_in(23),T => gpio_t(23),C => gpio_clk,PAD => WingType_mosi_DH(7) );
  pin24: IOPAD port map(I => gpio_o(24),O => gpio_bus_in(24),T => gpio_t(24),C => gpio_clk,PAD => WingType_mosi_CL(1) );
  pin25: IOPAD port map(I => gpio_o(25),O => gpio_bus_in(25),T => gpio_t(25),C => gpio_clk,PAD => WingType_mosi_DH(6) );
  pin26: IOPAD port map(I => gpio_o(26),O => gpio_bus_in(26),T => gpio_t(26),C => gpio_clk,PAD => WingType_mosi_CL(2) );
  pin27: IOPAD port map(I => gpio_o(27),O => gpio_bus_in(27),T => gpio_t(27),C => gpio_clk,PAD => WingType_mosi_DH(5) );
  pin28: IOPAD port map(I => gpio_o(28),O => gpio_bus_in(28),T => gpio_t(28),C => gpio_clk,PAD => WingType_mosi_CL(3) );
  pin29: IOPAD port map(I => gpio_o(29),O => gpio_bus_in(29),T => gpio_t(29),C => gpio_clk,PAD => WingType_mosi_DH(4) );
  pin30: IOPAD port map(I => gpio_o(30),O => gpio_bus_in(30),T => gpio_t(30),C => gpio_clk,PAD => WingType_mosi_CL(4) );
  pin31: IOPAD port map(I => gpio_o(31),O => gpio_bus_in(31),T => gpio_t(31),C => gpio_clk,PAD => WingType_mosi_DH(3) );
  pin32: IOPAD port map(I => gpio_o(32),O => gpio_bus_in(32),T => gpio_t(32),C => gpio_clk,PAD => WingType_mosi_CL(5) );
  pin33: IOPAD port map(I => gpio_o(33),O => gpio_bus_in(33),T => gpio_t(33),C => gpio_clk,PAD => WingType_mosi_DH(2) );
  pin34: IOPAD port map(I => gpio_o(34),O => gpio_bus_in(34),T => gpio_t(34),C => gpio_clk,PAD => WingType_mosi_CL(6) );
  pin35: IOPAD port map(I => gpio_o(35),O => gpio_bus_in(35),T => gpio_t(35),C => gpio_clk,PAD => WingType_mosi_DH(1) );
  pin36: IOPAD port map(I => gpio_o(36),O => gpio_bus_in(36),T => gpio_t(36),C => gpio_clk,PAD => WingType_mosi_CL(7) );
  pin37: IOPAD port map(I => gpio_o(37),O => gpio_bus_in(37),T => gpio_t(37),C => gpio_clk,PAD => WingType_mosi_DH(0) );
  
  pin38: IOPAD port map(I => gpio_o(38),O => gpio_bus_in(38),T => gpio_t(38),C => gpio_clk,PAD => WingType_mosi_CH(0) );
  pin39: IOPAD port map(I => gpio_o(39),O => gpio_bus_in(39),T => gpio_t(39),C => gpio_clk,PAD => WingType_mosi_DL(7) );
  pin40: IOPAD port map(I => gpio_o(40),O => gpio_bus_in(40),T => gpio_t(40),C => gpio_clk,PAD => WingType_mosi_CH(1) );
  pin41: IOPAD port map(I => gpio_o(41),O => gpio_bus_in(41),T => gpio_t(41),C => gpio_clk,PAD => WingType_mosi_DL(6) );
  pin42: IOPAD port map(I => gpio_o(42),O => gpio_bus_in(42),T => gpio_t(42),C => gpio_clk,PAD => WingType_mosi_CH(2) );
  pin43: IOPAD port map(I => gpio_o(43),O => gpio_bus_in(43),T => gpio_t(43),C => gpio_clk,PAD => WingType_mosi_DL(5) );
  pin44: IOPAD port map(I => gpio_o(44),O => gpio_bus_in(44),T => gpio_t(44),C => gpio_clk,PAD => WingType_mosi_CH(3) );
  pin45: IOPAD port map(I => gpio_o(45),O => gpio_bus_in(45),T => gpio_t(45),C => gpio_clk,PAD => WingType_mosi_DL(4) );
  pin46: IOPAD port map(I => gpio_o(46),O => gpio_bus_in(46),T => gpio_t(46),C => gpio_clk,PAD => WingType_mosi_CH(4) );
  pin47: IOPAD port map(I => gpio_o(47),O => gpio_bus_in(47),T => gpio_t(47),C => gpio_clk,PAD => WingType_mosi_DL(3) );
  pin48: IOPAD port map(I => gpio_o(48),O => gpio_bus_in(48),T => gpio_t(48),C => gpio_clk,PAD => WingType_mosi_CH(5) );
  pin49: IOPAD port map(I => gpio_o(49),O => gpio_bus_in(49),T => gpio_t(49),C => gpio_clk,PAD => WingType_mosi_DL(2) );
  pin50: IOPAD port map(I => gpio_o(50),O => gpio_bus_in(50),T => gpio_t(50),C => gpio_clk,PAD => WingType_mosi_CH(6) );
  pin51: IOPAD port map(I => gpio_o(51),O => gpio_bus_in(51),T => gpio_t(51),C => gpio_clk,PAD => WingType_mosi_DL(1) );
  pin52: IOPAD port map(I => gpio_o(52),O => gpio_bus_in(52),T => gpio_t(52),C => gpio_clk,PAD => WingType_mosi_CH(7) );
  pin53: IOPAD port map(I => gpio_o(53),O => gpio_bus_in(53),T => gpio_t(53),C => gpio_clk,PAD => WingType_mosi_DL(0) );   
  
--  pin22: IOPAD port map(I => gpio_o(22),O => gpio_bus_in(22),T => gpio_t(22),C => gpio_clk,PAD => WingType_mosi_CL(0) );
--  pin23: IOPAD port map(I => gpio_o(23),O => gpio_bus_in(23),T => gpio_t(23),C => gpio_clk,PAD => WingType_mosi_CL(1) );
--  pin24: IOPAD port map(I => gpio_o(24),O => gpio_bus_in(24),T => gpio_t(24),C => gpio_clk,PAD => WingType_mosi_CL(2) );
--  pin25: IOPAD port map(I => gpio_o(25),O => gpio_bus_in(25),T => gpio_t(25),C => gpio_clk,PAD => WingType_mosi_CL(3) );
--  pin26: IOPAD port map(I => gpio_o(26),O => gpio_bus_in(26),T => gpio_t(26),C => gpio_clk,PAD => WingType_mosi_CL(4) );
--  pin27: IOPAD port map(I => gpio_o(27),O => gpio_bus_in(27),T => gpio_t(27),C => gpio_clk,PAD => WingType_mosi_CL(5) );
--  pin28: IOPAD port map(I => gpio_o(28),O => gpio_bus_in(28),T => gpio_t(28),C => gpio_clk,PAD => WingType_mosi_CL(6) );
--  pin29: IOPAD port map(I => gpio_o(29),O => gpio_bus_in(29),T => gpio_t(29),C => gpio_clk,PAD => WingType_mosi_CL(7) );
--  pin30: IOPAD port map(I => gpio_o(30),O => gpio_bus_in(30),T => gpio_t(30),C => gpio_clk,PAD => WingType_mosi_CH(0) );
--  pin31: IOPAD port map(I => gpio_o(31),O => gpio_bus_in(31),T => gpio_t(31),C => gpio_clk,PAD => WingType_mosi_CH(1) );
--  pin32: IOPAD port map(I => gpio_o(32),O => gpio_bus_in(32),T => gpio_t(32),C => gpio_clk,PAD => WingType_mosi_CH(2) );
--  pin33: IOPAD port map(I => gpio_o(33),O => gpio_bus_in(33),T => gpio_t(33),C => gpio_clk,PAD => WingType_mosi_CH(3) );
--  pin34: IOPAD port map(I => gpio_o(34),O => gpio_bus_in(34),T => gpio_t(34),C => gpio_clk,PAD => WingType_mosi_CH(4) );
--  pin35: IOPAD port map(I => gpio_o(35),O => gpio_bus_in(35),T => gpio_t(35),C => gpio_clk,PAD => WingType_mosi_CH(5) );
--  pin36: IOPAD port map(I => gpio_o(36),O => gpio_bus_in(36),T => gpio_t(36),C => gpio_clk,PAD => WingType_mosi_CH(6) );
--  pin37: IOPAD port map(I => gpio_o(37),O => gpio_bus_in(37),T => gpio_t(37),C => gpio_clk,PAD => WingType_mosi_CH(7) );
--  
--  pin38: IOPAD port map(I => gpio_o(38),O => gpio_bus_in(38),T => gpio_t(38),C => gpio_clk,PAD => WingType_mosi_DL(0) );
--  pin39: IOPAD port map(I => gpio_o(39),O => gpio_bus_in(39),T => gpio_t(39),C => gpio_clk,PAD => WingType_mosi_DL(1) );
--  pin40: IOPAD port map(I => gpio_o(40),O => gpio_bus_in(40),T => gpio_t(40),C => gpio_clk,PAD => WingType_mosi_DL(2) );
--  pin41: IOPAD port map(I => gpio_o(41),O => gpio_bus_in(41),T => gpio_t(41),C => gpio_clk,PAD => WingType_mosi_DL(3) );
--  pin42: IOPAD port map(I => gpio_o(42),O => gpio_bus_in(42),T => gpio_t(42),C => gpio_clk,PAD => WingType_mosi_DL(4) );
--  pin43: IOPAD port map(I => gpio_o(43),O => gpio_bus_in(43),T => gpio_t(43),C => gpio_clk,PAD => WingType_mosi_DL(5) );
--  pin44: IOPAD port map(I => gpio_o(44),O => gpio_bus_in(44),T => gpio_t(44),C => gpio_clk,PAD => WingType_mosi_DL(6) );
--  pin45: IOPAD port map(I => gpio_o(45),O => gpio_bus_in(45),T => gpio_t(45),C => gpio_clk,PAD => WingType_mosi_DL(7) );
--  pin46: IOPAD port map(I => gpio_o(46),O => gpio_bus_in(46),T => gpio_t(46),C => gpio_clk,PAD => WingType_mosi_DH(0) );
--  pin47: IOPAD port map(I => gpio_o(47),O => gpio_bus_in(47),T => gpio_t(47),C => gpio_clk,PAD => WingType_mosi_DH(1) );
--  pin48: IOPAD port map(I => gpio_o(48),O => gpio_bus_in(48),T => gpio_t(48),C => gpio_clk,PAD => WingType_mosi_DH(2) );
--  pin49: IOPAD port map(I => gpio_o(49),O => gpio_bus_in(49),T => gpio_t(49),C => gpio_clk,PAD => WingType_mosi_DH(3) );
--  pin50: IOPAD port map(I => gpio_o(50),O => gpio_bus_in(50),T => gpio_t(50),C => gpio_clk,PAD => WingType_mosi_DH(4) );
--  pin51: IOPAD port map(I => gpio_o(51),O => gpio_bus_in(51),T => gpio_t(51),C => gpio_clk,PAD => WingType_mosi_DH(5) );
--  pin52: IOPAD port map(I => gpio_o(52),O => gpio_bus_in(52),T => gpio_t(52),C => gpio_clk,PAD => WingType_mosi_DH(6) );
--  pin53: IOPAD port map(I => gpio_o(53),O => gpio_bus_in(53),T => gpio_t(53),C => gpio_clk,PAD => WingType_mosi_DH(7) );  
--  ospics:   OPAD port map ( I => gpio_bus_out.gpio_o(48),   PAD => SPI_CS );

  WING_AL0 <= WingType_miso_AL(0);
  WING_AL1 <= WingType_miso_AL(1);
  WING_AL2 <= WingType_miso_AL(2);
  WING_AL3 <= WingType_miso_AL(3);
  WING_AL4 <= WingType_miso_AL(4);
  WING_AL5 <= WingType_miso_AL(5);
  WING_AL6 <= WingType_miso_AL(6);
  WING_AL7 <= WingType_miso_AL(7);

  WING_AH0 <= WingType_miso_AH(0);
  WING_AH1 <= WingType_miso_AH(1);
  WING_AH2 <= WingType_miso_AH(2);
  WING_AH3 <= WingType_miso_AH(3);
  WING_AH4 <= WingType_miso_AH(4);
  WING_AH5 <= WingType_miso_AH(5);
--  WING_AH6 <= WingType_miso_AH(6);
--  WING_AH7 <= WingType_miso_AH(7);

  WING_BL0 <= WingType_miso_BL(0);
  WING_BL1 <= WingType_miso_BL(1);
  WING_BL2 <= WingType_miso_BL(2);
  WING_BL3 <= WingType_miso_BL(3);
  WING_BL4 <= WingType_miso_BL(4);
  WING_BL5 <= WingType_miso_BL(5);
  WING_BL6 <= WingType_miso_BL(6);
  WING_BL7 <= WingType_miso_BL(7);
  
--  WING_BH0 <= WingType_miso_BH(0);
--  WING_BH1 <= WingType_miso_BH(1);
--  WING_BH2 <= WingType_miso_BH(2);
--  WING_BH3 <= WingType_miso_BH(3);
--  WING_BH4 <= WingType_miso_BH(4);
--  WING_BH5 <= WingType_miso_BH(5);
--  WING_BH6 <= WingType_miso_BH(6);
--  WING_BH7 <= WingType_miso_BH(7);  
  
  WING_CL0 <= WingType_miso_CL(0);
  WING_CL1 <= WingType_miso_CL(1);
  WING_CL2 <= WingType_miso_CL(2);
  WING_CL3 <= WingType_miso_CL(3);
  WING_CL4 <= WingType_miso_CL(4);
  WING_CL5 <= WingType_miso_CL(5);
  WING_CL6 <= WingType_miso_CL(6);
  WING_CL7 <= WingType_miso_CL(7);  
  
  WING_CH0 <= WingType_miso_CH(0);
  WING_CH1 <= WingType_miso_CH(1);
  WING_CH2 <= WingType_miso_CH(2);
  WING_CH3 <= WingType_miso_CH(3);
  WING_CH4 <= WingType_miso_CH(4);
  WING_CH5 <= WingType_miso_CH(5);
  WING_CH6 <= WingType_miso_CH(6);
  WING_CH7 <= WingType_miso_CH(7);
  
  WING_DL0 <= WingType_miso_DL(0);
  WING_DL1 <= WingType_miso_DL(1);
  WING_DL2 <= WingType_miso_DL(2);
  WING_DL3 <= WingType_miso_DL(3);
  WING_DL4 <= WingType_miso_DL(4);
  WING_DL5 <= WingType_miso_DL(5);
  WING_DL6 <= WingType_miso_DL(6);
  WING_DL7 <= WingType_miso_DL(7);  
  
  WING_DH0 <= WingType_miso_DH(0);
  WING_DH1 <= WingType_miso_DH(1);
  WING_DH2 <= WingType_miso_DH(2);
  WING_DH3 <= WingType_miso_DH(3);
  WING_DH4 <= WingType_miso_DH(4);
  WING_DH5 <= WingType_miso_DH(5);
  WING_DH6 <= WingType_miso_DH(6);
  WING_DH7 <= WingType_miso_DH(7);  

  process(Flex_Pin_out_0, Flex_Pin_out_1, Flex_Pin_out_2, Flex_Pin_out_3, Flex_Pin_out_4, Flex_Pin_out_5)
--          sigmadelta_spp_data,
--          timers_pwm,
--          spi2_mosi,spi2_sck)
  begin
	 gpio_bus_in(54) <= Flex_Pin_out_0;
	 gpio_bus_in(55) <= Flex_Pin_out_1;
	 gpio_bus_in(56) <= Flex_Pin_out_2;
	 gpio_bus_in(57) <= Flex_Pin_out_3;
	 gpio_bus_in(58) <= Flex_Pin_out_4;
	 gpio_bus_in(59) <= Flex_Pin_out_5;
	 gpio_bus_in(97 downto 60) <= (others => DontCareValue);
	 
	 Flex_Pin_in_0 <= gpio_spp_read(0);
	 Flex_Pin_in_1 <= gpio_spp_read(1);
	 Flex_Pin_in_2 <= gpio_spp_read(2);
	 Flex_Pin_in_3 <= gpio_spp_read(3);
	 Flex_Pin_in_4 <= gpio_spp_read(4);
	 Flex_Pin_in_5 <= gpio_spp_read(5);

  end process;


end BEHAVIORAL;



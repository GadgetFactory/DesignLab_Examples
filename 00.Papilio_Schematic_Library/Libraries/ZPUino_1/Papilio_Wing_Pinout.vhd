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
library board;
use board.zpupkg.all;
use board.zpuinopkg.all;
use board.zpuino_config.all;
use board.zpu_config.all;

library zpuino;
use zpuino.pad.all;
use zpuino.papilio_pkg.all;

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

entity Papilio_Wing_Pinout is
   port (    
 
			gpio_bus_in : out std_logic_vector(97 downto 0);
			gpio_bus_out : in std_logic_vector(147 downto 0);	 			 

			 WingType_miso_AH: inout std_logic_vector(7 downto 0); 
			 WingType_mosi_AH: inout std_logic_vector(7 downto 0);			 
			 WING_AH0	: inout std_logic;
			 WING_AH1	: inout std_logic;
			 WING_AH2	: inout std_logic;
			 WING_AH3	: inout std_logic;
			 WING_AH4	: inout std_logic;
			 WING_AH5	: inout std_logic;
			 WING_AH6	: inout std_logic;
			 WING_AH7	: inout std_logic;

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

			 WingType_miso_BH: inout std_logic_vector(7 downto 0); 
			 WingType_mosi_BH: inout std_logic_vector(7 downto 0);
			 WING_BH0	: inout std_logic;
			 WING_BH1	: inout std_logic;
			 WING_BH2	: inout std_logic;
			 WING_BH3	: inout std_logic;
			 WING_BH4	: inout std_logic;
			 WING_BH5	: inout std_logic;
			 WING_BH6	: inout std_logic;
			 WING_BH7	: inout std_logic;

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
			 WING_CL7	: inout std_logic
			 );			 
end Papilio_Wing_Pinout;

architecture BEHAVIORAL of Papilio_Wing_Pinout is

  signal gpio_o:      std_logic_vector(48 downto 0);
  signal gpio_t:      std_logic_vector(48 downto 0);
  signal gpio_i:      std_logic_vector(48 downto 0);
  
  signal gpio_spp_data: std_logic_vector(48 downto 0);
  signal gpio_spp_read: std_logic_vector(48 downto 0); 

  signal gpio_clk: std_logic;  

begin
--Unpack the signal array into a record so the modules code is easier to understand.
	--gpio_bus_in(97 downto 49) <= gpio_spp_data;
	--gpio_bus_in(48 downto 0) <= gpio_i;
	
	gpio_clk <= gpio_bus_out(147);
	gpio_o <= gpio_bus_out(146 downto 98);
	gpio_t <= gpio_bus_out(97 downto 49);
	gpio_spp_read <= gpio_bus_out(48 downto 0);	
  

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
  pin14: IOPAD port map(I => gpio_o(14),O => gpio_bus_in(14),T => gpio_t(14),C => gpio_clk,PAD => WingType_mosi_AH(6) );
  pin15: IOPAD port map(I => gpio_o(15),O => gpio_bus_in(15),T => gpio_t(15),C => gpio_clk,PAD => WingType_mosi_AH(7) );

  pin16: IOPAD port map(I => gpio_o(16),O => gpio_bus_in(16),T => gpio_t(16),C => gpio_clk,PAD => WingType_mosi_BL(0) );
  pin17: IOPAD port map(I => gpio_o(17),O => gpio_bus_in(17),T => gpio_t(17),C => gpio_clk,PAD => WingType_mosi_BL(1) );
  pin18: IOPAD port map(I => gpio_o(18),O => gpio_bus_in(18),T => gpio_t(18),C => gpio_clk,PAD => WingType_mosi_BL(2) );
  pin19: IOPAD port map(I => gpio_o(19),O => gpio_bus_in(19),T => gpio_t(19),C => gpio_clk,PAD => WingType_mosi_BL(3) );
  pin20: IOPAD port map(I => gpio_o(20),O => gpio_bus_in(20),T => gpio_t(20),C => gpio_clk,PAD => WingType_mosi_BL(4) );
  pin21: IOPAD port map(I => gpio_o(21),O => gpio_bus_in(21),T => gpio_t(21),C => gpio_clk,PAD => WingType_mosi_BL(5) );
  pin22: IOPAD port map(I => gpio_o(22),O => gpio_bus_in(22),T => gpio_t(22),C => gpio_clk,PAD => WingType_mosi_BL(6) );
  pin23: IOPAD port map(I => gpio_o(23),O => gpio_bus_in(23),T => gpio_t(23),C => gpio_clk,PAD => WingType_mosi_BL(7) );
  pin24: IOPAD port map(I => gpio_o(24),O => gpio_bus_in(24),T => gpio_t(24),C => gpio_clk,PAD => WingType_mosi_BH(0) );
  pin25: IOPAD port map(I => gpio_o(25),O => gpio_bus_in(25),T => gpio_t(25),C => gpio_clk,PAD => WingType_mosi_BH(1) );
  pin26: IOPAD port map(I => gpio_o(26),O => gpio_bus_in(26),T => gpio_t(26),C => gpio_clk,PAD => WingType_mosi_BH(2) );
  pin27: IOPAD port map(I => gpio_o(27),O => gpio_bus_in(27),T => gpio_t(27),C => gpio_clk,PAD => WingType_mosi_BH(3) );
  pin28: IOPAD port map(I => gpio_o(28),O => gpio_bus_in(28),T => gpio_t(28),C => gpio_clk,PAD => WingType_mosi_BH(4) );
  pin29: IOPAD port map(I => gpio_o(29),O => gpio_bus_in(29),T => gpio_t(29),C => gpio_clk,PAD => WingType_mosi_BH(5) );
  pin30: IOPAD port map(I => gpio_o(30),O => gpio_bus_in(30),T => gpio_t(30),C => gpio_clk,PAD => WingType_mosi_BH(6) );
  pin31: IOPAD port map(I => gpio_o(31),O => gpio_bus_in(31),T => gpio_t(31),C => gpio_clk,PAD => WingType_mosi_BH(7) );

  pin32: IOPAD port map(I => gpio_o(32),O => gpio_bus_in(32),T => gpio_t(32),C => gpio_clk,PAD => WingType_mosi_CL(0) );
  pin33: IOPAD port map(I => gpio_o(33),O => gpio_bus_in(33),T => gpio_t(33),C => gpio_clk,PAD => WingType_mosi_CL(1) );
  pin34: IOPAD port map(I => gpio_o(34),O => gpio_bus_in(34),T => gpio_t(34),C => gpio_clk,PAD => WingType_mosi_CL(2) );
  pin35: IOPAD port map(I => gpio_o(35),O => gpio_bus_in(35),T => gpio_t(35),C => gpio_clk,PAD => WingType_mosi_CL(3) );
  pin36: IOPAD port map(I => gpio_o(36),O => gpio_bus_in(36),T => gpio_t(36),C => gpio_clk,PAD => WingType_mosi_CL(4) );
  pin37: IOPAD port map(I => gpio_o(37),O => gpio_bus_in(37),T => gpio_t(37),C => gpio_clk,PAD => WingType_mosi_CL(5) );
  pin38: IOPAD port map(I => gpio_o(38),O => gpio_bus_in(38),T => gpio_t(38),C => gpio_clk,PAD => WingType_mosi_CL(6) );
  pin39: IOPAD port map(I => gpio_o(39),O => gpio_bus_in(39),T => gpio_t(39),C => gpio_clk,PAD => WingType_mosi_CL(7) );
  pin40: IOPAD port map(I => gpio_o(40),O => gpio_bus_in(40),T => gpio_t(40),C => gpio_clk,PAD => WingType_mosi_CH(0) );
  pin41: IOPAD port map(I => gpio_o(41),O => gpio_bus_in(41),T => gpio_t(41),C => gpio_clk,PAD => WingType_mosi_CH(1) );
  pin42: IOPAD port map(I => gpio_o(42),O => gpio_bus_in(42),T => gpio_t(42),C => gpio_clk,PAD => WingType_mosi_CH(2) );
  pin43: IOPAD port map(I => gpio_o(43),O => gpio_bus_in(43),T => gpio_t(43),C => gpio_clk,PAD => WingType_mosi_CH(3) );
  pin44: IOPAD port map(I => gpio_o(44),O => gpio_bus_in(44),T => gpio_t(44),C => gpio_clk,PAD => WingType_mosi_CH(4) );
  pin45: IOPAD port map(I => gpio_o(45),O => gpio_bus_in(45),T => gpio_t(45),C => gpio_clk,PAD => WingType_mosi_CH(5) );
  pin46: IOPAD port map(I => gpio_o(46),O => gpio_bus_in(46),T => gpio_t(46),C => gpio_clk,PAD => WingType_mosi_CH(6) );
  pin47: IOPAD port map(I => gpio_o(47),O => gpio_bus_in(47),T => gpio_t(47),C => gpio_clk,PAD => WingType_mosi_CH(7) );
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
  WING_AH6 <= WingType_miso_AH(6);
  WING_AH7 <= WingType_miso_AH(7);

  WING_BL0 <= WingType_miso_BL(0);
  WING_BL1 <= WingType_miso_BL(1);
  WING_BL2 <= WingType_miso_BL(2);
  WING_BL3 <= WingType_miso_BL(3);
  WING_BL4 <= WingType_miso_BL(4);
  WING_BL5 <= WingType_miso_BL(5);
  WING_BL6 <= WingType_miso_BL(6);
  WING_BL7 <= WingType_miso_BL(7);
  
  WING_BH0 <= WingType_miso_BH(0);
  WING_BH1 <= WingType_miso_BH(1);
  WING_BH2 <= WingType_miso_BH(2);
  WING_BH3 <= WingType_miso_BH(3);
  WING_BH4 <= WingType_miso_BH(4);
  WING_BH5 <= WingType_miso_BH(5);
  WING_BH6 <= WingType_miso_BH(6);
  WING_BH7 <= WingType_miso_BH(7);  
  
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

  process(gpio_spp_read)
--          sigmadelta_spp_data,
--          timers_pwm,
--          spi2_mosi,spi2_sck)
  begin
	 gpio_bus_in(97 downto 49) <= (others => DontCareValue);

  end process;


end BEHAVIORAL;



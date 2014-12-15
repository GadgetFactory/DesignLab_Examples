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
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity LogicStart_Shield_Pinout is
   port (    
			 Audio_Left   : in    std_logic; 
			 Audio_Right  : in    std_logic; 
          Seg7_dot     : in    std_logic; 
          Seg7_enable  : in    std_logic_vector (3 downto 0); 
          Seg7_segdata : in    std_logic_vector (6 downto 0); 
			 VGA_Red3	  : in 	 std_logic;
			 VGA_Red2	  : in 	 std_logic;
			 VGA_Red1	  : in 	 std_logic;
			 VGA_Red0	  : in 	 std_logic;
			 VGA_Green3	  : in 	 std_logic;
			 VGA_Green2	  : in 	 std_logic;
			 VGA_Green1	  : in 	 std_logic;
			 VGA_Green0	  : in 	 std_logic;
			 VGA_Blue3	  : in 	 std_logic;
			 VGA_Blue2	  : in 	 std_logic;
			 VGA_Blue1	  : in 	 std_logic;
			 VGA_Blue0	  : in 	 std_logic;
          VGA_Hsync    : in    std_logic; 
          VGA_Vsync    : in    std_logic; 
			 VGA_Bus : inout std_logic_vector(32 downto 0);	
			 		 

			gpio_bus_in : out std_logic_vector(200 downto 0);
			gpio_bus_out : in std_logic_vector(200 downto 0);	
			 
			 WING_AH0	: inout std_logic;
			 WING_AH1	: inout std_logic;
			 WING_AH2	: inout std_logic;
			 WING_AH3	: inout std_logic;
			 WING_AH4	: inout std_logic;
			 WING_AH5	: inout std_logic;
			 WING_AH6	: inout std_logic;
			 WING_AH7	: inout std_logic;
			 
			 WING_AL0	: inout std_logic;
			 WING_AL1	: inout std_logic;
			 WING_AL2	: inout std_logic;
			 WING_AL3	: inout std_logic;
			 WING_AL4	: inout std_logic;
			 WING_AL5	: inout std_logic;
			 WING_AL6	: inout std_logic;
			 WING_AL7	: inout std_logic;

			 WING_BH0	: inout std_logic;
			 WING_BH1	: inout std_logic;
			 WING_BH2	: inout std_logic;
			 WING_BH3	: inout std_logic;
			 WING_BH4	: inout std_logic;
			 WING_BH5	: inout std_logic;
			 WING_BH6	: inout std_logic;
			 WING_BH7	: inout std_logic;

			 WING_BL0	: inout std_logic;
			 WING_BL1	: inout std_logic;
			 WING_BL2	: inout std_logic;
			 WING_BL3	: inout std_logic;
			 WING_BL4	: inout std_logic;
			 WING_BL5	: inout std_logic;
			 WING_BL6	: inout std_logic;
			 WING_BL7	: inout std_logic;

			 WING_CH0	: inout std_logic;
			 WING_CH1	: inout std_logic;
			 WING_CH2	: inout std_logic;
			 WING_CH3	: inout std_logic;
			 WING_CH4	: inout std_logic;
			 WING_CH5	: inout std_logic;
			 WING_CH6	: inout std_logic;
			 WING_CH7	: inout std_logic;

			 WING_CL0	: inout std_logic;
			 WING_CL1	: inout std_logic;
			 WING_CL2	: inout std_logic;
			 WING_CL3	: inout std_logic;
			 WING_CL4	: inout std_logic;
			 WING_CL5	: inout std_logic;
			 WING_CL6	: inout std_logic;
			 WING_CL7	: inout std_logic;
			 
			 WING_DH0	: inout std_logic;
			 WING_DH1	: inout std_logic;
			 WING_DH2	: inout std_logic;
			 WING_DH3	: inout std_logic;
			 WING_DH4	: inout std_logic;
			 WING_DH5	: inout std_logic;
			 WING_DH6	: inout std_logic;
			 WING_DH7	: inout std_logic;
			 
			 WING_DL0	: inout std_logic;
			 WING_DL1	: inout std_logic;
			 WING_DL2	: inout std_logic;
			 WING_DL3	: inout std_logic;
			 WING_DL4	: inout std_logic;
			 WING_DL5	: inout std_logic;
			 WING_DL6	: inout std_logic;
			 WING_DL7	: inout std_logic				 
			 );
end LogicStart_Shield_Pinout;

architecture BEHAVIORAL of LogicStart_Shield_Pinout is
--  signal gpio_o:      std_logic_vector(zpuino_gpio_count-1 downto 0);
--  signal gpio_t:      std_logic_vector(zpuino_gpio_count-1 downto 0);
--  signal gpio_i:      std_logic_vector(zpuino_gpio_count-1 downto 0);
--  
--  -- SPP signal is one more than GPIO count
--  signal gpio_spp_data: std_logic_vector(zpuino_gpio_count-1 downto 0);
--  signal gpio_spp_read: std_logic_vector(zpuino_gpio_count-1 downto 0);
--  
--  constant spp_cap_in: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
--    "0" &
--    "1111111111111111" &
--    "1111111111111111" &
--    "1111111111111111";
--  constant spp_cap_out: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
--    "0" &
--    "1111111111111111" &
--    "1111111111111111" &
--    "1111111111111111";  

constant wordPower			: integer := 5;
constant wordSize			: integer := 2**wordPower;
constant maxAddrBitIncIO		: integer := 27;
constant maxIOBit: integer := maxAddrBitIncIO - 1;
constant minIOBit: integer := 2;
constant maxAddrBitBRAM		: integer := 22;
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
	--gpio_bus_in(97 downto 49) <= gpio_spp_data;
	--gpio_bus_in(48 downto 0) <= gpio_i;
	
	gpio_clk <= gpio_bus_out(165);
	gpio_o <= gpio_bus_out(164 downto 110);
	gpio_t <= gpio_bus_out(109 downto 55);
	gpio_spp_read <= gpio_bus_out(54 downto 0);	

	WING_BL0 <= Audio_Left;
	WING_BL1 <= Audio_Right;

	--7 Segment
	WING_CL5 <= Seg7_enable(3);
	WING_CL0 <= Seg7_dot;
	WING_CL6 <= Seg7_enable(2);
	WING_BL2 <= Seg7_segdata(4);	--
	WING_BL4 <= Seg7_segdata(5);	--
	WING_BL5 <= Seg7_segdata(2);	--
	WING_CL1 <= Seg7_segdata(3);
	WING_BL3 <= Seg7_segdata(0);	--
	WING_CH0 <= Seg7_enable(1);
	WING_BL6 <= Seg7_segdata(6);	--
	WING_BL7 <= Seg7_segdata(1);	--
	WING_CH1 <= Seg7_enable(0);

	--VGA
--	WING_DL1 <= VGA_Vsync;
--	WING_DL0 <= VGA_Hsync;
--	WING_DL6 <= VGA_Blue0;
--	WING_DL7 <= VGA_Blue1;
--	WING_DH1 <= VGA_Green0;
--	WING_DH2 <= VGA_Green1;
--	WING_DH3 <= VGA_Green2;
--	WING_DH6 <= VGA_Red0;
--	WING_DH5 <= VGA_Red1;
--	WING_DH4 <= VGA_Red2;
	
	WING_DL1 <= vga_vsync OR VGA_Bus(31);
	WING_DL0 <= vga_hsync OR VGA_Bus(30);
	WING_DH4 <= vga_red3 OR VGA_Bus(9);	
	WING_DH5 <= vga_red2 OR VGA_Bus(8);	
	WING_DH6 <= vga_red1 OR VGA_Bus(7);	
	WING_DH7 <= vga_red0 OR VGA_Bus(6);	
	WING_DH3 <= vga_green3 OR VGA_Bus(19);
	WING_DH2 <= vga_green2 OR VGA_Bus(18);
	WING_DH1 <= vga_green1 OR VGA_Bus(17);
	WING_DH0 <= vga_green0 OR VGA_Bus(16);	
	WING_DL7 <= vga_blue3 OR VGA_Bus(29);
	WING_DL6 <= vga_blue2 OR VGA_Bus(28);
	WING_DL5 <= vga_blue1 OR VGA_Bus(27);
	WING_DL2 <= vga_blue0 OR VGA_Bus(26);	

  pin00: IOPAD port map(I => gpio_o(0), O => gpio_bus_in(0), T => gpio_t(0), C => gpio_clk,PAD => WING_AL0);
  pin01: IOPAD port map(I => gpio_o(1), O => gpio_bus_in(1), T => gpio_t(1), C => gpio_clk,PAD => WING_AL1);
  pin02: IOPAD port map(I => gpio_o(2), O => gpio_bus_in(2), T => gpio_t(2), C => gpio_clk,PAD => WING_AL2);
  pin03: IOPAD port map(I => gpio_o(3), O => gpio_bus_in(3), T => gpio_t(3), C => gpio_clk,PAD => WING_AL3);
  pin04: IOPAD port map(I => gpio_o(4), O => gpio_bus_in(4), T => gpio_t(4), C => gpio_clk,PAD => WING_AL4);
  pin05: IOPAD port map(I => gpio_o(5), O => gpio_bus_in(5), T => gpio_t(5), C => gpio_clk,PAD => WING_AL5);
  pin06: IOPAD port map(I => gpio_o(6), O => gpio_bus_in(6), T => gpio_t(6), C => gpio_clk,PAD => WING_AL6);
  pin07: IOPAD port map(I => gpio_o(7), O => gpio_bus_in(7), T => gpio_t(7), C => gpio_clk,PAD => WING_AL7);
  pin08: IOPAD port map(I => gpio_o(8), O => gpio_bus_in(8), T => gpio_t(8), C => gpio_clk,PAD => WING_AH0);
  pin09: IOPAD port map(I => gpio_o(9), O => gpio_bus_in(9), T => gpio_t(9), C => gpio_clk,PAD => WING_AH1);
  pin10: IOPAD port map(I => gpio_o(10),O => gpio_bus_in(10),T => gpio_t(10),C => gpio_clk,PAD => WING_AH2);
  pin11: IOPAD port map(I => gpio_o(11),O => gpio_bus_in(11),T => gpio_t(11),C => gpio_clk,PAD => WING_AH3);
  pin12: IOPAD port map(I => gpio_o(12),O => gpio_bus_in(12),T => gpio_t(12),C => gpio_clk,PAD => WING_AH4);
  pin13: IOPAD port map(I => gpio_o(13),O => gpio_bus_in(13),T => gpio_t(13),C => gpio_clk,PAD => WING_AH5);
  
--  pin14: IOPAD port map(I => gpio_o(14),O => gpio_bus_in(14),T => gpio_t(14),C => gpio_clk,PAD => WING_BL7);
--  pin15: IOPAD port map(I => gpio_o(15),O => gpio_bus_in(15),T => gpio_t(15),C => gpio_clk,PAD => WING_BL6);
--  pin16: IOPAD port map(I => gpio_o(16),O => gpio_bus_in(16),T => gpio_t(16),C => gpio_clk,PAD => WING_BL5);
--  pin17: IOPAD port map(I => gpio_o(17),O => gpio_bus_in(17),T => gpio_t(17),C => gpio_clk,PAD => WING_BL4);
--  pin18: IOPAD port map(I => gpio_o(18),O => gpio_bus_in(18),T => gpio_t(18),C => gpio_clk,PAD => WING_BL3);
--  pin19: IOPAD port map(I => gpio_o(19),O => gpio_bus_in(19),T => gpio_t(19),C => gpio_clk,PAD => WING_BL2);
--  pin20: IOPAD port map(I => gpio_o(20),O => gpio_bus_in(20),T => gpio_t(20),C => gpio_clk,PAD => WING_BL1);
--  pin21: IOPAD port map(I => gpio_o(21),O => gpio_bus_in(21),T => gpio_t(21),C => gpio_clk,PAD => WING_BL0);
  
--  pin22: IOPAD port map(I => gpio_o(22),O => gpio_bus_in(22),T => gpio_t(22),C => gpio_clk,PAD => WING_CL0);
--  pin23: IOPAD port map(I => gpio_o(23),O => gpio_bus_in(23),T => gpio_t(23),C => gpio_clk,PAD => WING_DH7);
--  pin24: IOPAD port map(I => gpio_o(24),O => gpio_bus_in(24),T => gpio_t(24),C => gpio_clk,PAD => WING_CL1);
--  pin25: IOPAD port map(I => gpio_o(25),O => gpio_bus_in(25),T => gpio_t(25),C => gpio_clk,PAD => WING_DH6);
  pin26: IOPAD port map(I => gpio_o(26),O => gpio_bus_in(26),T => gpio_t(26),C => gpio_clk,PAD => WING_CL2);
--  pin27: IOPAD port map(I => gpio_o(27),O => gpio_bus_in(27),T => gpio_t(27),C => gpio_clk,PAD => WING_DH5);
  pin28: IOPAD port map(I => gpio_o(28),O => gpio_bus_in(28),T => gpio_t(28),C => gpio_clk,PAD => WING_CL3);
--  pin29: IOPAD port map(I => gpio_o(29),O => gpio_bus_in(29),T => gpio_t(29),C => gpio_clk,PAD => WING_DH4);
  pin30: IOPAD port map(I => gpio_o(30),O => gpio_bus_in(30),T => gpio_t(30),C => gpio_clk,PAD => WING_CL4);
--  pin31: IOPAD port map(I => gpio_o(31),O => gpio_bus_in(31),T => gpio_t(31),C => gpio_clk,PAD => WING_DH3);
--  pin32: IOPAD port map(I => gpio_o(32),O => gpio_bus_in(32),T => gpio_t(32),C => gpio_clk,PAD => WING_CL5);
--  pin33: IOPAD port map(I => gpio_o(33),O => gpio_bus_in(33),T => gpio_t(33),C => gpio_clk,PAD => WING_DH2);
--  pin34: IOPAD port map(I => gpio_o(34),O => gpio_bus_in(34),T => gpio_t(34),C => gpio_clk,PAD => WING_CL6);
--  pin35: IOPAD port map(I => gpio_o(35),O => gpio_bus_in(35),T => gpio_t(35),C => gpio_clk,PAD => WING_DH1);
--  pin36: IOPAD port map(I => gpio_o(36),O => gpio_bus_in(36),T => gpio_t(36),C => gpio_clk,PAD => WING_CL7);
--  pin37: IOPAD port map(I => gpio_o(37),O => gpio_bus_in(37),T => gpio_t(37),C => gpio_clk,PAD => WING_DH0);
  
--  pin38: IOPAD port map(I => gpio_o(38),O => gpio_bus_in(38),T => gpio_t(38),C => gpio_clk,PAD => WING_CH0);
--  pin39: IOPAD port map(I => gpio_o(39),O => gpio_bus_in(39),T => gpio_t(39),C => gpio_clk,PAD => WING_DL7);
--  pin40: IOPAD port map(I => gpio_o(40),O => gpio_bus_in(40),T => gpio_t(40),C => gpio_clk,PAD => WING_CH1);
--  pin41: IOPAD port map(I => gpio_o(41),O => gpio_bus_in(41),T => gpio_t(41),C => gpio_clk,PAD => WING_DL6);
  pin42: IOPAD port map(I => gpio_o(42),O => gpio_bus_in(42),T => gpio_t(42),C => gpio_clk,PAD => WING_CH2);
--  pin43: IOPAD port map(I => gpio_o(43),O => gpio_bus_in(43),T => gpio_t(43),C => gpio_clk,PAD => WING_DL5);
  pin44: IOPAD port map(I => gpio_o(44),O => gpio_bus_in(44),T => gpio_t(44),C => gpio_clk,PAD => WING_CH3);
--  pin45: IOPAD port map(I => gpio_o(45),O => gpio_bus_in(45),T => gpio_t(45),C => gpio_clk,PAD => WING_DL4);
  pin46: IOPAD port map(I => gpio_o(46),O => gpio_bus_in(46),T => gpio_t(46),C => gpio_clk,PAD => WING_CH4);
--  pin47: IOPAD port map(I => gpio_o(47),O => gpio_bus_in(47),T => gpio_t(47),C => gpio_clk,PAD => WING_DL3);
  pin48: IOPAD port map(I => gpio_o(48),O => gpio_bus_in(48),T => gpio_t(48),C => gpio_clk,PAD => WING_CH5);
--  pin49: IOPAD port map(I => gpio_o(49),O => gpio_bus_in(49),T => gpio_t(49),C => gpio_clk,PAD => WING_DL2);
  pin50: IOPAD port map(I => gpio_o(50),O => gpio_bus_in(50),T => gpio_t(50),C => gpio_clk,PAD => WING_CH6);
--  pin51: IOPAD port map(I => gpio_o(51),O => gpio_bus_in(51),T => gpio_t(51),C => gpio_clk,PAD => WING_DL1);
  pin52: IOPAD port map(I => gpio_o(52),O => gpio_bus_in(52),T => gpio_t(52),C => gpio_clk,PAD => WING_CH7);
--  pin53: IOPAD port map(I => gpio_o(53),O => gpio_bus_in(53),T => gpio_t(53),C => gpio_clk,PAD => WING_DL0); 
  

  process(gpio_spp_read)
--          sigmadelta_spp_data,
--          timers_pwm,
--          spi2_mosi,spi2_sck)
  begin

--		gpio_spp_data <= (others => DontCareValue);
		gpio_bus_in(109 downto 54) <= (others => DontCareValue);


  end process;


end BEHAVIORAL;



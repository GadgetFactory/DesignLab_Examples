--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : sch2hdl
--  /   /         Filename : Papilio_Pro.vhf
-- /___/   /\     Timestamp : 01/16/2014 15:55:33
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl C:/dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/MegaWing_Logicstart/LX9/Papilio_Pro.vhf -w C:/dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/MegaWing_Logicstart/Papilio_Pro.sch
--Design Name: Papilio_Pro
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Papilio_Pro is
   port ( CLK        : in    std_logic; 
          RXD        : in    std_logic; 
          SPI_MISO   : in    std_logic; 
          DRAM_ADDR  : out   std_logic_vector (12 downto 0); 
          DRAM_BA    : out   std_logic_vector (1 downto 0); 
          DRAM_CAS_N : out   std_logic; 
          DRAM_CKE   : out   std_logic; 
          DRAM_CLK   : out   std_logic; 
          DRAM_CS_N  : out   std_logic; 
          DRAM_DQM   : out   std_logic_vector (1 downto 0); 
          DRAM_RAS_N : out   std_logic; 
          DRAM_WE_N  : out   std_logic; 
          LED        : out   std_logic; 
          SPI_MOSI   : out   std_logic; 
          SPI_SCK    : out   std_logic; 
          TXD        : out   std_logic; 
          DRAM_DQ    : inout std_logic_vector (15 downto 0); 
          SPI_CS     : inout std_logic; 
          WING_AH0   : inout std_logic; 
          WING_AH1   : inout std_logic; 
          WING_AH2   : inout std_logic; 
          WING_AH3   : inout std_logic; 
          WING_AH4   : inout std_logic; 
          WING_AH5   : inout std_logic; 
          WING_AH6   : inout std_logic; 
          WING_AH7   : inout std_logic; 
          WING_AL0   : inout std_logic; 
          WING_AL1   : inout std_logic; 
          WING_AL2   : inout std_logic; 
          WING_AL3   : inout std_logic; 
          WING_AL4   : inout std_logic; 
          WING_AL5   : inout std_logic; 
          WING_AL6   : inout std_logic; 
          WING_AL7   : inout std_logic; 
          WING_BH0   : inout std_logic; 
          WING_BH1   : inout std_logic; 
          WING_BH2   : inout std_logic; 
          WING_BH3   : inout std_logic; 
          WING_BH4   : inout std_logic; 
          WING_BH5   : inout std_logic; 
          WING_BH6   : inout std_logic; 
          WING_BH7   : inout std_logic; 
          WING_BL0   : inout std_logic; 
          WING_BL1   : inout std_logic; 
          WING_BL2   : inout std_logic; 
          WING_BL3   : inout std_logic; 
          WING_BL4   : inout std_logic; 
          WING_BL5   : inout std_logic; 
          WING_BL6   : inout std_logic; 
          WING_BL7   : inout std_logic; 
          WING_CH0   : inout std_logic; 
          WING_CH1   : inout std_logic; 
          WING_CH2   : inout std_logic; 
          WING_CH3   : inout std_logic; 
          WING_CH4   : inout std_logic; 
          WING_CH5   : inout std_logic; 
          WING_CH6   : inout std_logic; 
          WING_CH7   : inout std_logic; 
          WING_CL0   : inout std_logic; 
          WING_CL1   : inout std_logic; 
          WING_CL2   : inout std_logic; 
          WING_CL3   : inout std_logic; 
          WING_CL4   : inout std_logic; 
          WING_CL5   : inout std_logic; 
          WING_CL6   : inout std_logic; 
          WING_CL7   : inout std_logic);
end Papilio_Pro;

architecture BEHAVIORAL of Papilio_Pro is
   signal XLXN_408                                  : std_logic_vector (147 
         downto 0);
   signal XLXN_409                                  : std_logic_vector (97 
         downto 0);
   signal XLXN_430                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_431                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_432                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_433                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_434                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_435                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_442                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_443                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_448                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_449                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_450                                  : std_logic_vector (17 
         downto 0);
   signal XLXN_452                                  : std_logic;
   signal XLXN_536                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_537                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_542                                  : std_logic_vector (6 
         downto 0);
   signal XLXN_543                                  : std_logic_vector (3 
         downto 0);
   signal XLXN_544                                  : std_logic;
   signal XLXN_545                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_546                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_549                                  : std_logic;
   signal XLXN_559                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_560                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_567                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_568                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_584                                  : std_logic;
   signal XLXN_585                                  : std_logic;
   signal XLXN_586                                  : std_logic;
   signal XLXN_587                                  : std_logic;
   signal XLXN_588                                  : std_logic;
   signal XLXN_589                                  : std_logic;
   signal XLXN_590                                  : std_logic;
   signal XLXN_591                                  : std_logic;
   signal XLXN_592                                  : std_logic;
   signal XLXN_593                                  : std_logic;
   signal XLXN_596                                  : std_logic;
   signal XLXN_603                                  : std_logic;
   signal XLXN_604                                  : std_logic;
   signal XLXN_605                                  : std_logic;
   signal XLXN_610                                  : std_logic;
   signal XLXI_28_wishbone_slot_video_in_openSignal : std_logic_vector (63 
         downto 0);
   signal XLXI_63_SPI_CS_openSignal                 : std_logic;
   component ZPUino_Papilio_Pro_V1
      port ( gpio_bus_out            : out   std_logic_vector (147 downto 0); 
             gpio_bus_in             : in    std_logic_vector (97 downto 0); 
             SPI_CS                  : inout std_logic; 
             TXD                     : out   std_logic; 
             SPI_MOSI                : out   std_logic; 
             SPI_SCK                 : out   std_logic; 
             clk_96Mhz               : out   std_logic; 
             clk_1Mhz                : out   std_logic; 
             clk_osc_32Mhz           : out   std_logic; 
             DRAM_DQ                 : inout std_logic_vector (15 downto 0); 
             LED                     : out   std_logic; 
             DRAM_CAS_N              : out   std_logic; 
             DRAM_CKE                : out   std_logic; 
             DRAM_CLK                : out   std_logic; 
             DRAM_CS_N               : out   std_logic; 
             DRAM_RAS_N              : out   std_logic; 
             DRAM_WE_N               : out   std_logic; 
             DRAM_ADDR               : out   std_logic_vector (12 downto 0); 
             DRAM_BA                 : out   std_logic_vector (1 downto 0); 
             DRAM_DQM                : out   std_logic_vector (1 downto 0); 
             CLK                     : in    std_logic; 
             SPI_MISO                : in    std_logic; 
             RXD                     : in    std_logic; 
             wishbone_slot_5_out     : in    std_logic_vector (33 downto 0); 
             wishbone_slot_5_in      : out   std_logic_vector (61 downto 0); 
             wishbone_slot_6_in      : out   std_logic_vector (61 downto 0); 
             wishbone_slot_6_out     : in    std_logic_vector (33 downto 0); 
             wishbone_slot_8_in      : out   std_logic_vector (61 downto 0); 
             wishbone_slot_8_out     : in    std_logic_vector (33 downto 0); 
             wishbone_slot_9_in      : out   std_logic_vector (61 downto 0); 
             wishbone_slot_9_out     : in    std_logic_vector (33 downto 0); 
             wishbone_slot_10_in     : out   std_logic_vector (61 downto 0); 
             wishbone_slot_10_out    : in    std_logic_vector (33 downto 0); 
             wishbone_slot_11_in     : out   std_logic_vector (61 downto 0); 
             wishbone_slot_11_out    : in    std_logic_vector (33 downto 0); 
             wishbone_slot_12_in     : out   std_logic_vector (61 downto 0); 
             wishbone_slot_12_out    : in    std_logic_vector (33 downto 0); 
             wishbone_slot_13_in     : out   std_logic_vector (61 downto 0); 
             wishbone_slot_13_out    : in    std_logic_vector (33 downto 0); 
             wishbone_slot_14_in     : out   std_logic_vector (61 downto 0); 
             wishbone_slot_14_out    : in    std_logic_vector (33 downto 0); 
             wishbone_slot_video_in  : in    std_logic_vector (63 downto 0); 
             wishbone_slot_video_out : out   std_logic_vector (33 downto 0); 
             vgaclkout               : out   std_logic);
   end component;
   
   component Wishbone_Empty_Slot
      port ( wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component AUDIO_zpuino_wb_passthrough
      port ( raw_out      : out   std_logic_vector (17 downto 0); 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component AUDIO_zpuino_sa_sigmadeltaDAC
      port ( data_in   : in    std_logic_vector (17 downto 0); 
             audio_out : out   std_logic; 
             clk_96Mhz : in    std_logic);
   end component;
   
   component VIDEO_zpuino_wb_vga_hqvga
      port ( clk_50Mhz    : in    std_logic; 
             vga_hsync    : out   std_logic; 
             vga_vsync    : out   std_logic; 
             vga_r2       : out   std_logic; 
             vga_r1       : out   std_logic; 
             vga_r0       : out   std_logic; 
             vga_g2       : out   std_logic; 
             vga_g1       : out   std_logic; 
             vga_g0       : out   std_logic; 
             vga_b1       : out   std_logic; 
             vga_b0       : out   std_logic; 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component MISC_zpuino_wb_SevenSeg
      port ( segdata      : out   std_logic_vector (6 downto 0); 
             extra        : out   std_logic_vector (31 downto 0); 
             enable       : out   std_logic_vector (3 downto 0); 
             dot          : out   std_logic; 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component COMM_zpuino_wb_SPI
      port ( miso         : in    std_logic; 
             enabled      : out   std_logic; 
             sck          : out   std_logic; 
             mosi         : out   std_logic; 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component VIDEO_zpuino_wb_char_ram_8x8_sp
      port ( wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component LogicStart_MegaWing_Pinout
      port ( gpio_bus_out : in    std_logic_vector (147 downto 0); 
             gpio_bus_in  : out   std_logic_vector (97 downto 0); 
             WING_AL0     : inout std_logic; 
             WING_AL1     : inout std_logic; 
             WING_AL2     : inout std_logic; 
             WING_AL3     : inout std_logic; 
             WING_AL4     : inout std_logic; 
             WING_AL5     : inout std_logic; 
             WING_AL6     : inout std_logic; 
             WING_AL7     : inout std_logic; 
             WING_AH0     : inout std_logic; 
             WING_AH1     : inout std_logic; 
             WING_AH2     : inout std_logic; 
             WING_AH3     : inout std_logic; 
             WING_AH4     : inout std_logic; 
             WING_AH5     : inout std_logic; 
             WING_AH6     : inout std_logic; 
             WING_AH7     : inout std_logic; 
             WING_BL0     : inout std_logic; 
             WING_BL1     : inout std_logic; 
             WING_BL2     : inout std_logic; 
             WING_BL3     : inout std_logic; 
             WING_BL4     : inout std_logic; 
             WING_BL5     : inout std_logic; 
             WING_BL6     : inout std_logic; 
             WING_BL7     : inout std_logic; 
             WING_BH0     : inout std_logic; 
             WING_BH1     : inout std_logic; 
             WING_BH2     : inout std_logic; 
             WING_BH3     : inout std_logic; 
             WING_BH4     : inout std_logic; 
             WING_BH5     : inout std_logic; 
             WING_BH6     : inout std_logic; 
             WING_BH7     : inout std_logic; 
             WING_CL0     : inout std_logic; 
             WING_CL1     : inout std_logic; 
             WING_CL2     : inout std_logic; 
             WING_CL3     : inout std_logic; 
             WING_CL4     : inout std_logic; 
             WING_CL5     : inout std_logic; 
             WING_CL6     : inout std_logic; 
             WING_CL7     : inout std_logic; 
             WING_CH0     : inout std_logic; 
             WING_CH1     : inout std_logic; 
             WING_CH2     : inout std_logic; 
             WING_CH3     : inout std_logic; 
             WING_CH4     : inout std_logic; 
             WING_CH5     : inout std_logic; 
             WING_CH6     : inout std_logic; 
             WING_CH7     : inout std_logic; 
             VGA_Red2     : in    std_logic; 
             VGA_Red1     : in    std_logic; 
             VGA_Red0     : in    std_logic; 
             VGA_Green2   : in    std_logic; 
             VGA_Green1   : in    std_logic; 
             VGA_Green0   : in    std_logic; 
             VGA_Blue1    : in    std_logic; 
             VGA_Blue0    : in    std_logic; 
             VGA_Hsync    : in    std_logic; 
             VGA_Vsync    : in    std_logic; 
             Audio        : in    std_logic; 
             SPI_MISO     : out   std_logic; 
             SPI_MOSI     : in    std_logic; 
             SPI_CLK      : in    std_logic; 
             SPI_CS       : in    std_logic; 
             Seg7_dot     : in    std_logic; 
             Seg7_enable  : in    std_logic_vector (3 downto 0); 
             Seg7_segdata : in    std_logic_vector (6 downto 0));
   end component;
   
   component clk_32to50_dcm
      port ( CLK_IN1  : in    std_logic; 
             CLK_OUT1 : out   std_logic);
   end component;
   
begin
   XLXI_28 : ZPUino_Papilio_Pro_V1
      port map (CLK=>CLK,
                gpio_bus_in(97 downto 0)=>XLXN_409(97 downto 0),
                RXD=>RXD,
                SPI_MISO=>SPI_MISO,
                wishbone_slot_video_in(63 downto 
            0)=>XLXI_28_wishbone_slot_video_in_openSignal(63 downto 0),
                wishbone_slot_5_out(33 downto 0)=>XLXN_449(33 downto 0),
                wishbone_slot_6_out(33 downto 0)=>XLXN_560(33 downto 0),
                wishbone_slot_8_out(33 downto 0)=>XLXN_443(33 downto 0),
                wishbone_slot_9_out(33 downto 0)=>XLXN_537(33 downto 0),
                wishbone_slot_10_out(33 downto 0)=>XLXN_568(33 downto 0),
                wishbone_slot_11_out(33 downto 0)=>XLXN_546(33 downto 0),
                wishbone_slot_12_out(33 downto 0)=>XLXN_435(33 downto 0),
                wishbone_slot_13_out(33 downto 0)=>XLXN_433(33 downto 0),
                wishbone_slot_14_out(33 downto 0)=>XLXN_431(33 downto 0),
                clk_osc_32Mhz=>XLXN_549,
                clk_1Mhz=>open,
                clk_96Mhz=>XLXN_452,
                DRAM_ADDR(12 downto 0)=>DRAM_ADDR(12 downto 0),
                DRAM_BA(1 downto 0)=>DRAM_BA(1 downto 0),
                DRAM_CAS_N=>DRAM_CAS_N,
                DRAM_CKE=>DRAM_CKE,
                DRAM_CLK=>DRAM_CLK,
                DRAM_CS_N=>DRAM_CS_N,
                DRAM_DQM(1 downto 0)=>DRAM_DQM(1 downto 0),
                DRAM_RAS_N=>DRAM_RAS_N,
                DRAM_WE_N=>DRAM_WE_N,
                gpio_bus_out(147 downto 0)=>XLXN_408(147 downto 0),
                LED=>LED,
                SPI_MOSI=>SPI_MOSI,
                SPI_SCK=>SPI_SCK,
                TXD=>TXD,
                vgaclkout=>open,
                wishbone_slot_video_out=>open,
                wishbone_slot_5_in(61 downto 0)=>XLXN_448(61 downto 0),
                wishbone_slot_6_in(61 downto 0)=>XLXN_559(61 downto 0),
                wishbone_slot_8_in(61 downto 0)=>XLXN_442(61 downto 0),
                wishbone_slot_9_in(61 downto 0)=>XLXN_536(61 downto 0),
                wishbone_slot_10_in(61 downto 0)=>XLXN_567(61 downto 0),
                wishbone_slot_11_in(61 downto 0)=>XLXN_545(61 downto 0),
                wishbone_slot_12_in(61 downto 0)=>XLXN_434(61 downto 0),
                wishbone_slot_13_in(61 downto 0)=>XLXN_432(61 downto 0),
                wishbone_slot_14_in(61 downto 0)=>XLXN_430(61 downto 0),
                DRAM_DQ(15 downto 0)=>DRAM_DQ(15 downto 0),
                SPI_CS=>SPI_CS);
   
   XLXI_31 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_442(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_443(33 downto 0));
   
   XLXI_35 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_434(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_435(33 downto 0));
   
   XLXI_36 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_432(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_433(33 downto 0));
   
   XLXI_37 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_430(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_431(33 downto 0));
   
   XLXI_38 : AUDIO_zpuino_wb_passthrough
      port map (wishbone_in(61 downto 0)=>XLXN_448(61 downto 0),
                raw_out(17 downto 0)=>XLXN_450(17 downto 0),
                wishbone_out(33 downto 0)=>XLXN_449(33 downto 0));
   
   XLXI_39 : AUDIO_zpuino_sa_sigmadeltaDAC
      port map (clk_96Mhz=>XLXN_452,
                data_in(17 downto 0)=>XLXN_450(17 downto 0),
                audio_out=>XLXN_610);
   
   XLXI_55 : VIDEO_zpuino_wb_vga_hqvga
      port map (clk_50Mhz=>XLXN_596,
                wishbone_in(61 downto 0)=>XLXN_536(61 downto 0),
                vga_b0=>XLXN_593,
                vga_b1=>XLXN_592,
                vga_g0=>XLXN_591,
                vga_g1=>XLXN_590,
                vga_g2=>XLXN_589,
                vga_hsync=>XLXN_584,
                vga_r0=>XLXN_588,
                vga_r1=>XLXN_587,
                vga_r2=>XLXN_586,
                vga_vsync=>XLXN_585,
                wishbone_out(33 downto 0)=>XLXN_537(33 downto 0));
   
   XLXI_57 : MISC_zpuino_wb_SevenSeg
      port map (wishbone_in(61 downto 0)=>XLXN_545(61 downto 0),
                dot=>XLXN_544,
                enable(3 downto 0)=>XLXN_543(3 downto 0),
                extra=>open,
                segdata(6 downto 0)=>XLXN_542(6 downto 0),
                wishbone_out(33 downto 0)=>XLXN_546(33 downto 0));
   
   XLXI_60 : COMM_zpuino_wb_SPI
      port map (miso=>XLXN_605,
                wishbone_in(61 downto 0)=>XLXN_559(61 downto 0),
                enabled=>open,
                mosi=>XLXN_604,
                sck=>XLXN_603,
                wishbone_out(33 downto 0)=>XLXN_560(33 downto 0));
   
   XLXI_62 : VIDEO_zpuino_wb_char_ram_8x8_sp
      port map (wishbone_in(61 downto 0)=>XLXN_567(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_568(33 downto 0));
   
   XLXI_63 : LogicStart_MegaWing_Pinout
      port map (Audio=>XLXN_610,
                gpio_bus_out(147 downto 0)=>XLXN_408(147 downto 0),
                Seg7_dot=>XLXN_544,
                Seg7_enable(3 downto 0)=>XLXN_543(3 downto 0),
                Seg7_segdata(6 downto 0)=>XLXN_542(6 downto 0),
                SPI_CLK=>XLXN_603,
                SPI_CS=>XLXI_63_SPI_CS_openSignal,
                SPI_MOSI=>XLXN_604,
                VGA_Blue0=>XLXN_593,
                VGA_Blue1=>XLXN_592,
                VGA_Green0=>XLXN_591,
                VGA_Green1=>XLXN_590,
                VGA_Green2=>XLXN_589,
                VGA_Hsync=>XLXN_584,
                VGA_Red0=>XLXN_588,
                VGA_Red1=>XLXN_587,
                VGA_Red2=>XLXN_586,
                VGA_Vsync=>XLXN_585,
                gpio_bus_in(97 downto 0)=>XLXN_409(97 downto 0),
                SPI_MISO=>XLXN_605,
                WING_AH0=>WING_AH0,
                WING_AH1=>WING_AH1,
                WING_AH2=>WING_AH2,
                WING_AH3=>WING_AH3,
                WING_AH4=>WING_AH4,
                WING_AH5=>WING_AH5,
                WING_AH6=>WING_AH6,
                WING_AH7=>WING_AH7,
                WING_AL0=>WING_AL0,
                WING_AL1=>WING_AL1,
                WING_AL2=>WING_AL2,
                WING_AL3=>WING_AL3,
                WING_AL4=>WING_AL4,
                WING_AL5=>WING_AL5,
                WING_AL6=>WING_AL6,
                WING_AL7=>WING_AL7,
                WING_BH0=>WING_BH0,
                WING_BH1=>WING_BH1,
                WING_BH2=>WING_BH2,
                WING_BH3=>WING_BH3,
                WING_BH4=>WING_BH4,
                WING_BH5=>WING_BH5,
                WING_BH6=>WING_BH6,
                WING_BH7=>WING_BH7,
                WING_BL0=>WING_BL0,
                WING_BL1=>WING_BL1,
                WING_BL2=>WING_BL2,
                WING_BL3=>WING_BL3,
                WING_BL4=>WING_BL4,
                WING_BL5=>WING_BL5,
                WING_BL6=>WING_BL6,
                WING_BL7=>WING_BL7,
                WING_CH0=>WING_CH0,
                WING_CH1=>WING_CH1,
                WING_CH2=>WING_CH2,
                WING_CH3=>WING_CH3,
                WING_CH4=>WING_CH4,
                WING_CH5=>WING_CH5,
                WING_CH6=>WING_CH6,
                WING_CH7=>WING_CH7,
                WING_CL0=>WING_CL0,
                WING_CL1=>WING_CL1,
                WING_CL2=>WING_CL2,
                WING_CL3=>WING_CL3,
                WING_CL4=>WING_CL4,
                WING_CL5=>WING_CL5,
                WING_CL6=>WING_CL6,
                WING_CL7=>WING_CL7);
   
   XLXI_64 : clk_32to50_dcm
      port map (CLK_IN1=>XLXN_549,
                CLK_OUT1=>XLXN_596);
   
end BEHAVIORAL;



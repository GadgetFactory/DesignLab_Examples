--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : sch2hdl
--  /   /         Filename : Papilio_Pro.vhf
-- /___/   /\     Timestamp : 01/08/2014 12:39:27
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl C:/dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/Papilio_Schematic_Projects/Audio_SID_simple/LX9/Papilio_Pro.vhf -w C:/dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/Papilio_Schematic_Projects/Audio_SID_simple/Papilio_Pro.sch
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
   signal XLXN_327                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_328                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_329                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_330                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_331                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_332                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_333                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_334                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_335                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_336                                  : std_logic_vector (7 
         downto 0);
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
   signal XLXN_436                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_437                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_438                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_439                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_440                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_441                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_442                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_443                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_444                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_445                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_448                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_449                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_450                                  : std_logic_vector (17 
         downto 0);
   signal XLXN_451                                  : std_logic;
   signal XLXN_452                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_453                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_454                                  : std_logic;
   signal XLXN_455                                  : std_logic;
   signal XLXN_464                                  : std_logic;
   signal XLXN_465                                  : std_logic;
   signal XLXI_28_wishbone_slot_video_in_openSignal : std_logic_vector (63 
         downto 0);
   component Papilio_Wing_Pinout
      port ( gpio_bus_out     : in    std_logic_vector (147 downto 0); 
             gpio_bus_in      : out   std_logic_vector (97 downto 0); 
             WING_AH0         : inout std_logic; 
             WING_AH1         : inout std_logic; 
             WING_AH2         : inout std_logic; 
             WING_AH3         : inout std_logic; 
             WING_AH4         : inout std_logic; 
             WING_AH5         : inout std_logic; 
             WING_AH6         : inout std_logic; 
             WING_AH7         : inout std_logic; 
             WING_AL0         : inout std_logic; 
             WING_AL1         : inout std_logic; 
             WING_AL2         : inout std_logic; 
             WING_AL3         : inout std_logic; 
             WING_AL4         : inout std_logic; 
             WING_AL5         : inout std_logic; 
             WING_AL6         : inout std_logic; 
             WING_AL7         : inout std_logic; 
             WING_BH0         : inout std_logic; 
             WING_BH1         : inout std_logic; 
             WING_BH2         : inout std_logic; 
             WING_BH3         : inout std_logic; 
             WING_BH4         : inout std_logic; 
             WING_BH5         : inout std_logic; 
             WING_BH6         : inout std_logic; 
             WING_BH7         : inout std_logic; 
             WING_BL0         : inout std_logic; 
             WING_BL1         : inout std_logic; 
             WING_BL2         : inout std_logic; 
             WING_BL3         : inout std_logic; 
             WING_BL4         : inout std_logic; 
             WING_BL5         : inout std_logic; 
             WING_BL6         : inout std_logic; 
             WING_BL7         : inout std_logic; 
             WING_CL0         : inout std_logic; 
             WING_CL1         : inout std_logic; 
             WING_CL2         : inout std_logic; 
             WING_CL3         : inout std_logic; 
             WING_CL4         : inout std_logic; 
             WING_CL5         : inout std_logic; 
             WING_CL6         : inout std_logic; 
             WING_CL7         : inout std_logic; 
             WING_CH0         : inout std_logic; 
             WING_CH1         : inout std_logic; 
             WING_CH2         : inout std_logic; 
             WING_CH3         : inout std_logic; 
             WING_CH4         : inout std_logic; 
             WING_CH5         : inout std_logic; 
             WING_CH6         : inout std_logic; 
             WING_CH7         : inout std_logic; 
             WingType_miso_BH : inout std_logic_vector (7 downto 0); 
             WingType_miso_BL : inout std_logic_vector (7 downto 0); 
             WingType_miso_AH : inout std_logic_vector (7 downto 0); 
             WingType_mosi_BL : inout std_logic_vector (7 downto 0); 
             WingType_mosi_BH : inout std_logic_vector (7 downto 0); 
             WingType_mosi_CL : inout std_logic_vector (7 downto 0); 
             WingType_mosi_AH : inout std_logic_vector (7 downto 0); 
             WingType_miso_CL : inout std_logic_vector (7 downto 0); 
             WingType_miso_CH : inout std_logic_vector (7 downto 0); 
             WingType_mosi_CH : inout std_logic_vector (7 downto 0); 
             WingType_mosi_AL : inout std_logic_vector (7 downto 0); 
             WingType_miso_AL : inout std_logic_vector (7 downto 0));
   end component;
   
   component Wing_GPIO
      port ( wt_miso : inout std_logic_vector (7 downto 0); 
             wt_mosi : inout std_logic_vector (7 downto 0));
   end component;
   
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
   
   component AUDIO_zpuino_wb_sid6581
      port ( clk_1MHZ     : in    std_logic; 
             audio_data   : out   std_logic_vector (17 downto 0); 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component AUDIO_zpuino_sa_sigmadeltaDAC
      port ( data_in   : in    std_logic_vector (17 downto 0); 
             audio_out : out   std_logic; 
             clk_96Mhz : in    std_logic);
   end component;
   
   component MISC_zpuino_sa_splitter2
      port ( in1  : in    std_logic; 
             out1 : out   std_logic; 
             out2 : out   std_logic);
   end component;
   
   component Wing_Audio
      port ( audio_left  : in    std_logic; 
             audio_right : in    std_logic; 
             wt_miso     : inout std_logic_vector (7 downto 0); 
             wt_mosi     : inout std_logic_vector (7 downto 0));
   end component;
   
begin
   XLXI_20 : Papilio_Wing_Pinout
      port map (gpio_bus_out(147 downto 0)=>XLXN_408(147 downto 0),
                gpio_bus_in(97 downto 0)=>XLXN_409(97 downto 0),
                WingType_miso_AH(7 downto 0)=>XLXN_333(7 downto 0),
                WingType_miso_AL(7 downto 0)=>XLXN_335(7 downto 0),
                WingType_miso_BH(7 downto 0)=>XLXN_329(7 downto 0),
                WingType_miso_BL(7 downto 0)=>XLXN_331(7 downto 0),
                WingType_miso_CH(7 downto 0)=>XLXN_452(7 downto 0),
                WingType_miso_CL(7 downto 0)=>XLXN_327(7 downto 0),
                WingType_mosi_AH(7 downto 0)=>XLXN_334(7 downto 0),
                WingType_mosi_AL(7 downto 0)=>XLXN_336(7 downto 0),
                WingType_mosi_BH(7 downto 0)=>XLXN_330(7 downto 0),
                WingType_mosi_BL(7 downto 0)=>XLXN_332(7 downto 0),
                WingType_mosi_CH(7 downto 0)=>XLXN_453(7 downto 0),
                WingType_mosi_CL(7 downto 0)=>XLXN_328(7 downto 0),
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
   
   XLXI_23 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_327(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_328(7 downto 0));
   
   XLXI_24 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_329(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_330(7 downto 0));
   
   XLXI_25 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_331(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_332(7 downto 0));
   
   XLXI_26 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_333(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_334(7 downto 0));
   
   XLXI_27 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_335(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_336(7 downto 0));
   
   XLXI_28 : ZPUino_Papilio_Pro_V1
      port map (CLK=>CLK,
                gpio_bus_in(97 downto 0)=>XLXN_409(97 downto 0),
                RXD=>RXD,
                SPI_MISO=>SPI_MISO,
                wishbone_slot_video_in(63 downto 
            0)=>XLXI_28_wishbone_slot_video_in_openSignal(63 downto 0),
                wishbone_slot_5_out(33 downto 0)=>XLXN_449(33 downto 0),
                wishbone_slot_6_out(33 downto 0)=>XLXN_445(33 downto 0),
                wishbone_slot_8_out(33 downto 0)=>XLXN_443(33 downto 0),
                wishbone_slot_9_out(33 downto 0)=>XLXN_441(33 downto 0),
                wishbone_slot_10_out(33 downto 0)=>XLXN_439(33 downto 0),
                wishbone_slot_11_out(33 downto 0)=>XLXN_437(33 downto 0),
                wishbone_slot_12_out(33 downto 0)=>XLXN_435(33 downto 0),
                wishbone_slot_13_out(33 downto 0)=>XLXN_433(33 downto 0),
                wishbone_slot_14_out(33 downto 0)=>XLXN_431(33 downto 0),
                clk_osc_32Mhz=>open,
                clk_1Mhz=>XLXN_464,
                clk_96Mhz=>XLXN_465,
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
                wishbone_slot_6_in(61 downto 0)=>XLXN_444(61 downto 0),
                wishbone_slot_8_in(61 downto 0)=>XLXN_442(61 downto 0),
                wishbone_slot_9_in(61 downto 0)=>XLXN_440(61 downto 0),
                wishbone_slot_10_in(61 downto 0)=>XLXN_438(61 downto 0),
                wishbone_slot_11_in(61 downto 0)=>XLXN_436(61 downto 0),
                wishbone_slot_12_in(61 downto 0)=>XLXN_434(61 downto 0),
                wishbone_slot_13_in(61 downto 0)=>XLXN_432(61 downto 0),
                wishbone_slot_14_in(61 downto 0)=>XLXN_430(61 downto 0),
                DRAM_DQ(15 downto 0)=>DRAM_DQ(15 downto 0),
                SPI_CS=>SPI_CS);
   
   XLXI_30 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_444(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_445(33 downto 0));
   
   XLXI_31 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_442(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_443(33 downto 0));
   
   XLXI_32 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_440(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_441(33 downto 0));
   
   XLXI_33 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_438(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_439(33 downto 0));
   
   XLXI_34 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_436(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_437(33 downto 0));
   
   XLXI_35 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_434(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_435(33 downto 0));
   
   XLXI_36 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_432(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_433(33 downto 0));
   
   XLXI_37 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_430(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_431(33 downto 0));
   
   XLXI_38 : AUDIO_zpuino_wb_sid6581
      port map (clk_1MHZ=>XLXN_464,
                wishbone_in(61 downto 0)=>XLXN_448(61 downto 0),
                audio_data(17 downto 0)=>XLXN_450(17 downto 0),
                wishbone_out(33 downto 0)=>XLXN_449(33 downto 0));
   
   XLXI_39 : AUDIO_zpuino_sa_sigmadeltaDAC
      port map (clk_96Mhz=>XLXN_465,
                data_in(17 downto 0)=>XLXN_450(17 downto 0),
                audio_out=>XLXN_451);
   
   XLXI_40 : MISC_zpuino_sa_splitter2
      port map (in1=>XLXN_451,
                out1=>XLXN_454,
                out2=>XLXN_455);
   
   XLXI_41 : Wing_Audio
      port map (audio_left=>XLXN_454,
                audio_right=>XLXN_455,
                wt_miso(7 downto 0)=>XLXN_452(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_453(7 downto 0));
   
end BEHAVIORAL;



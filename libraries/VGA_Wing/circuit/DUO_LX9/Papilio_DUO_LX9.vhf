--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.1
--  \   \         Application : sch2hdl
--  /   /         Filename : Papilio_DUO_LX9.vhf
-- /___/   /\     Timestamp : 12/02/2014 16:43:05
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/Benchy -sympath D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/Clocks -sympath D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/HQVGA -sympath D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/Papilio_Hardware -sympath D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/ZPUino_2 -sympath D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/ZPUino_Wishbone_Peripherals -sympath C:/Users/Jack/Documents/Arduino/libraries/TestLib -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/VGA_Wing/circuit/DUO_LX9/Papilio_DUO_LX9.vhf -w D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/VGA_Wing/circuit/Papilio_DUO_LX9.sch
--Design Name: Papilio_DUO_LX9
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

entity Papilio_DUO_LX9 is
   port ( DUO_SW1        : in    std_logic; 
          ext_pins_in    : in    std_logic_vector (100 downto 0); 
          ARD_RESET      : out   std_logic; 
          ext_pins_out   : out   std_logic_vector (100 downto 0); 
          Arduino_8      : inout std_logic; 
          Arduino_9      : inout std_logic; 
          Arduino_10     : inout std_logic; 
          Arduino_11     : inout std_logic; 
          Arduino_12     : inout std_logic; 
          Arduino_13     : inout std_logic; 
          Arduino_14     : inout std_logic; 
          Arduino_15     : inout std_logic; 
          Arduino_16     : inout std_logic; 
          Arduino_17     : inout std_logic; 
          Arduino_18     : inout std_logic; 
          Arduino_19     : inout std_logic; 
          Arduino_20     : inout std_logic; 
          Arduino_21     : inout std_logic; 
          Arduino_22     : inout std_logic; 
          Arduino_23     : inout std_logic; 
          Arduino_24     : inout std_logic; 
          Arduino_25     : inout std_logic; 
          Arduino_26     : inout std_logic; 
          Arduino_27     : inout std_logic; 
          Arduino_28     : inout std_logic; 
          Arduino_29     : inout std_logic; 
          Arduino_30     : inout std_logic; 
          Arduino_31     : inout std_logic; 
          Arduino_32     : inout std_logic; 
          Arduino_33     : inout std_logic; 
          Arduino_34     : inout std_logic; 
          Arduino_35     : inout std_logic; 
          Arduino_36     : inout std_logic; 
          Arduino_37     : inout std_logic; 
          Arduino_38     : inout std_logic; 
          Arduino_39     : inout std_logic; 
          Arduino_40     : inout std_logic; 
          Arduino_41     : inout std_logic; 
          Arduino_42     : inout std_logic; 
          Arduino_43     : inout std_logic; 
          Arduino_44     : inout std_logic; 
          Arduino_45     : inout std_logic; 
          Arduino_46     : inout std_logic; 
          Arduino_47     : inout std_logic; 
          Arduino_48     : inout std_logic; 
          Arduino_49     : inout std_logic; 
          Arduino_50     : inout std_logic; 
          Arduino_51     : inout std_logic; 
          Arduino_52     : inout std_logic; 
          Arduino_53     : inout std_logic; 
          ext_pins_inout : inout std_logic_vector (100 downto 0));
end Papilio_DUO_LX9;

architecture BEHAVIORAL of Papilio_DUO_LX9 is
   attribute BOX_TYPE   : string ;
   signal XLXN_325                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_326                                  : std_logic_vector (7 
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
   signal XLXN_448                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_449                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_457                                  : std_logic_vector (100 
         downto 0);
   signal XLXN_458                                  : std_logic_vector (100 
         downto 0);
   signal XLXN_459                                  : std_logic_vector (100 
         downto 0);
   signal XLXN_460                                  : std_logic_vector (100 
         downto 0);
   signal XLXN_461                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_462                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_463                                  : std_logic_vector (32 
         downto 0);
   signal XLXN_464                                  : std_logic;
   signal XLXN_465                                  : std_logic;
   signal XLXN_530                                  : std_logic_vector (200 
         downto 0);
   signal XLXN_531                                  : std_logic_vector (200 
         downto 0);
   signal XLXI_44_Flex_Pin_out_0_openSignal         : std_logic;
   signal XLXI_44_Flex_Pin_out_1_openSignal         : std_logic;
   signal XLXI_44_Flex_Pin_out_2_openSignal         : std_logic;
   signal XLXI_44_Flex_Pin_out_3_openSignal         : std_logic;
   signal XLXI_44_Flex_Pin_out_4_openSignal         : std_logic;
   signal XLXI_44_Flex_Pin_out_5_openSignal         : std_logic;
   signal XLXI_53_vga_blue0_openSignal              : std_logic;
   signal XLXI_53_vga_blue1_openSignal              : std_logic;
   signal XLXI_53_vga_green0_openSignal             : std_logic;
   signal XLXI_53_vga_green1_openSignal             : std_logic;
   signal XLXI_53_vga_hsync_openSignal              : std_logic;
   signal XLXI_53_vga_red0_openSignal               : std_logic;
   signal XLXI_53_vga_red1_openSignal               : std_logic;
   signal XLXI_53_vga_vsync_openSignal              : std_logic;
   signal XLXI_55_wishbone_slot_video_in_openSignal : std_logic_vector (100 
         downto 0);
   signal XLXI_55_wishbone_slot_5_out_openSignal    : std_logic_vector (100 
         downto 0);
   signal XLXI_55_wishbone_slot_6_out_openSignal    : std_logic_vector (100 
         downto 0);
   signal XLXI_55_wishbone_slot_8_out_openSignal    : std_logic_vector (100 
         downto 0);
   signal XLXI_55_wishbone_slot_11_out_openSignal   : std_logic_vector (100 
         downto 0);
   signal XLXI_55_wishbone_slot_12_out_openSignal   : std_logic_vector (100 
         downto 0);
   signal XLXI_55_wishbone_slot_13_out_openSignal   : std_logic_vector (100 
         downto 0);
   signal XLXI_55_wishbone_slot_14_out_openSignal   : std_logic_vector (100 
         downto 0);
   component Wing_GPIO
      port ( wt_miso : inout std_logic_vector (7 downto 0); 
             wt_mosi : inout std_logic_vector (7 downto 0));
   end component;
   
   component Papilio_DUO_Wing_Pinout
      port ( WING_AH0         : inout std_logic; 
             WING_AH1         : inout std_logic; 
             WING_AH2         : inout std_logic; 
             WING_AH3         : inout std_logic; 
             WING_AH4         : inout std_logic; 
             WING_AH5         : inout std_logic; 
             WING_AL0         : inout std_logic; 
             WING_AL1         : inout std_logic; 
             WING_AL2         : inout std_logic; 
             WING_AL3         : inout std_logic; 
             WING_AL4         : inout std_logic; 
             WING_AL5         : inout std_logic; 
             WING_BL0         : inout std_logic; 
             WING_BL1         : inout std_logic; 
             WING_BL2         : inout std_logic; 
             WING_BL3         : inout std_logic; 
             WING_BL4         : inout std_logic; 
             WING_BL5         : inout std_logic; 
             WING_BL6         : inout std_logic; 
             WING_BL7         : inout std_logic; 
             gpio_bus_out     : in    std_logic_vector (200 downto 0); 
             gpio_bus_in      : out   std_logic_vector (200 downto 0); 
             WingType_miso_BL : inout std_logic_vector (7 downto 0); 
             WingType_miso_AH : inout std_logic_vector (7 downto 0); 
             WingType_mosi_BL : inout std_logic_vector (7 downto 0); 
             WingType_mosi_AH : inout std_logic_vector (7 downto 0); 
             WingType_mosi_AL : inout std_logic_vector (7 downto 0); 
             WingType_miso_AL : inout std_logic_vector (7 downto 0); 
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
             WingType_mosi_CL : inout std_logic_vector (7 downto 0); 
             WingType_miso_CL : inout std_logic_vector (7 downto 0); 
             WingType_miso_CH : inout std_logic_vector (7 downto 0); 
             WingType_mosi_CH : inout std_logic_vector (7 downto 0); 
             WING_DL0         : inout std_logic; 
             WING_DL1         : inout std_logic; 
             WING_DL2         : inout std_logic; 
             WING_DL3         : inout std_logic; 
             WING_DL4         : inout std_logic; 
             WING_DL5         : inout std_logic; 
             WING_DL6         : inout std_logic; 
             WING_DL7         : inout std_logic; 
             WING_DH0         : inout std_logic; 
             WING_DH1         : inout std_logic; 
             WING_DH2         : inout std_logic; 
             WING_DH3         : inout std_logic; 
             WING_DH4         : inout std_logic; 
             WING_DH5         : inout std_logic; 
             WING_DH6         : inout std_logic; 
             WING_DH7         : inout std_logic; 
             WingType_mosi_DL : inout std_logic_vector (7 downto 0); 
             WingType_mosi_DH : inout std_logic_vector (7 downto 0); 
             WingType_miso_DH : inout std_logic_vector (7 downto 0); 
             WingType_miso_DL : inout std_logic_vector (7 downto 0); 
             WING_AL7         : inout std_logic; 
             WING_AL6         : inout std_logic; 
             Flex_Pin_out_0   : in    std_logic; 
             Flex_Pin_out_1   : in    std_logic; 
             Flex_Pin_out_2   : in    std_logic; 
             Flex_Pin_out_3   : in    std_logic; 
             Flex_Pin_out_4   : in    std_logic; 
             Flex_Pin_out_5   : in    std_logic; 
             Flex_Pin_in_0    : out   std_logic; 
             Flex_Pin_in_1    : out   std_logic; 
             Flex_Pin_in_2    : out   std_logic; 
             Flex_Pin_in_3    : out   std_logic; 
             Flex_Pin_in_4    : out   std_logic; 
             Flex_Pin_in_5    : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component HQVGA
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
             wishbone_in  : in    std_logic_vector (100 downto 0); 
             wishbone_out : out   std_logic_vector (100 downto 0); 
             VGA_Bus      : inout std_logic_vector (32 downto 0));
   end component;
   
   component HQVGA_char_ram_8x8_sp
      port ( wishbone_in  : in    std_logic_vector (100 downto 0); 
             wishbone_out : out   std_logic_vector (100 downto 0));
   end component;
   
   component Wing_VGA8
      port ( vga_hsync  : in    std_logic; 
             vga_vsync  : in    std_logic; 
             vga_red1   : in    std_logic; 
             vga_red0   : in    std_logic; 
             vga_green1 : in    std_logic; 
             vga_green0 : in    std_logic; 
             wt_miso    : inout std_logic_vector (7 downto 0); 
             wt_mosi    : inout std_logic_vector (7 downto 0); 
             vga_blue1  : in    std_logic; 
             vga_blue0  : in    std_logic; 
             VGA_Bus    : inout std_logic_vector (32 downto 0));
   end component;
   
   component clk_32to50_dcm
      port ( CLK_IN1  : in    std_logic; 
             CLK_OUT1 : out   std_logic);
   end component;
   
   component ZPUino_Papilio_DUO_V2
      port ( gpio_bus_out            : out   std_logic_vector (200 downto 0); 
             gpio_bus_in             : in    std_logic_vector (200 downto 0); 
             clk_96Mhz               : out   std_logic; 
             clk_1Mhz                : out   std_logic; 
             clk_osc_32Mhz           : out   std_logic; 
             wishbone_slot_5_out     : in    std_logic_vector (100 downto 0); 
             wishbone_slot_5_in      : out   std_logic_vector (100 downto 0); 
             wishbone_slot_6_in      : out   std_logic_vector (100 downto 0); 
             wishbone_slot_6_out     : in    std_logic_vector (100 downto 0); 
             wishbone_slot_8_in      : out   std_logic_vector (100 downto 0); 
             wishbone_slot_8_out     : in    std_logic_vector (100 downto 0); 
             wishbone_slot_9_in      : out   std_logic_vector (100 downto 0); 
             wishbone_slot_9_out     : in    std_logic_vector (100 downto 0); 
             wishbone_slot_10_in     : out   std_logic_vector (100 downto 0); 
             wishbone_slot_10_out    : in    std_logic_vector (100 downto 0); 
             wishbone_slot_11_in     : out   std_logic_vector (100 downto 0); 
             wishbone_slot_11_out    : in    std_logic_vector (100 downto 0); 
             wishbone_slot_12_in     : out   std_logic_vector (100 downto 0); 
             wishbone_slot_12_out    : in    std_logic_vector (100 downto 0); 
             wishbone_slot_13_in     : out   std_logic_vector (100 downto 0); 
             wishbone_slot_13_out    : in    std_logic_vector (100 downto 0); 
             wishbone_slot_14_in     : out   std_logic_vector (100 downto 0); 
             wishbone_slot_14_out    : in    std_logic_vector (100 downto 0); 
             wishbone_slot_video_in  : in    std_logic_vector (100 downto 0); 
             wishbone_slot_video_out : out   std_logic_vector (100 downto 0); 
             vgaclkout               : out   std_logic; 
             ext_pins_in             : in    std_logic_vector (100 downto 0); 
             ext_pins_out            : out   std_logic_vector (100 downto 0); 
             ext_pins_inout          : inout std_logic_vector (100 downto 0));
   end component;
   
begin
   XLXI_22 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_325(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_326(7 downto 0));
   
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
   
   XLXI_41 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_448(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_449(7 downto 0));
   
   XLXI_44 : Papilio_DUO_Wing_Pinout
      port map (Flex_Pin_out_0=>XLXI_44_Flex_Pin_out_0_openSignal,
                Flex_Pin_out_1=>XLXI_44_Flex_Pin_out_1_openSignal,
                Flex_Pin_out_2=>XLXI_44_Flex_Pin_out_2_openSignal,
                Flex_Pin_out_3=>XLXI_44_Flex_Pin_out_3_openSignal,
                Flex_Pin_out_4=>XLXI_44_Flex_Pin_out_4_openSignal,
                Flex_Pin_out_5=>XLXI_44_Flex_Pin_out_5_openSignal,
                gpio_bus_out(200 downto 0)=>XLXN_531(200 downto 0),
                Flex_Pin_in_0=>open,
                Flex_Pin_in_1=>open,
                Flex_Pin_in_2=>open,
                Flex_Pin_in_3=>open,
                Flex_Pin_in_4=>open,
                Flex_Pin_in_5=>open,
                gpio_bus_in(200 downto 0)=>XLXN_530(200 downto 0),
                WingType_miso_AH(7 downto 0)=>XLXN_333(7 downto 0),
                WingType_miso_AL(7 downto 0)=>XLXN_335(7 downto 0),
                WingType_miso_BL(7 downto 0)=>XLXN_331(7 downto 0),
                WingType_miso_CH(7 downto 0)=>XLXN_461(7 downto 0),
                WingType_miso_CL(7 downto 0)=>XLXN_329(7 downto 0),
                WingType_miso_DH(7 downto 0)=>XLXN_448(7 downto 0),
                WingType_miso_DL(7 downto 0)=>XLXN_325(7 downto 0),
                WingType_mosi_AH(7 downto 0)=>XLXN_334(7 downto 0),
                WingType_mosi_AL(7 downto 0)=>XLXN_336(7 downto 0),
                WingType_mosi_BL(7 downto 0)=>XLXN_332(7 downto 0),
                WingType_mosi_CH(7 downto 0)=>XLXN_462(7 downto 0),
                WingType_mosi_CL(7 downto 0)=>XLXN_330(7 downto 0),
                WingType_mosi_DH(7 downto 0)=>XLXN_449(7 downto 0),
                WingType_mosi_DL(7 downto 0)=>XLXN_326(7 downto 0),
                WING_AH0=>Arduino_8,
                WING_AH1=>Arduino_9,
                WING_AH2=>Arduino_10,
                WING_AH3=>Arduino_11,
                WING_AH4=>Arduino_12,
                WING_AH5=>Arduino_13,
                WING_AL0=>open,
                WING_AL1=>open,
                WING_AL2=>open,
                WING_AL3=>open,
                WING_AL4=>open,
                WING_AL5=>open,
                WING_AL6=>open,
                WING_AL7=>open,
                WING_BL0=>Arduino_21,
                WING_BL1=>Arduino_20,
                WING_BL2=>Arduino_19,
                WING_BL3=>Arduino_18,
                WING_BL4=>Arduino_17,
                WING_BL5=>Arduino_16,
                WING_BL6=>Arduino_15,
                WING_BL7=>Arduino_14,
                WING_CH0=>Arduino_38,
                WING_CH1=>Arduino_40,
                WING_CH2=>Arduino_42,
                WING_CH3=>Arduino_44,
                WING_CH4=>Arduino_46,
                WING_CH5=>Arduino_48,
                WING_CH6=>Arduino_50,
                WING_CH7=>Arduino_52,
                WING_CL0=>Arduino_22,
                WING_CL1=>Arduino_24,
                WING_CL2=>Arduino_26,
                WING_CL3=>Arduino_28,
                WING_CL4=>Arduino_30,
                WING_CL5=>Arduino_32,
                WING_CL6=>Arduino_34,
                WING_CL7=>Arduino_36,
                WING_DH0=>Arduino_37,
                WING_DH1=>Arduino_35,
                WING_DH2=>Arduino_33,
                WING_DH3=>Arduino_31,
                WING_DH4=>Arduino_29,
                WING_DH5=>Arduino_27,
                WING_DH6=>Arduino_25,
                WING_DH7=>Arduino_23,
                WING_DL0=>Arduino_53,
                WING_DL1=>Arduino_51,
                WING_DL2=>Arduino_49,
                WING_DL3=>Arduino_47,
                WING_DL4=>Arduino_45,
                WING_DL5=>Arduino_43,
                WING_DL6=>Arduino_41,
                WING_DL7=>Arduino_39);
   
   XLXI_48 : INV
      port map (I=>DUO_SW1,
                O=>ARD_RESET);
   
   XLXI_51 : HQVGA
      port map (clk_50Mhz=>XLXN_464,
                wishbone_in(100 downto 0)=>XLXN_457(100 downto 0),
                vga_b0=>open,
                vga_b1=>open,
                vga_g0=>open,
                vga_g1=>open,
                vga_g2=>open,
                vga_hsync=>open,
                vga_r0=>open,
                vga_r1=>open,
                vga_r2=>open,
                vga_vsync=>open,
                wishbone_out(100 downto 0)=>XLXN_458(100 downto 0),
                VGA_Bus(32 downto 0)=>XLXN_463(32 downto 0));
   
   XLXI_52 : HQVGA_char_ram_8x8_sp
      port map (wishbone_in(100 downto 0)=>XLXN_459(100 downto 0),
                wishbone_out(100 downto 0)=>XLXN_460(100 downto 0));
   
   XLXI_53 : Wing_VGA8
      port map (vga_blue0=>XLXI_53_vga_blue0_openSignal,
                vga_blue1=>XLXI_53_vga_blue1_openSignal,
                vga_green0=>XLXI_53_vga_green0_openSignal,
                vga_green1=>XLXI_53_vga_green1_openSignal,
                vga_hsync=>XLXI_53_vga_hsync_openSignal,
                vga_red0=>XLXI_53_vga_red0_openSignal,
                vga_red1=>XLXI_53_vga_red1_openSignal,
                vga_vsync=>XLXI_53_vga_vsync_openSignal,
                VGA_Bus(32 downto 0)=>XLXN_463(32 downto 0),
                wt_miso(7 downto 0)=>XLXN_461(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_462(7 downto 0));
   
   XLXI_54 : clk_32to50_dcm
      port map (CLK_IN1=>XLXN_465,
                CLK_OUT1=>XLXN_464);
   
   XLXI_55 : ZPUino_Papilio_DUO_V2
      port map (ext_pins_in(100 downto 0)=>ext_pins_in(100 downto 0),
                gpio_bus_in(200 downto 0)=>XLXN_530(200 downto 0),
                wishbone_slot_video_in(100 downto 
            0)=>XLXI_55_wishbone_slot_video_in_openSignal(100 downto 0),
                wishbone_slot_5_out(100 downto 
            0)=>XLXI_55_wishbone_slot_5_out_openSignal(100 downto 0),
                wishbone_slot_6_out(100 downto 
            0)=>XLXI_55_wishbone_slot_6_out_openSignal(100 downto 0),
                wishbone_slot_8_out(100 downto 
            0)=>XLXI_55_wishbone_slot_8_out_openSignal(100 downto 0),
                wishbone_slot_9_out(100 downto 0)=>XLXN_458(100 downto 0),
                wishbone_slot_10_out(100 downto 0)=>XLXN_460(100 downto 0),
                wishbone_slot_11_out(100 downto 
            0)=>XLXI_55_wishbone_slot_11_out_openSignal(100 downto 0),
                wishbone_slot_12_out(100 downto 
            0)=>XLXI_55_wishbone_slot_12_out_openSignal(100 downto 0),
                wishbone_slot_13_out(100 downto 
            0)=>XLXI_55_wishbone_slot_13_out_openSignal(100 downto 0),
                wishbone_slot_14_out(100 downto 
            0)=>XLXI_55_wishbone_slot_14_out_openSignal(100 downto 0),
                clk_osc_32Mhz=>XLXN_465,
                clk_1Mhz=>open,
                clk_96Mhz=>open,
                ext_pins_out(100 downto 0)=>ext_pins_out(100 downto 0),
                gpio_bus_out(200 downto 0)=>XLXN_531(200 downto 0),
                vgaclkout=>open,
                wishbone_slot_video_out=>open,
                wishbone_slot_5_in=>open,
                wishbone_slot_6_in=>open,
                wishbone_slot_8_in=>open,
                wishbone_slot_9_in(100 downto 0)=>XLXN_457(100 downto 0),
                wishbone_slot_10_in(100 downto 0)=>XLXN_459(100 downto 0),
                wishbone_slot_11_in=>open,
                wishbone_slot_12_in=>open,
                wishbone_slot_13_in=>open,
                wishbone_slot_14_in=>open,
                ext_pins_inout(100 downto 0)=>ext_pins_inout(100 downto 0));
   
end BEHAVIORAL;



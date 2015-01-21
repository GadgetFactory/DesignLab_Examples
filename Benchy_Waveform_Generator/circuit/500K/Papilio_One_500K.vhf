--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.1
--  \   \         Application : sch2hdl
--  /   /         Filename : Papilio_One_500K.vhf
-- /___/   /\     Timestamp : 12/01/2014 19:22:51
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/Benchy -sympath D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/Clocks -sympath D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/HQVGA -sympath D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/Papilio_Hardware -sympath D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/ZPUino_1 -sympath D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/ZPUino_2 -sympath D:/Dropbox/GadgetFactory_Engineering/DesignLab/build/windows/work/libraries/ZPUino_Wishbone_Peripherals -intstyle ise -family spartan3e -flat -suppress -vhdl D:/Dropbox/GadgetFactory_Engineering/DesignLab_Examples/Benchy_Waveform_Generator/circuit/500K/Papilio_One_500K.vhf -w D:/Dropbox/GadgetFactory_Engineering/DesignLab_Examples/Benchy_Waveform_Generator/circuit/Papilio_One_500K.sch
--Design Name: Papilio_One_500K
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Papilio_One_500K is
   port ( ext_pins_in    : in    std_logic_vector (100 downto 0); 
          ext_pins_out   : out   std_logic_vector (100 downto 0); 
          WING_CL0       : out   std_logic; 
          WING_CL1       : out   std_logic; 
          WING_CL2       : out   std_logic; 
          ext_pins_inout : inout std_logic_vector (100 downto 0); 
          WING_AH0       : inout std_logic; 
          WING_AH1       : inout std_logic; 
          WING_AH2       : inout std_logic; 
          WING_AH3       : inout std_logic; 
          WING_AH4       : inout std_logic; 
          WING_AH5       : inout std_logic; 
          WING_AH6       : inout std_logic; 
          WING_AH7       : inout std_logic; 
          WING_AL0       : inout std_logic; 
          WING_AL1       : inout std_logic; 
          WING_AL2       : inout std_logic; 
          WING_AL3       : inout std_logic; 
          WING_AL4       : inout std_logic; 
          WING_AL5       : inout std_logic; 
          WING_AL6       : inout std_logic; 
          WING_AL7       : inout std_logic; 
          WING_BH0       : inout std_logic; 
          WING_BH1       : inout std_logic; 
          WING_BH2       : inout std_logic; 
          WING_BH3       : inout std_logic; 
          WING_BH4       : inout std_logic; 
          WING_BH5       : inout std_logic; 
          WING_BH6       : inout std_logic; 
          WING_BH7       : inout std_logic; 
          WING_BL0       : inout std_logic; 
          WING_BL1       : inout std_logic; 
          WING_BL2       : inout std_logic; 
          WING_BL3       : inout std_logic; 
          WING_BL4       : inout std_logic; 
          WING_BL5       : inout std_logic; 
          WING_BL6       : inout std_logic; 
          WING_BL7       : inout std_logic; 
          WING_CH0       : inout std_logic; 
          WING_CH1       : inout std_logic; 
          WING_CH2       : inout std_logic; 
          WING_CH3       : inout std_logic; 
          WING_CH4       : inout std_logic; 
          WING_CH5       : inout std_logic; 
          WING_CH6       : inout std_logic; 
          WING_CH7       : inout std_logic; 
          WING_CL3       : inout std_logic; 
          WING_CL4       : inout std_logic; 
          WING_CL5       : inout std_logic; 
          WING_CL6       : inout std_logic; 
          WING_CL7       : inout std_logic);
end Papilio_One_500K;

architecture BEHAVIORAL of Papilio_One_500K is
   signal XLXN_408                                  : std_logic_vector (200 
         downto 0);
   signal XLXN_409                                  : std_logic_vector (200 
         downto 0);
   signal XLXN_466                                  : std_logic;
   signal XLXN_475                                  : std_logic;
   signal XLXN_498                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_499                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_500                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_501                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_502                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_503                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_504                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_505                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_506                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_507                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_508                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_509                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_513                                  : std_logic_vector (100 
         downto 0);
   signal XLXN_514                                  : std_logic_vector (100 
         downto 0);
   signal XLXI_62_Flex_Pin_out_0_openSignal         : std_logic;
   signal XLXI_62_Flex_Pin_out_1_openSignal         : std_logic;
   signal XLXI_62_Flex_Pin_out_2_openSignal         : std_logic;
   signal XLXI_62_Flex_Pin_out_3_openSignal         : std_logic;
   signal XLXI_62_Flex_Pin_out_4_openSignal         : std_logic;
   signal XLXI_62_Flex_Pin_out_5_openSignal         : std_logic;
   signal XLXI_70_wishbone_slot_video_in_openSignal : std_logic_vector (100 
         downto 0);
   signal XLXI_70_wishbone_slot_6_out_openSignal    : std_logic_vector (100 
         downto 0);
   signal XLXI_70_wishbone_slot_8_out_openSignal    : std_logic_vector (100 
         downto 0);
   signal XLXI_70_wishbone_slot_9_out_openSignal    : std_logic_vector (100 
         downto 0);
   signal XLXI_70_wishbone_slot_10_out_openSignal   : std_logic_vector (100 
         downto 0);
   signal XLXI_70_wishbone_slot_11_out_openSignal   : std_logic_vector (100 
         downto 0);
   signal XLXI_70_wishbone_slot_12_out_openSignal   : std_logic_vector (100 
         downto 0);
   signal XLXI_70_wishbone_slot_13_out_openSignal   : std_logic_vector (100 
         downto 0);
   signal XLXI_70_wishbone_slot_14_out_openSignal   : std_logic_vector (100 
         downto 0);
   component BENCHY_zpuino_wb_waveform_generator
      port ( saw_out      : out   std_logic_vector (11 downto 0); 
             sin_out      : out   std_logic_vector (11 downto 0); 
             cos_out      : out   std_logic_vector (11 downto 0); 
             saw_dac_out  : out   std_logic; 
             sin_dac_out  : out   std_logic; 
             cos_dac_out  : out   std_logic; 
             clk_in       : in    std_logic; 
             wishbone_in  : in    std_logic_vector (100 downto 0); 
             wishbone_out : out   std_logic_vector (100 downto 0));
   end component;
   
   component clk_32to288_dcm
      port ( CLK_IN1  : in    std_logic; 
             CLK_OUT1 : out   std_logic);
   end component;
   
   component Papilio_Default_Wing_Pinout
      port ( WING_AH0         : inout std_logic; 
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
             gpio_bus_out     : in    std_logic_vector (200 downto 0); 
             gpio_bus_in      : out   std_logic_vector (200 downto 0); 
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
             WingType_miso_AL : inout std_logic_vector (7 downto 0); 
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
   
   component Wing_GPIO
      port ( wt_miso : inout std_logic_vector (7 downto 0); 
             wt_mosi : inout std_logic_vector (7 downto 0));
   end component;
   
   component ZPUino_Papilio_One_500K_V2
      port ( clk_96Mhz               : out   std_logic; 
             clk_1Mhz                : out   std_logic; 
             clk_osc_32Mhz           : out   std_logic; 
             ext_pins_in             : in    std_logic_vector (100 downto 0); 
             ext_pins_out            : out   std_logic_vector (100 downto 0); 
             ext_pins_inout          : inout std_logic_vector (100 downto 0); 
             gpio_bus_out            : out   std_logic_vector (200 downto 0); 
             gpio_bus_in             : in    std_logic_vector (200 downto 0); 
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
             vgaclkout               : out   std_logic);
   end component;
   
begin
   XLXI_48 : BENCHY_zpuino_wb_waveform_generator
      port map (clk_in=>XLXN_475,
                wishbone_in(100 downto 0)=>XLXN_513(100 downto 0),
                cos_dac_out=>WING_CL1,
                cos_out=>open,
                saw_dac_out=>WING_CL2,
                saw_out=>open,
                sin_dac_out=>WING_CL0,
                sin_out=>open,
                wishbone_out(100 downto 0)=>XLXN_514(100 downto 0));
   
   XLXI_52 : clk_32to288_dcm
      port map (CLK_IN1=>XLXN_466,
                CLK_OUT1=>XLXN_475);
   
   XLXI_62 : Papilio_Default_Wing_Pinout
      port map (Flex_Pin_out_0=>XLXI_62_Flex_Pin_out_0_openSignal,
                Flex_Pin_out_1=>XLXI_62_Flex_Pin_out_1_openSignal,
                Flex_Pin_out_2=>XLXI_62_Flex_Pin_out_2_openSignal,
                Flex_Pin_out_3=>XLXI_62_Flex_Pin_out_3_openSignal,
                Flex_Pin_out_4=>XLXI_62_Flex_Pin_out_4_openSignal,
                Flex_Pin_out_5=>XLXI_62_Flex_Pin_out_5_openSignal,
                gpio_bus_out(200 downto 0)=>XLXN_408(200 downto 0),
                Flex_Pin_in_0=>open,
                Flex_Pin_in_1=>open,
                Flex_Pin_in_2=>open,
                Flex_Pin_in_3=>open,
                Flex_Pin_in_4=>open,
                Flex_Pin_in_5=>open,
                gpio_bus_in(200 downto 0)=>XLXN_409(200 downto 0),
                WingType_miso_AH(7 downto 0)=>XLXN_500(7 downto 0),
                WingType_miso_AL(7 downto 0)=>XLXN_498(7 downto 0),
                WingType_miso_BH(7 downto 0)=>XLXN_504(7 downto 0),
                WingType_miso_BL(7 downto 0)=>XLXN_502(7 downto 0),
                WingType_miso_CH(7 downto 0)=>XLXN_508(7 downto 0),
                WingType_miso_CL(7 downto 0)=>XLXN_506(7 downto 0),
                WingType_mosi_AH(7 downto 0)=>XLXN_501(7 downto 0),
                WingType_mosi_AL(7 downto 0)=>XLXN_499(7 downto 0),
                WingType_mosi_BH(7 downto 0)=>XLXN_505(7 downto 0),
                WingType_mosi_BL(7 downto 0)=>XLXN_503(7 downto 0),
                WingType_mosi_CH(7 downto 0)=>XLXN_509(7 downto 0),
                WingType_mosi_CL(7 downto 0)=>XLXN_507(7 downto 0),
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
                WING_CL0=>open,
                WING_CL1=>open,
                WING_CL2=>open,
                WING_CL3=>WING_CL3,
                WING_CL4=>WING_CL4,
                WING_CL5=>WING_CL5,
                WING_CL6=>WING_CL6,
                WING_CL7=>WING_CL7);
   
   XLXI_63 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_498(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_499(7 downto 0));
   
   XLXI_64 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_500(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_501(7 downto 0));
   
   XLXI_66 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_502(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_503(7 downto 0));
   
   XLXI_67 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_504(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_505(7 downto 0));
   
   XLXI_68 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_506(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_507(7 downto 0));
   
   XLXI_69 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_508(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_509(7 downto 0));
   
   XLXI_70 : ZPUino_Papilio_One_500K_V2
      port map (ext_pins_in(100 downto 0)=>ext_pins_in(100 downto 0),
                gpio_bus_in(200 downto 0)=>XLXN_409(200 downto 0),
                wishbone_slot_video_in(100 downto 
            0)=>XLXI_70_wishbone_slot_video_in_openSignal(100 downto 0),
                wishbone_slot_5_out(100 downto 0)=>XLXN_514(100 downto 0),
                wishbone_slot_6_out(100 downto 
            0)=>XLXI_70_wishbone_slot_6_out_openSignal(100 downto 0),
                wishbone_slot_8_out(100 downto 
            0)=>XLXI_70_wishbone_slot_8_out_openSignal(100 downto 0),
                wishbone_slot_9_out(100 downto 
            0)=>XLXI_70_wishbone_slot_9_out_openSignal(100 downto 0),
                wishbone_slot_10_out(100 downto 
            0)=>XLXI_70_wishbone_slot_10_out_openSignal(100 downto 0),
                wishbone_slot_11_out(100 downto 
            0)=>XLXI_70_wishbone_slot_11_out_openSignal(100 downto 0),
                wishbone_slot_12_out(100 downto 
            0)=>XLXI_70_wishbone_slot_12_out_openSignal(100 downto 0),
                wishbone_slot_13_out(100 downto 
            0)=>XLXI_70_wishbone_slot_13_out_openSignal(100 downto 0),
                wishbone_slot_14_out(100 downto 
            0)=>XLXI_70_wishbone_slot_14_out_openSignal(100 downto 0),
                clk_osc_32Mhz=>XLXN_466,
                clk_1Mhz=>open,
                clk_96Mhz=>open,
                ext_pins_out(100 downto 0)=>ext_pins_out(100 downto 0),
                gpio_bus_out(200 downto 0)=>XLXN_408(200 downto 0),
                vgaclkout=>open,
                wishbone_slot_video_out=>open,
                wishbone_slot_5_in(100 downto 0)=>XLXN_513(100 downto 0),
                wishbone_slot_6_in=>open,
                wishbone_slot_8_in=>open,
                wishbone_slot_9_in=>open,
                wishbone_slot_10_in=>open,
                wishbone_slot_11_in=>open,
                wishbone_slot_12_in=>open,
                wishbone_slot_13_in=>open,
                wishbone_slot_14_in=>open,
                ext_pins_inout(100 downto 0)=>ext_pins_inout(100 downto 0));
   
end BEHAVIORAL;



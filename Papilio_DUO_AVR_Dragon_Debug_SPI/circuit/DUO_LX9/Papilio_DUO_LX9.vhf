--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Papilio_DUO_LX9.vhf
-- /___/   /\     Timestamp : 08/28/2014 17:28:24
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Papilio_DUO_AVR_Dragon_Debug_SPI/DUO_LX9/Papilio_DUO_LX9.vhf -w D:/Dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Papilio_DUO_AVR_Dragon_Debug_SPI/Papilio_DUO_LX9.sch
--Design Name: Papilio_DUO_LX9
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL OBUF4_HXILINX_Papilio_DUO_LX9 -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OBUF4_HXILINX_Papilio_DUO_LX9 is
  
port(
    O0  : out std_logic;
    O1  : out std_logic;
    O2  : out std_logic;
    O3  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic
  );
end OBUF4_HXILINX_Papilio_DUO_LX9;

architecture OBUF4_HXILINX_Papilio_DUO_LX9_V of OBUF4_HXILINX_Papilio_DUO_LX9 is
begin

  O0 <= I0;
  O1 <= I1;
  O2 <= I2;
  O3 <= I3;

end OBUF4_HXILINX_Papilio_DUO_LX9_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Papilio_DUO_LX9 is
   port ( ARD_SPI_MISO     : in    std_logic; 
          DRAGON_SPI_MOSI  : in    std_logic; 
          DRAGON_SPI_RESET : in    std_logic; 
          DRAGON_SPI_SCK   : in    std_logic; 
          ARD_RESET        : out   std_logic; 
          ARD_SPI_MOSI     : out   std_logic; 
          ARD_SPI_SCLK     : out   std_logic; 
          DRAGON_SPI_GND   : out   std_logic; 
          DRAGON_SPI_MISO  : out   std_logic; 
          DRAGON_SPI_VTG   : out   std_logic);
end Papilio_DUO_LX9;

architecture BEHAVIORAL of Papilio_DUO_LX9 is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal ARD_RESET_DUMMY  : std_logic;
   component OBUF4_HXILINX_Papilio_DUO_LX9
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O0 : out   std_logic; 
             O1 : out   std_logic; 
             O2 : out   std_logic; 
             O3 : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component PULLUP
      port ( O : out   std_logic);
   end component;
   attribute BOX_TYPE of PULLUP : component is "BLACK_BOX";
   
   attribute HU_SET of JTAG_SPI_OBUF : label is "JTAG_SPI_OBUF_0";
begin
   ARD_RESET <= ARD_RESET_DUMMY;
   JTAG_SPI_OBUF : OBUF4_HXILINX_Papilio_DUO_LX9
      port map (I0=>DRAGON_SPI_RESET,
                I1=>DRAGON_SPI_MOSI,
                I2=>DRAGON_SPI_SCK,
                I3=>ARD_SPI_MISO,
                O0=>ARD_RESET_DUMMY,
                O1=>ARD_SPI_MOSI,
                O2=>ARD_SPI_SCLK,
                O3=>DRAGON_SPI_MISO);
   
   XLXI_93 : GND
      port map (G=>DRAGON_SPI_GND);
   
   XLXI_100 : VCC
      port map (P=>DRAGON_SPI_VTG);
   
   XLXI_103 : PULLUP
      port map (O=>ARD_RESET_DUMMY);
   
end BEHAVIORAL;



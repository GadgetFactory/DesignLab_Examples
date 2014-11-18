--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Papilio_DUO_LX9.vhf
-- /___/   /\     Timestamp : 08/29/2014 10:30:25
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Papilio_DUO_happyjtag2/DUO_LX9/Papilio_DUO_LX9.vhf -w D:/Dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Papilio_DUO_happyjtag2/Papilio_DUO_LX9.sch
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
   port ( ARD_JTAG_TDO  : in    std_logic; 
          BD0_MPSSE_TCK : in    std_logic; 
          BD1_MPSSE_TDI : in    std_logic; 
          BD3_MPSSE_TMS : in    std_logic; 
          BD4_MPSSE_DTR : in    std_logic; 
          ARD_JTAG_TCK  : out   std_logic; 
          ARD_JTAG_TDI  : out   std_logic; 
          ARD_JTAG_TMS  : out   std_logic; 
          ARD_RESET     : out   std_logic; 
          BD2_MPSSE_TDO : out   std_logic);
end Papilio_DUO_LX9;

architecture BEHAVIORAL of Papilio_DUO_LX9 is
   attribute HU_SET     : string ;
   attribute IOSTANDARD : string ;
   attribute SLEW       : string ;
   attribute DRIVE      : string ;
   attribute BOX_TYPE   : string ;
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
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_45 : label is "XLXI_45_0";
begin
   XLXI_45 : OBUF4_HXILINX_Papilio_DUO_LX9
      port map (I0=>BD0_MPSSE_TCK,
                I1=>BD1_MPSSE_TDI,
                I2=>ARD_JTAG_TDO,
                I3=>BD3_MPSSE_TMS,
                O0=>ARD_JTAG_TCK,
                O1=>ARD_JTAG_TDI,
                O2=>BD2_MPSSE_TDO,
                O3=>ARD_JTAG_TMS);
   
   XLXI_46 : OBUF
      port map (I=>BD4_MPSSE_DTR,
                O=>ARD_RESET);
   
end BEHAVIORAL;



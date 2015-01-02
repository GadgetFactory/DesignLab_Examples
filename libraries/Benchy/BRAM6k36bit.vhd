----------------------------------------------------------------------------------
-- BRAM8k32bit.vhd
--
-- Copyright (C) 2007 Jonas Diemer
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
-- Single Ported RAM, 32bit wide, 8k deep.
-- 
-- Instantiates 16 BRAM, each being 8k deep and 2 bit wide. These are
-- concatenated to form a 32bit wide, 8k deep RAM.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity BRAM6k36bit is
    Port ( CLK : in  STD_LOGIC;
           ADDR : in  STD_LOGIC_VECTOR (12 downto 0);
           WE : in  STD_LOGIC;
           DOUT : out  STD_LOGIC_VECTOR (35 downto 0);
           DIN : in  STD_LOGIC_VECTOR (35 downto 0));
end BRAM6k36bit;

architecture Behavioral of BRAM6k36bit is

	type   RAMBlDOut_Type is array(2**(ADDR'length-9)-1 downto 0) of  std_logic_vector(dout'range);
	signal RAMBlDOut     : RAMBlDOut_Type;

	--signal WEB     : std_logic_vector(2**(ADDR'length-9)-1 downto 0);
	signal WEB     : std_logic_vector(11 downto 0);
begin


--	BlockRAMS: for i in 0 to 11 generate
--   RAMB16_S2_inst : RAMB16_S2
--   generic map (
--      INIT => X"0", --  Value of output RAM registers at startup
--      SRVAL => X"0", --  Ouput value upon SSR assertion
--      WRITE_MODE => "WRITE_FIRST" --  WRITE_FIRST, READ_FIRST or NO_CHANGE
--      )
--   port map (
--      DO => DOUT(2*i+1 downto 2*i),      -- 2-bit Data Output
--      ADDR => ADDR,  -- 13-bit Address Input
--      CLK => CLK,    -- Clock
--      DI => DIN(2*i+1 downto 2*i),      -- 2-bit Data Input
--      EN => '1',      -- RAM Enable Input
--      SSR => '0',    -- Synchronous Set/Reset Input
--      WE => WE       -- Write Enable Input
--   );
--	end generate;

	BlockRAMS: for i in 0 to 11 generate
   RAMB16_S36_inst : RAMB16_S36
   generic map (
      INIT => X"0", --  Value of output RAM registers at startup
      SRVAL => X"0", --  Ouput value upon SSR assertion
      WRITE_MODE => "WRITE_FIRST" --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      )
   port map (
      DO => RAMBlDOut(i)(31 downto 0),
		DOP => RAMBlDOut(i)(35 downto 32),
      ADDR => ADDR(8 downto 0),  -- 8-bit Address Input
      CLK => CLK,    -- Clock
      DI => DIN(31 downto 0),  
		DIP => DIN(35 downto 32),
      EN => '1',      -- RAM Enable Input
      SSR => '0',    -- Synchronous Set/Reset Input
      WE => WEB(i)       -- Write Enable Input
   );
	end generate;
	
WEB_Dcd:for i in WEB'range generate 
 WEB(i) <= '1' when (we='1' and ADDR(ADDR'high downto 9)=i) else '0';
end generate ;	

dout <= RAMBlDOut(CONV_INTEGER(ADDR(ADDR'high downto 9)));

end Behavioral;


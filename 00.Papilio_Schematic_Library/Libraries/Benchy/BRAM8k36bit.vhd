--
--  Generic dual-port RAM (symmetric)
-- 
--  Copyright 2011 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--

library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_unsigned.all; 
use ieee.numeric_std.all;

entity BRAM8k36bit is
  generic (
    address_bits: integer := 13;
    data_bits: integer := 36
  );
  port (
    clka:             in std_logic;
--    ena:              in std_logic;
    wea:              in std_logic;
    addra:            in std_logic_vector(address_bits-1 downto 0);
    dina:              in std_logic_vector(data_bits-1 downto 0);
    douta:              out std_logic_vector(data_bits-1 downto 0)
  );

end entity BRAM8k36bit;

architecture behave of BRAM8k36bit is


  subtype RAM_WORD is STD_LOGIC_VECTOR (data_bits-1 downto 0);

  type RAM_TABLE is array (0 to (2**address_bits) - 1) of RAM_WORD;
  shared variable RAM: RAM_TABLE;
  signal ena : std_logic;

begin
  ena <= '1';
  process (clka)
  begin
    if rising_edge(clka) then
      if ena='1' then
        if wea='1' then
          RAM( conv_integer(addra) ) := dina;
        end if;
        douta <= RAM(conv_integer(addra)) ;
      end if;
    end if;
  end process;

end behave; 

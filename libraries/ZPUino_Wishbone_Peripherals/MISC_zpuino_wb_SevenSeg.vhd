--
--  7 segment driver for ZPUINO
-- 
--  Copyright 2010 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  Version: 1.0
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library board;
use board.zpu_config.all;
use board.zpupkg.all;
use board.zpuinopkg.all;

entity MISC_zpuino_wb_SevenSeg is
  generic (
    BITS: integer := 2;
    EXTRASIZE: integer := 32;
    FREQ_PER_DISPLAY:  integer := 120;
    MHZ:  integer := 96;
    INVERT: boolean := true
  );
  port (
	 wishbone_in : in std_logic_vector(100 downto 0);
	 wishbone_out : out std_logic_vector(100 downto 0);

    segdata:  out std_logic_vector(6 downto 0);
    dot:      out std_logic;
    extra:    out std_logic_vector(EXTRASIZE-1 downto 0);
    enable:   out std_logic_vector((2**BITS)-1 downto 0)
  );
end entity MISC_zpuino_wb_SevenSeg;

architecture behave of MISC_zpuino_wb_SevenSeg is

  -- Timer
  constant COUNT: integer := 2**BITS;
  constant DELAY: integer := (MHZ*1000000 / (FREQ_PER_DISPLAY*COUNT*16)) - 1;   -- 16 is for brightness control

  signal counter: integer range 0 to DELAY;

  signal enabled: std_logic_vector(COUNT-1 downto 0) := (others => '0');

  subtype segvaltype is std_logic_vector(7 downto 0);
  type segstype is array(COUNT-1 downto 0) of segvaltype;

  signal segs: segstype;
  signal current_display: integer range 0 to COUNT-1;  -- same as enashift
  signal ack_q: std_logic;
  signal extra_q:    std_logic_vector(EXTRASIZE-1 downto 0);

  signal brightctl: unsigned(3 downto 0);
  signal brightcount: unsigned(3 downto 0);
  signal pwm: std_logic;

  signal invsig: std_logic;
  
  signal  wb_clk_i:    std_logic;                     -- Wishbone clock
  signal  wb_rst_i:    std_logic;                     -- Wishbone reset (synchronous)
  signal  wb_dat_i:    std_logic_vector(31 downto 0); -- Wishbone data input  (32 bits)
  signal  wb_adr_i:    std_logic_vector(26 downto 2); -- Wishbone address input  (32 bits)
  signal  wb_we_i:     std_logic;                     -- Wishbone write enable signal
  signal  wb_cyc_i:    std_logic;                     -- Wishbone cycle signal
  signal  wb_stb_i:    std_logic;                     -- Wishbone strobe signal  

  signal  wb_dat_o:    std_logic_vector(31 downto 0); -- Wishbone data output (32 bits)
  signal  wb_ack_o:    std_logic;                      -- Wishbone acknowledge out signal
  signal  wb_inta_o:   std_logic;  

begin
-- Unpack the wishbone array into signals so the modules code is not confusing.
  wb_clk_i <= wishbone_in(61);
  wb_rst_i <= wishbone_in(60);
  wb_dat_i <= wishbone_in(59 downto 28);
  wb_adr_i <= wishbone_in(27 downto 3);
  wb_we_i <= wishbone_in(2);
  wb_cyc_i <= wishbone_in(1);
  wb_stb_i <= wishbone_in(0); 
  
  wishbone_out(49 downto 34) <= x"08" & x"16"; -- Vendor: ZPUino  Product: Seven Segment Display Driver
  wishbone_out(33 downto 2) <= wb_dat_o;
  wishbone_out(1) <= wb_ack_o;
  wishbone_out(0) <= wb_inta_o;
-- Finish unpacking Wishbone signals.

  invsig <= '1' when INVERT=true else '0';

  enloop: for i in 0 to COUNT-1 generate
    enable(i)  <= (enabled(i) and pwm) xor invsig when current_display=i else invsig;
  end generate;

  pwm <= '1' when brightcount >= brightctl else '0';

  outdata: for i in 0 to 6 generate
    segdata(i) <= segs(current_display)(i) xor invsig;
  end generate;



  dot <= segs(current_display)(7) xor invsig;
  wb_ack_o <= ack_q;
  wb_inta_o <= '0';
  extra <= extra_q when current_display=0 and pwm='1' else (others => '0');

  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
    if wb_rst_i='1' then
      counter <= DELAY;
      current_display<=0;
      brightcount <= "1111";
    else
      if counter=0 then
        counter <= DELAY;

        if brightcount="0000" then
          brightcount <= "1111";

          if current_display=0 then
            current_display <= COUNT-1;
          else
            current_display <= current_display - 1;
          end if;

        else
          brightcount <= brightcount - 1;
        end if;

      else
        counter <= counter - 1;
      end if;
    end if;
    end if;
  end process;


  process(wb_clk_i)
    variable idx: std_logic_vector(BITS-1 downto 0);
    variable int_idx: integer range 0 to COUNT-1;
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        ack_q<='0';
        enabled <= (others => '1');
      else
        ack_q <= '0';
        -- Wishbone write
        if wb_stb_i='1' and wb_cyc_i='1' and wb_we_i='1' and ack_q='0' then
          ack_q<='1';
          if wb_adr_i(BITS+2)='1' then
            -- Display access --
            idx := wb_adr_i(BITS+1 downto 2);

            int_idx := conv_integer(idx);

            segs(int_idx) <= wb_dat_i(segvaltype'RANGE);
          else
             case wb_adr_i(2) is
              when '0' =>
                enabled <= wb_dat_i(enabled'RANGE);
                brightctl <= unsigned(wb_dat_i(16+brightctl'HIGH downto 16));
              when '1' =>
                extra_q <= wb_dat_i(extra_q'RANGE);
              when others =>
                null;
             end case;
          end if;
        end if;

      end if;
    end if;
  end process;

  -- REad

  process(wb_adr_i,enabled,brightctl,extra_q)
    variable idx: std_logic_vector(BITS-1 downto 0);
    variable int_idx: integer range 0 to COUNT-1;
  begin
    wb_dat_o <= (others => DontCareValue);

    if wb_adr_i(BITS+2)='1' then
      -- Display access --
      idx := wb_adr_i(BITS+1 downto 2);
      int_idx := conv_integer(idx);

      wb_dat_o(segvaltype'RANGE)<=segs(int_idx);
    else
      case wb_adr_i(2) is
        when '0' =>
          wb_dat_o(enabled'RANGE) <= enabled;
          wb_dat_o(16+brightctl'HIGH downto 16) <= std_logic_vector(brightctl);
        when '1' =>
          wb_dat_o(extra_q'RANGE) <= extra_q;
        when others =>
          null;
      end case;
    end if;
  end process;

end behave;


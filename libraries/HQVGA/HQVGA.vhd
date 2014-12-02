--
--  VGA interface for ZPUINO (and others)
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
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity HQVGA is
  generic(
    vgaclk_divider: integer := 1
  );
  port (
	 wishbone_in : in std_logic_vector(100 downto 0);
	 wishbone_out : out std_logic_vector(100 downto 0);
	 
	 VGA_Bus : inout std_logic_vector(32 downto 0);

    -- VGA interface
    clk_50Mhz:     in std_logic;

    vga_hsync:  out std_logic;
    vga_vsync:  out std_logic;
	 vga_r2:		 out std_logic;
	 vga_r1:		 out std_logic;
	 vga_r0:		 out std_logic;
	 
	 vga_g2:		 out std_logic;
	 vga_g1:		 out std_logic;
	 vga_g0:		 out std_logic;
	 
	 vga_b1:		 out std_logic;
	 vga_b0:		 out std_logic
--    vga_r:      out std_logic_vector(2 downto 0);
--    vga_g:      out std_logic_vector(2 downto 0);
--    vga_b:      out std_logic_vector(1 downto 0)
  );
end entity HQVGA;

architecture behave of HQVGA is

  -- Clock is 50 MHz            Hor                 Vert
  --                            Disp FP  Sync BP    Disp FP Sync BP
  -- 800x600, 72Hz    50.000    800  56  120  64    600  37  6   23

  constant VGA_H_SYNC: integer := 120;
  constant VGA_H_FRONTPORCH: integer := 56;
  constant VGA_H_DISPLAY: integer := 800;
  constant VGA_H_BACKPORCH: integer := 64;

  constant VGA_V_FRONTPORCH: integer := 37;
  constant VGA_V_SYNC: integer := 6;
  constant VGA_V_DISPLAY: integer := 600;
  constant VGA_V_BACKPORCH: integer := 23;

  constant VGA_HCOUNT: integer :=
    VGA_H_SYNC + VGA_H_FRONTPORCH + VGA_H_DISPLAY + VGA_H_BACKPORCH;

  constant VGA_VCOUNT: integer :=
    VGA_V_SYNC + VGA_V_FRONTPORCH + VGA_V_DISPLAY + VGA_V_BACKPORCH;

  constant v_polarity: std_logic := '0';

  constant h_polarity: std_logic := '0';

  -- Pixel counters

  signal hcount_q: integer range 0 to VGA_HCOUNT;
  signal vcount_q: integer range 0 to VGA_VCOUNT;


  signal h_sync_tick: std_logic;

  signal vgarst: std_logic := '0';

  component zpuino_vga_ram is
  port (
    -- Scan
    v_clk:    in std_logic;
    v_en:     in std_logic; 
    v_addr:   in std_logic_vector(14 downto 0);
    v_data:   out std_logic_vector(7 downto 0);

    -- Memory interface
    mi_clk: in std_logic;

    mi_dat_i: in std_logic_vector(7 downto 0); -- Data write
    mi_we:  in std_logic;
    mi_en:  in std_logic;
    mi_dat_o: out std_logic_vector(7 downto 0); -- 9 bits
    mi_addr:  in std_logic_vector(14 downto 0)

  );
  end component zpuino_vga_ram;

  signal rstq1,rstq2: std_logic;

  signal vga_ram_address: unsigned(14 downto 0);
  signal vga_ram_data: std_logic_vector(7 downto 0);
  signal v_display: std_logic;
  signal ram_read: std_logic_vector(7 downto 0);
  signal ram_we: std_logic;
  signal vga_v_offset: unsigned(14 downto 0);
  signal hoff: unsigned(2 downto 0); -- will count from 0 to 4
  signal voff: unsigned(2 downto 0); -- will count from 0 to 4
  signal hdisp: unsigned(13 downto 2);
  signal read_ended: std_logic;


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
  
  signal vga_hsync_r:   std_logic;
  signal vga_vsync_r:   std_logic;
  signal vga_r:		  std_logic_vector(2 downto 0);
  signal vga_g:		  std_logic_vector(2 downto 0);
  signal vga_b:		  std_logic_vector(1 downto 0);
begin
-- Unpack the wishbone array into signals so the modules code is not confusing.
  wb_clk_i <= wishbone_in(61);
  wb_rst_i <= wishbone_in(60);
  wb_dat_i <= wishbone_in(59 downto 28);
  wb_adr_i <= wishbone_in(27 downto 3);
  wb_we_i <= wishbone_in(2);
  wb_cyc_i <= wishbone_in(1);
  wb_stb_i <= wishbone_in(0); 
  
  wishbone_out(33 downto 2) <= wb_dat_o;
  wishbone_out(1) <= wb_ack_o;
  wishbone_out(0) <= wb_inta_o;
-- Finish unpacking Wishbone signals.

--    vga_r:      out std_logic_vector(2 downto 0);
--    vga_g:      out std_logic_vector(2 downto 0);
--    vga_b:      out std_logic_vector(1 downto 0)

	vga_hsync <= vga_hsync_r;
	vga_vsync <= vga_vsync_r;

	--Always connect the highest bits of VGA for best results
--	VGA_Bus(9 downto 7) <= vga_r; 
	VGA_Bus(9) <= vga_r(2); 
	VGA_Bus(8) <= vga_r(1); 
	VGA_Bus(7) <= vga_r(0); 
	
	VGA_Bus(19 downto 17) <= vga_g;
	VGA_Bus(29 downto 28) <= vga_b;
	VGA_Bus(30) <= vga_hsync_r;
	VGA_Bus(31) <= vga_vsync_r;	

  vga_r2 <= vga_r(2);
  vga_r1 <= vga_r(1);
  vga_r0 <= vga_r(0);
  
  vga_g2 <= vga_g(2);
  vga_g1 <= vga_g(1);
  vga_g0 <= vga_g(0);  

  vga_b1 <= vga_b(1);
  vga_b0 <= vga_b(0);

  wb_inta_o <= '0';

  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        read_ended<='0';
      else
        read_ended<=wb_stb_i and wb_cyc_i and not wb_we_i;
      end if;
    end if;
  end process;

  wb_ack_o <= wb_stb_i and wb_cyc_i and (read_ended or wb_we_i);

  -- Read muxer
  process(wb_adr_i,ram_read)
  begin
    wb_dat_o <= (others => '0');
    wb_dat_o(7 downto 0) <= ram_read;
  end process;

  process(wb_we_i,wb_cyc_i,wb_stb_i,wb_adr_i)
  begin
    ram_we <= wb_we_i and wb_cyc_i and wb_stb_i;
  end process;
    
  -- VGA reset generator.
  process(clk_50Mhz, wb_rst_i)
  begin
    if wb_rst_i='1' then
      rstq1 <= '1';
      rstq2 <= '1';
    elsif rising_edge(clk_50Mhz) then
      rstq1 <= rstq2;
      rstq2 <= '0';
    end if;
  end process;
  vgarst <= rstq1;

  -- Compute the VGA RAM offset we need to use to fetch the character.

  vga_ram_address <= hdisp +
    vga_v_offset;

  ram:zpuino_vga_ram
  port map (
    v_clk   => clk_50Mhz,
    v_en    => '1',
    v_addr  => std_logic_vector(vga_ram_address),
    v_data  => vga_ram_data,

    -- Memory interface
    mi_clk  => wb_clk_i,
    mi_dat_i  => wb_dat_i(7 downto 0),
    mi_we   => ram_we,
    mi_en   => '1',
    mi_dat_o  => ram_read,
    mi_addr => wb_adr_i(16 downto 2)

  );

  -- Horizontal counter

  hcounter: process(clk_50Mhz)
  begin
    if rising_edge(clk_50Mhz) then
      if vgarst='1' then
        hcount_q <= VGA_H_DISPLAY + VGA_H_BACKPORCH - 1;
      else
        if hcount_q = VGA_HCOUNT then
          hcount_q <= 0;
          hoff <= (others =>'0');
          hdisp <= (others => '0');
        else
          hcount_q <= hcount_q + 1;
          if hoff="100" then
            hoff <= (others => '0');
            hdisp <= hdisp + 1;
          else
            hoff <= hoff + 1;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(clk_50Mhz)
  begin
    if rising_edge(clk_50Mhz) then
      if hcount_q < VGA_H_DISPLAY  and vcount_q < VGA_V_DISPLAY then
        v_display<='1';
      else
        v_display<='0';
      end if;
    end if;
  end process;

  hsyncgen: process(clk_50Mhz)
  begin
    if rising_edge(clk_50Mhz) then
      if vgarst='1' then
        vga_hsync_r<=h_polarity;
      else
        h_sync_tick <= '0';
        if hcount_q = (VGA_H_DISPLAY + VGA_H_BACKPORCH) then
          h_sync_tick <= '1';
          vga_hsync_r <= not h_polarity;
        elsif hcount_q = (VGA_HCOUNT - VGA_H_FRONTPORCH) then
          vga_hsync_r <= h_polarity;
        end if;
      end if;
    end if;
  end process;

  vcounter: process(clk_50Mhz)
  begin
    if rising_edge(clk_50Mhz) then
      if vgarst='1' then
        vcount_q <= VGA_V_DISPLAY + VGA_V_BACKPORCH - 1;
        vga_v_offset <= (others => '0'); -- Reset VGA vertical offset
        voff<=(others => '0');
      else

       if vcount_q = VGA_VCOUNT then
          vcount_q <= 0;
          voff <= (others => '0');

          vga_v_offset <= (others => '0'); -- Reset VGA vertical offset
          report "V finished" severity note;
       else
          if h_sync_tick='1' then
            vcount_q <= vcount_q + 1;
            if voff="100" then
              voff <= (others => '0');
              vga_v_offset <= vga_v_offset + 160;
            else
              voff <= voff + 1;
            end if;
          end if;
        end if;
      end if;
    end if;
  end process;
  
  vsyncgen: process(clk_50Mhz)
  begin
    if rising_edge(clk_50Mhz) then
      if vgarst='1' then
        vga_vsync_r<=v_polarity;
      else
        if vcount_q = (VGA_V_DISPLAY + VGA_V_BACKPORCH) then
          vga_vsync_r <= not v_polarity;
        elsif vcount_q = (VGA_VCOUNT - VGA_V_FRONTPORCH) then
          vga_vsync_r <= v_polarity;
        end if;
      end if;
    end if;
  end process;

  -- Synchronous output
  process(clk_50Mhz)
  begin
    if rising_edge(clk_50Mhz) then
      if v_display='0' then
          vga_b <= (others =>'0');
          vga_r <= (others =>'0');
          vga_g <= (others =>'0');
      else
          vga_r <= vga_ram_data(7 downto 5);
          vga_g <= vga_ram_data(4 downto 2);
          vga_b <= vga_ram_data(1 downto 0);
      end if;
    end if;
  end process;

end behave;

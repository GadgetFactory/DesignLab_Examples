--
--  SPI interface for ZPUINO
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity COMM_zpuino_wb_SPI is
  port (
	 wishbone_in : in std_logic_vector(100 downto 0);
	 wishbone_out : out std_logic_vector(100 downto 0);

    mosi:     out std_logic;				-- Master Out Slave In
    miso:     in std_logic;				-- Master In Slave Out
    sck:      out std_logic;				-- SPI Clock
    enabled:  out std_logic				-- An output that is active high when the SPI is not in a reset state
  );
end entity COMM_zpuino_wb_SPI;

architecture behave of COMM_zpuino_wb_SPI is

	constant zpuino_spiblocking: boolean := true;
	constant	DontCareValue		: std_logic := 'X';
	constant Undefined: std_logic :='0';

  component spi is
    port (
      clk:  in std_logic;
      rst:  in std_logic;
      din:  in std_logic_vector(31 downto 0);
      dout:  out std_logic_vector(31 downto 0);
      en:   in std_logic;
      ready: out std_logic;
      transfersize: in std_logic_vector(1 downto 0);
  
      miso: in std_logic;
      mosi: out std_logic;
  
      clk_en:    out std_logic;
  
      clkrise: in std_logic;
      clkfall: in std_logic;
      samprise:in std_logic
    );
  end component spi;

  component spiclkgen is
    port (
      clk:   in std_logic;
      rst:   in std_logic;
      en:    in std_logic;
      cpol:  in std_logic;
      pres:  in std_logic_vector(2 downto 0);
    
      clkrise: out std_logic;
      clkfall: out std_logic;
      spiclk:  out std_logic
  );
  end component spiclkgen;

  signal spi_read: std_logic_vector(31 downto 0);
  signal spi_en: std_logic;
  signal spi_ready: std_logic;
  signal spi_clk_en: std_logic;
  signal spi_clkrise: std_logic;
  signal spi_clkfall: std_logic;
  signal spi_clk_pres: std_logic_vector(2 downto 0);
  signal spi_samprise: std_logic;
  signal spi_enable_q: std_logic;
  signal spi_txblock_q: std_logic;
  signal cpol: std_logic;
  signal miso_i: std_logic;
  signal spi_transfersize_q: std_logic_vector(1 downto 0);
  signal trans: std_logic;

  signal  wb_clk_i:    std_logic;                     -- Wishbone clock
  signal  wb_rst_i:    std_logic;                     -- Wishbone reset (synchronous)
  signal  wb_dat_i:    std_logic_vector(31 downto 0); -- Wishbone data input  (32 bits)
  signal  wb_adr_i:    std_logic_vector(26 downto 2); -- Wishbone address input  (32 bits)
  signal  wb_we_i:     std_logic;                     -- Wishbone write enable signal
  signal  wb_cyc_i:    std_logic;                     -- Wishbone cycle signal
  signal  wb_stb_i:    std_logic;                     -- Wishbone strobe signal  

  signal  wb_id_o:    std_logic_vector(15 downto 0);
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
  
  wishbone_out(49 downto 34) <= wb_id_o;
  wishbone_out(33 downto 2) <= wb_dat_o;
  wishbone_out(1) <= wb_ack_o;
  wishbone_out(0) <= wb_inta_o;

  wb_id_o <= x"08" & x"10";  -- Vendor: ZPUino  Device: SPI
  
  zspi: spi
    port map (
      clk   => wb_clk_i,
      rst   => wb_rst_i,
      din   => wb_dat_i,
      dout  => spi_read,
      en    => spi_en,
      ready => spi_ready,
      transfersize => spi_transfersize_q,

      miso  => miso_i,
      mosi  => mosi,
  
      clk_en    => spi_clk_en,
  
      clkrise   => spi_clkrise,
      clkfall   => spi_clkfall,
      samprise  => spi_samprise
    );

  zspiclk: spiclkgen
    port map (
      clk     => wb_clk_i,
      rst     => wb_rst_i,
      en      => spi_clk_en,
      pres    => spi_clk_pres,
      clkrise => spi_clkrise,
      clkfall => spi_clkfall,
      spiclk  => sck,
      cpol    => cpol
    );

  -- Simulation only
  miso_i <= '0' when miso='Z' else miso;

  -- Direct access (write) to SPI

  --spi_en <= '1' when (wb_cyc_i='1' and wb_stb_i='1' and wb_we_i='1') and wb_adr_i(2)='1' and spi_ready='1' else '0';

  busygen: if zpuino_spiblocking=true generate
  
    process(wb_clk_i)
    begin
      if rising_edge(wb_clk_i) then
        if wb_rst_i='1' then

          wb_ack_o <= '0';
          spi_en <= '0';
          trans <= '0';

        else
          wb_ack_o <= '0';
          spi_en <= '0';
          trans <='0';
          if trans='0' then
            if (wb_cyc_i='1' and wb_stb_i='1') then
              if wb_adr_i(2)='1' then
                if spi_txblock_q='1' then
                  if spi_ready='1' then
                    if wb_we_i='1' then
                      spi_en <= '1';
                      spi_transfersize_q <= wb_adr_i(4 downto 3);
                    end if;
                    wb_ack_o <= '1';
                    trans <= '1';
                  end if;
                else
                  if wb_we_i='1' then
                    spi_en <= '1';
                    spi_transfersize_q <= wb_adr_i(4 downto 3);
                  end if;
                  trans <= '1';
                  wb_ack_o <= '1';
                end if;
              else
                trans <= '1';
                wb_ack_o <= '1';
              end if;
            end if;
          end if;
        end if;
      end if;
    end process;
    --busy <= '1' when address(2)='1' and (we='1' or re='1') and spi_ready='0' and spi_txblock_q='1' else '0';

  end generate;

  nobusygen: if zpuino_spiblocking=false generate
    --busy <= '0';
    spi_en <= '1' when (wb_cyc_i='1' and wb_stb_i='1' and wb_we_i='1') and wb_adr_i(2)='1' and spi_ready='1' else '0';
    wb_ack_o <= wb_cyc_i and wb_stb_i;
  end generate;

  

  wb_inta_o <= '0';
  enabled <= spi_enable_q;

  -- Prescaler write

  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        spi_enable_q<='0';
        spi_txblock_q<='1';
        --spi_transfersize_q<=(others => '0');
      else
      if wb_cyc_i='1' and wb_stb_i='1' and wb_we_i='1' then
        if wb_adr_i(2)='0' then
          spi_clk_pres <= wb_dat_i(3 downto 1);
          cpol <= wb_dat_i(4);
          spi_samprise <= wb_dat_i(5);
          spi_enable_q <= wb_dat_i(6);
          spi_txblock_q <= wb_dat_i(7);
          --spi_transfersize_q <= wb_dat_i(9 downto 8);
        end if;
      end if;
      end if;
    end if;
  end process;

  process(wb_adr_i, spi_ready, spi_read, spi_clk_pres,cpol,spi_samprise,spi_enable_q,spi_txblock_q,spi_transfersize_q)
  begin
    wb_dat_o <= (others =>Undefined);
    case wb_adr_i(2) is
      when '0' =>
        wb_dat_o(0) <= spi_ready;
        wb_dat_o(3 downto 1) <= spi_clk_pres;
        wb_dat_o(4) <= cpol;
        wb_dat_o(5) <= spi_samprise;
        wb_dat_o(6) <= spi_enable_q;
        wb_dat_o(7) <= spi_txblock_q;
        wb_dat_o(9 downto 8) <= spi_transfersize_q;
      when '1' =>
        wb_dat_o <= spi_read;
      when others =>
        wb_dat_o <= (others => DontCareValue);
    end case;
  end process;

end behave;


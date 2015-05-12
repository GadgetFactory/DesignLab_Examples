--
-- A simulation model of the APU in the 2A03 chip used in the  NES
--
-- Based on the work of Cedomir Segulja, University of Toronto
--

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

--library work;
--  use work.zpuino_config.all;
--  use work.zpu_config.all;
--  use work.zpupkg.all;
  
entity AUDIO_zpuino_wb_2A03 is

  port (
	 wishbone_in : in std_logic_vector(100 downto 0);
	 wishbone_out : out std_logic_vector(100 downto 0);

	 data_outR:   out std_logic_vector(17 downto 0);			--Digital data out - this should be fed into an audio mixer or Delta-Sigma DAC.
	 data_outC:   out std_logic_vector(17 downto 0)			--Digital data out - this should be fed into an audio mixer or Delta-Sigma DAC.
  );
end;

architecture RTL of AUDIO_zpuino_wb_2A03 is
  
  component papilio_2A03apu is
--	Generic (
		--wing_slot_g : std_logic_vector(3 downto 0) := x"0";
--		timebase_g	: std_logic_vector(15 downto 0) := (others => '0');
--		period_g		: std_logic_vector(15 downto 0) := (others => '0')
---	);
  port (
	 wb_clk_i:   in  std_logic;                     -- Wishbone clock
    wb_rst_i:   in  std_logic;                     -- Wishbone reset (synchronous)
    wb_dat_o:   out std_logic_vector(31 downto 0); -- Wishbone data output (32 bits)
    wb_dat_i:   in  std_logic_vector(31 downto 0); -- Wishbone data input  (32 bits)
    wb_adr_i:   in  std_logic_vector(26 downto 2); -- Wishbone address input  (32 bits)
    wb_we_i:    in  std_logic;                     -- Wishbone write enable signal
    wb_cyc_i:   in  std_logic;                     -- Wishbone cycle signal
    wb_stb_i:   in  std_logic;                     -- Wishbone strobe signal
    wb_ack_o:   out std_logic;                      -- Wishbone acknowledge out signal
	
	-- External connections
--		iNES_clk		: in  std_logic;
		NES_apu_outR	: out std_logic_vector(15 downto 0);
		NES_apu_outC	: out std_logic_vector(15 downto 0)
		);
  end component;
  
 -- signal O_AUDIO              : std_logic_vector(7 downto 0) := (others => '0');
  
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
--  signal iNES_clk	: std_logic;
	signal NES_apu_outR: std_logic_vector(15 downto 0);
	signal NES_apu_outC: std_logic_vector(15 downto 0);
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
  data_outR <= NES_apu_outR(9 downto 0) & "00000000";
  data_outC <= NES_apu_outC(9 downto 0) & "00000000";


   NES_APU: papilio_2A03apu
--	generic map (
--		timebase_g	=> "0000000000000000",
--		period_g		=> "0000000000000000"
--	)
  port map (
    wb_clk_i    => wb_clk_i,
    wb_rst_i    => wb_rst_i,
    wb_dat_o    => wb_dat_o,
    wb_dat_i    => wb_dat_i,
    wb_adr_i    => wb_adr_i,
    wb_we_i     => wb_we_i,
    wb_cyc_i    => wb_cyc_i,
    wb_stb_i    => wb_stb_i,
    wb_ack_o    => wb_ack_o,
	
	-- External connections
--	  iNES_clk		  => iNES_clk,
	  NES_apu_outR		  => NES_apu_outR,
	  NES_apu_outC		  => NES_apu_outC

  );


end architecture RTL;

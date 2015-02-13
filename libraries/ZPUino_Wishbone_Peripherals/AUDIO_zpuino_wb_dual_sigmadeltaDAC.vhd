library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity AUDIO_zpuino_wb_dual_sigmadeltaDAC is
  port(
	wishbone_in : in std_logic_vector(100 downto 0);
	wishbone_out : out std_logic_vector(100 downto 0);

--	raw_out : OUT std_logic_vector(17 downto 0);
	dac1_out : OUT std_logic;
	dac2_out : OUT std_logic;
	dac1_enabled : OUT std_logic;
	dac2_enabled : OUT std_logic
  );
end entity;

architecture behave of AUDIO_zpuino_wb_dual_sigmadeltaDAC is

	COMPONENT zpuino_sigmadelta
	PORT(
		wb_clk_i : IN std_logic;
		wb_rst_i : IN std_logic;
		wb_dat_i : IN std_logic_vector(31 downto 0);
		wb_adr_i : IN std_logic_vector(26 downto 2);
		wb_we_i : IN std_logic;
		wb_cyc_i : IN std_logic;
		wb_stb_i : IN std_logic;
		sync_in : IN std_logic;          
		wb_dat_o : OUT std_logic_vector(31 downto 0);
		wb_ack_o : OUT std_logic;
		wb_inta_o : OUT std_logic;
		id : OUT std_logic_vector(15 downto 0);
		raw_out : OUT std_logic_vector(17 downto 0);
		spp_data : OUT std_logic_vector(1 downto 0);
		spp_en : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

--signals for unpacking the wishbone array
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
  signal  id:    std_logic_vector(15 downto 0); -- ZPUino Wishbone id
--end signals for unpacking the wishbone array

	signal  spp_data:    std_logic_vector(1 downto 0);
	signal  spp_en:    std_logic_vector(1 downto 0);

begin
-- Unpack the wishbone array into signals so the modules code is not confusing.
  wb_clk_i <= wishbone_in(61);
  wb_rst_i <= wishbone_in(60);
  wb_dat_i <= wishbone_in(59 downto 28);
  wb_adr_i <= wishbone_in(27 downto 3);
  wb_we_i <= wishbone_in(2);
  wb_cyc_i <= wishbone_in(1);
  wb_stb_i <= wishbone_in(0); 
  
  wishbone_out(49 downto 34) <= id;
  wishbone_out(33 downto 2) <= wb_dat_o;
  wishbone_out(1) <= wb_ack_o;
  wishbone_out(0) <= wb_inta_o;
-- End unpacking Wishbone array 

	Inst_zpuino_sigmadelta: zpuino_sigmadelta PORT MAP(
		wb_clk_i => wb_clk_i,
		wb_rst_i => wb_rst_i,
		wb_dat_o => wb_dat_o,
		wb_dat_i => wb_dat_i,
		wb_adr_i => wb_adr_i,
		wb_we_i => wb_we_i,
		wb_cyc_i => wb_cyc_i,
		wb_stb_i => wb_stb_i,
		wb_ack_o => wb_ack_o,
		wb_inta_o => wb_inta_o,
		id => id,
		sync_in => '1',
		raw_out => OPEN,
		spp_data => spp_data,
		spp_en => spp_en
	);
	
	dac1_out <= spp_data(0);
	dac2_out <= spp_data(1);
	dac1_enabled <= spp_data(0);
	dac2_enabled <= spp_data(1);

end behave;

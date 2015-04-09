library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity COMM_zpuino_wb_I2C is
  port(
	wishbone_in : in std_logic_vector(100 downto 0);
	wishbone_out : out std_logic_vector(100 downto 0);

	-- i2c lines
	i2c_scl     : inout  std_logic;                   
	i2c_sda     : inout  std_logic  	
--	scl_pad_i     : in  std_logic;                    -- i2c clock line input
--	scl_pad_o     : out std_logic;                    -- i2c clock line output
--	scl_padoen_o  : out std_logic;                    -- i2c clock line output enable, active low
--	sda_pad_i     : in  std_logic;                    -- i2c data line input
--	sda_pad_o     : out std_logic;                    -- i2c data line output
--	sda_padoen_o  : out std_logic                     -- i2c data line output enable, active low
  );
end entity;

architecture behave of COMM_zpuino_wb_I2C is

  component i2c_master_top is
    generic(
            ARST_LVL : std_logic := '0'                   -- asynchronous reset level
    );
    port   (
            -- wishbone signals
            wb_clk_i      : in  std_logic;                    -- master clock input
            wb_rst_i      : in  std_logic := '0';             -- synchronous active high reset
            arst_i        : in  std_logic := not ARST_LVL;    -- asynchronous reset
            wb_adr_i      : in  std_logic_vector(2 downto 0); -- lower address bits
            wb_dat_i      : in  std_logic_vector(7 downto 0); -- Databus input
            wb_dat_o      : out std_logic_vector(7 downto 0); -- Databus output
            wb_we_i       : in  std_logic;                    -- Write enable input
            wb_stb_i      : in  std_logic;                    -- Strobe signals / core select signal
            wb_cyc_i      : in  std_logic;                    -- Valid bus cycle input
            wb_ack_o      : out std_logic;                    -- Bus cycle acknowledge output
            wb_inta_o     : out std_logic;                    -- interrupt request output signal
            id : OUT std_logic_vector(15 downto 0);
            -- i2c lines
            scl_pad_i     : in  std_logic;                    -- i2c clock line input
            scl_pad_o     : out std_logic;                    -- i2c clock line output
            scl_padoen_o  : out std_logic;                    -- i2c clock line output enable, active low
            sda_pad_i     : in  std_logic;                    -- i2c data line input
            sda_pad_o     : out std_logic;                    -- i2c data line output
            sda_padoen_o  : out std_logic                     -- i2c data line output enable, active low
    );
  end component;
	
	component iopad is
	  port(
		 I: in std_logic;
		 O: out std_logic;
		 T: in std_logic;
		 C: in std_logic;
		 PAD: inout std_logic
	  );
	end component iopad;	

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

  signal scl_pad_i     : std_logic;                    -- i2c clock line input
  signal scl_pad_o     : std_logic;                    -- i2c clock line output
  signal scl_padoen_o  : std_logic;                    -- i2c clock line output enable, active low
  signal sda_pad_i     : std_logic;                    -- i2c data line input
  signal sda_pad_o     : std_logic;                    -- i2c data line output
  signal sda_padoen_o  : std_logic;                    -- i2c data line output enable, active low

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

	pinSCL: IOPAD port map(I => scl_pad_o, O => scl_pad_i, T => scl_padoen_o, C => wb_clk_i,PAD => i2c_scl );
	pinSDA: IOPAD port map(I => sda_pad_o, O => sda_pad_i, T => sda_padoen_o, C => wb_clk_i,PAD => i2c_sda );

	Inst_i2c_master_top: i2c_master_top PORT MAP(
		wb_clk_i => wb_clk_i,
		wb_rst_i => wb_rst_i,
		wb_dat_o => wb_dat_o(7 downto 0),
		wb_dat_i => wb_dat_i(7 downto 0),
		wb_adr_i => wb_adr_i(4 downto 2),
		wb_we_i => wb_we_i,
		wb_cyc_i => wb_cyc_i,
		wb_stb_i => wb_stb_i,
		wb_ack_o => wb_ack_o,
		wb_inta_o => wb_inta_o,
		id => id,
		scl_pad_i => scl_pad_i,
		scl_pad_o => scl_pad_o,
		scl_padoen_o => scl_padoen_o,
		sda_pad_i => sda_pad_i,
		sda_pad_o => sda_pad_o,
		sda_padoen_o => sda_padoen_o
	);
end behave;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity VIDEO_zpuino_wb_rgb_panel is
  port(
	wishbone_in : in std_logic_vector(100 downto 0);
	wishbone_out : out std_logic_vector(100 downto 0);
	
	clk_32Mhz: in std_logic;
 
 -- RGB outputters
    R:        out std_logic_vector(1 downto 0);
    G:        out std_logic_vector(1 downto 0);
    B:        out std_logic_vector(1 downto 0);

    COL:      out std_logic_vector(3 downto 0);

    CLK:      out std_logic;
    STB:      out std_logic;
    OE:       out std_logic;
	 
	 Matrix_Bus: out std_logic_vector(20 downto 0)

  );
end entity;

architecture behave of VIDEO_zpuino_wb_rgb_panel is

  component zpuino_rgbctrl is
  generic (
      WIDTH_BITS: integer := 5;
      WIDTH_LEDS: integer := 64;
      PWM_WIDTH: integer := 8;
      REVERSE_SHIFT: boolean := false
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_inta_o:out std_logic;
    --id:       out slot_id;

    displayclk: in std_logic;
    -- RGB outputters

    R:        out std_logic_vector(1 downto 0);
    G:        out std_logic_vector(1 downto 0);
    B:        out std_logic_vector(1 downto 0);

    COL:      out std_logic_vector(3 downto 0);

    CLK:      out std_logic;
    STB:      out std_logic;
    OE:       out std_logic
  );
  end component;

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

	signal CLK_r, STB_r, OE_r: std_logic;
	signal R_r, G_r, B_r: std_logic_vector(1 downto 0);
	signal COL_r: std_logic_vector(3 downto 0);

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

  Inst_zpuino_rgbctrl: zpuino_rgbctrl
  generic map (
    WIDTH_BITS => 7,
    PWM_WIDTH => 7,
    WIDTH_LEDS => 32
  )
  port map (
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
		-- id => id,

    displayclk => clk_32Mhz,

    R => R_r,
    G => G_r,
    B => B_r,

    COL => COL_r,

    CLK => CLK_r,
    STB => STB_r,
    OE  => OE_r
  );
  id <= x"08" & x"20";

	R <= R_r;
	G <= G_r;
	B <= B_r;
	COL <= COL_r;
	CLK <= CLK_r;
	STB <= STB_r;
	OE  <= OE_r;
	
	Matrix_Bus(1 downto 0) <= R_r;
	Matrix_Bus(3 downto 2) <= G_r;
	Matrix_Bus(5 downto 4) <= B_r;
	Matrix_Bus(9 downto 6) <= COL_r;
	Matrix_Bus(10) <= CLK_r;
	Matrix_Bus(11) <= STB_r;
	Matrix_Bus(12)  <= OE_r;

end behave;

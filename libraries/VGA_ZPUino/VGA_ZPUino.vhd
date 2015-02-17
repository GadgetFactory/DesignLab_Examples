library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity VGA_ZPUino is
  port(
	 wishbone_in : in std_logic_vector(100 downto 0);
	 wishbone_out : out std_logic_vector(100 downto 0);
	 
	 wishbone_slot_video_in : out std_logic_vector(100 downto 0);
	 wishbone_slot_video_out : in std_logic_vector(100 downto 0);	 
	 
	 VGA_Bus : inout std_logic_vector(32 downto 0)

    -- VGA signals
--    vgaclk:     in std_logic;
--    vga_hsync:  out std_logic;
--    vga_vsync:  out std_logic;
--    vga_b:      out std_logic_vector(4 downto 0);
--    vga_r:      out std_logic_vector(4 downto 0);
--    vga_g:      out std_logic_vector(4 downto 0);
--    blank:      out std_logic
  );
end entity;

architecture behave of VGA_ZPUino is

	COMPONENT vga_generic
	PORT(
		wb_clk_i : IN std_logic;
		wb_rst_i : IN std_logic;
		wb_dat_i : IN std_logic_vector(31 downto 0);
		wb_adr_i : IN std_logic_vector(26 downto 2);
		wb_we_i : IN std_logic;
		wb_cyc_i : IN std_logic;
		wb_stb_i : IN std_logic;
		mi_wb_dat_i : IN std_logic_vector(31 downto 0);
		mi_wb_ack_i : IN std_logic;
		mi_wb_stall_i : IN std_logic;
		clk_42mhz : IN std_logic;          
		wb_dat_o : OUT std_logic_vector(31 downto 0);
		wb_ack_o : OUT std_logic;
		id : OUT std_logic_vector(15 downto 0);
		mi_wb_dat_o : OUT std_logic_vector(31 downto 0);
		mi_wb_adr_o : OUT std_logic_vector(27 downto 0);
		mi_wb_sel_o : OUT std_logic_vector(3 downto 0);
		mi_wb_cti_o : OUT std_logic_vector(2 downto 0);
		mi_wb_we_o : OUT std_logic;
		mi_wb_cyc_o : OUT std_logic;
		mi_wb_stb_o : OUT std_logic;
		vga_hsync : OUT std_logic;
		vga_vsync : OUT std_logic;
		vga_b : OUT std_logic_vector(4 downto 0);
		vga_r : OUT std_logic_vector(4 downto 0);
		vga_g : OUT std_logic_vector(5 downto 0);
		blank : OUT std_logic
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

--signals for unpacking DMA array
	signal mi_wb_dat_i: std_logic_vector(31 downto 0);
	signal mi_wb_dat_o: std_logic_vector(31 downto 0);
	signal mi_wb_adr_o: std_logic_vector(27 downto 0);
	signal mi_wb_sel_o: std_logic_vector(3 downto 0);
	signal mi_wb_cti_o: std_logic_vector(2 downto 0);
	signal mi_wb_we_o: std_logic;
	signal mi_wb_cyc_o: std_logic;
	signal mi_wb_stb_o: std_logic;
	signal mi_wb_ack_i: std_logic;
	signal mi_wb_stall_i: std_logic;
--end signals for unpacking DMA array

  signal vga_r:		  std_logic_vector(4 downto 0);
  signal vga_g:		  std_logic_vector(5 downto 0);
  signal vga_b:		  std_logic_vector(4 downto 0); 
  signal vga_hsync_r:   std_logic;
  signal vga_vsync_r:   std_logic;  

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

--Unpack DMA array
	wishbone_slot_video_in(31 downto 0) <= mi_wb_dat_o;
	wishbone_slot_video_in(77 downto 50) <= mi_wb_adr_o;
	wishbone_slot_video_in(100) <= mi_wb_we_o;
	wishbone_slot_video_in(99) <= mi_wb_cyc_o;
	wishbone_slot_video_in(98) <= mi_wb_stb_o;
	
	mi_wb_dat_i <= wishbone_slot_video_out(31 downto 0);
	mi_wb_ack_i <= wishbone_slot_video_out(100);
	mi_wb_stall_i <= wishbone_slot_video_out(99);
--End upack DMA array 

--VGA Bus
	VGA_Bus(9 downto 5) <= vga_r; 
	VGA_Bus(19 downto 14) <= vga_g;
	VGA_Bus(29 downto 25) <= vga_b;
	VGA_Bus(30) <= vga_hsync_r;
	VGA_Bus(31) <= vga_vsync_r;
	
--	vga_hsync <= vga_hsync_r;
--	vga_vsync <= vga_vsync_r;
--	vga_r0 <= vga_r;	
--	vga_g0 <= vga_g;	
--	vga_b0 <= vga_b;	
--End VGA Bus

--  vga_r3 <= vga_r(3);
--  vga_r2 <= vga_r(2);
--  vga_r1 <= vga_r(1);
--  vga_r0 <= vga_r(0);
--  
--  vga_g3 <= vga_g(3);
--  vga_g2 <= vga_g(2);
--  vga_g1 <= vga_g(1);
--  vga_g0 <= vga_g(0);  
--
--  vga_b3 <= vga_b(3);
--  vga_b2 <= vga_b(2);
--  vga_b1 <= vga_b(1);
--  vga_b0 <= vga_b(0);
  

	Inst_vga_generic: vga_generic PORT MAP(
		wb_clk_i => wb_clk_i,
		wb_rst_i => wb_rst_i,
		wb_dat_o => wb_dat_o,
		wb_dat_i => wb_dat_i,
		wb_adr_i => wb_adr_i,
		wb_we_i => wb_we_i,
		wb_cyc_i => wb_cyc_i,
		wb_stb_i => wb_stb_i,
		wb_ack_o => wb_ack_o,
		id => id,
		mi_wb_dat_i => mi_wb_dat_i,
		mi_wb_dat_o => mi_wb_dat_o,
		mi_wb_adr_o => mi_wb_adr_o,
		mi_wb_sel_o => mi_wb_sel_o,
		mi_wb_cti_o => mi_wb_cti_o,
		mi_wb_we_o => mi_wb_we_o,
		mi_wb_cyc_o => mi_wb_cyc_o,
		mi_wb_stb_o => mi_wb_stb_o,
		mi_wb_ack_i => mi_wb_ack_i,
		mi_wb_stall_i => mi_wb_stall_i,
		clk_42mhz => wishbone_slot_video_out(97),
		vga_hsync => vga_hsync_r,
		vga_vsync => vga_vsync_r,
		vga_b => vga_b,
		vga_r => vga_r,
		vga_g => vga_g,
		blank => OPEN
	);  
  
end behave;

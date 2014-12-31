----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Description: Top level for the OV7670 camera project.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OV_Camera_FrameBuffer is
    Port ( 
      clk_50Mhz        : in    STD_LOGIC;
		clk_25Mhz        : in    STD_LOGIC;
      OV7670_SIOC  : out   STD_LOGIC;
      OV7670_SIOD  : inout STD_LOGIC;
      OV7670_RESET : out   STD_LOGIC;
      OV7670_PWDN  : out   STD_LOGIC;
      OV7670_VSYNC : in    STD_LOGIC;
      OV7670_HREF  : in    STD_LOGIC;
      OV7670_PCLK  : in    STD_LOGIC;
      OV7670_XCLK  : out   STD_LOGIC;
      OV7670_D     : in    STD_LOGIC_VECTOR(7 downto 0);

      LED          : out    STD_LOGIC_VECTOR(7 downto 0);

      vga_red      : out   STD_LOGIC_VECTOR(3 downto 0);
      vga_green    : out   STD_LOGIC_VECTOR(3 downto 0);
      vga_blue     : out   STD_LOGIC_VECTOR(3 downto 0);
      vga_hsync    : out   STD_LOGIC;
      vga_vsync    : out   STD_LOGIC;
      
      btn           : in    STD_LOGIC
    );
end OV_Camera_FrameBuffer;

architecture Behavioral of OV_Camera_FrameBuffer is

   COMPONENT debounce
   PORT(
      clk : IN std_logic;
      i : IN std_logic;          
      o : OUT std_logic
      );
   END COMPONENT;

   COMPONENT ov7670_controller
   PORT(
      clk   : IN    std_logic;    
      resend: IN    std_logic;    
      config_finished : out std_logic;
      siod  : INOUT std_logic;      
      sioc  : OUT   std_logic;
      reset : OUT   std_logic;
      pwdn  : OUT   std_logic;
      xclk  : OUT   std_logic
      );
   END COMPONENT;

   COMPONENT BRAM36k8bit
   PORT (
      a_clk  : IN  STD_LOGIC;
      a_wr   : IN  STD_LOGIC;
      a_addr : IN  STD_LOGIC_VECTOR(14 DOWNTO 0);
      a_din  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
      b_clk  : IN  STD_LOGIC;
		--b_wr   : IN  STD_LOGIC;
      b_addr : IN  STD_LOGIC_VECTOR(14 DOWNTO 0);
		--b_din  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
      b_dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
   END COMPONENT;
	
   COMPONENT framebuffer
   PORT (
      clka  : IN  STD_LOGIC;
		ena : IN STD_LOGIC;		
      wea   : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
      addra : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
      dina  : IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
      clkb  : IN  STD_LOGIC;	
		enb : IN STD_LOGIC;		
      addrb : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
      doutb : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
   );
   END COMPONENT;	

   COMPONENT ov7670_capture
   PORT(
      pclk : IN std_logic;
      vsync : IN std_logic;
      href  : IN std_logic;
      d     : IN std_logic_vector(7 downto 0);          
      addr  : OUT std_logic_vector(15 downto 0);
      dout  : OUT std_logic_vector(11 downto 0);
      we    : OUT std_logic
      );
   END COMPONENT;


   COMPONENT vga
   PORT(
      clk25 : IN std_logic;
      vga_red : OUT std_logic_vector(3 downto 0);
      vga_green : OUT std_logic_vector(3 downto 0);
      vga_blue : OUT std_logic_vector(3 downto 0);
      vga_hsync : OUT std_logic;
      vga_vsync : OUT std_logic;
      
      frame_addr : OUT std_logic_vector(15 downto 0);
      frame_pixel : IN std_logic_vector(11 downto 0)         
      );
   END COMPONENT;
   
   signal frame_addr  : std_logic_vector(15 downto 0);
   signal frame_pixel : std_logic_vector(11 downto 0);

   signal capture_addr  : std_logic_vector(15 downto 0);
   signal capture_data  : std_logic_vector(11 downto 0);
   --signal capture_we    : std_logic;
	signal capture_we    : std_logic_vector(0 downto 0);
   signal resend : std_logic;
   signal config_finished : std_logic;

	--Prevent a BUFG from being added to PCLK - The speeds we are running at do not require a global clock pin.
--	attribute buffer_type: string;
--	attribute buffer_type of OV7670_PCLK: signal is "none";

begin
btn_debounce: debounce PORT MAP(
      clk => clk_50Mhz,
      i   => btn,
      o   => resend
   );

   Inst_vga: vga PORT MAP(
      clk25       => clk_25Mhz,
      vga_red     => vga_red,
      vga_green   => vga_green,
      vga_blue    => vga_blue,
      vga_hsync   => vga_hsync,
      vga_vsync   => vga_vsync,
      frame_addr  => frame_addr,
      frame_pixel => frame_pixel
   );

--framebuffer : BRAM36k8bit
--  PORT MAP (
--    a_clk  => OV7670_PCLK,
--    a_wr   => capture_we,
--    a_addr => capture_addr,
--    a_din  => capture_data,
--    
--    b_clk  => clk_50Mhz,
--	 b_we   => '0',
--	 b_din  => "00000000",
--    b_addr => frame_addr,
--    b_dout => frame_pixel
--  );

fb : framebuffer
  PORT MAP (
    clka  => OV7670_PCLK,
    wea   => capture_we,
    addra => capture_addr,
    dina  => capture_data,
	 ena   => '1',
    
    clkb  => clk_50Mhz,
	 enb   => '1',
    addrb => frame_addr,
    doutb => frame_pixel
  );

  led <= "0000000" & config_finished;
  
capture: ov7670_capture PORT MAP(
      pclk  => OV7670_PCLK,
      vsync => OV7670_VSYNC,
      href  => OV7670_HREF,
      d     => OV7670_D,
      addr  => capture_addr,
      dout  => capture_data,
      we    => capture_we(0)
   );
  
controller: ov7670_controller PORT MAP(
      clk   => clk_50Mhz,
      sioc  => ov7670_sioc,
      resend => resend,
      config_finished => config_finished,
      siod  => ov7670_siod,
      pwdn  => OV7670_PWDN,
      reset => OV7670_RESET,
      xclk  => OV7670_XCLK
   );	
end Behavioral;
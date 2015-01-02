library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Unfortunately the Xilinx Schematic Editor does not support records, so we have to put all wishbone signals into one array.
-- This is a little cumbersome but is better then dealing with all the signals in the schematic editor.
-- This is what the original record base approach looked like:
--
-- type wishbone_bus_in_type is record
--    wb_clk_i:    std_logic;                     -- Wishbone clock
--    wb_rst_i:    std_logic;                     -- Wishbone reset (synchronous)
--    wb_dat_i:    std_logic_vector(31 downto 0); -- Wishbone data input  (32 bits)
--    wb_adr_i:    std_logic_vector(26 downto 2); -- Wishbone address input  (32 bits)
--    wb_we_i:     std_logic;                     -- Wishbone write enable signal
--    wb_cyc_i:    std_logic;                     -- Wishbone cycle signal
--    wb_stb_i:    std_logic;                     -- Wishbone strobe signal
-- end record;
-- 
-- type wishbone_bus_out_type is record
--    wb_dat_o:    std_logic_vector(31 downto 0); -- Wishbone data output (32 bits)
--    wb_ack_o:    std_logic;                      -- Wishbone acknowledge out signal
--    wb_inta_o:   std_logic;	 
-- end record; 
--
-- Turning them into an array looks like this:
--
-- wishbone_in : in std_logic_vector(61 downto 0);
--
--  wishbone_in_record.wb_clk_i <= wishbone_in(61);
--  wishbone_in_record.wb_rst_i <= wishbone_in(60);
--  wishbone_in_record.wb_dat_i <= wishbone_in(59 downto 28);
--  wishbone_in_record.wb_adr_i <= wishbone_in(27 downto 3);
--  wishbone_in_record.wb_we_i <= wishbone_in(2);
--  wishbone_in_record.wb_cyc_i <= wishbone_in(1);
--  wishbone_in_record.wb_stb_i <= wishbone_in(0); 
--
-- wishbone_out : out std_logic_vector(33 downto 0);
--
--  wishbone_out(33 downto 2) <= wishbone_out_record.wb_dat_o;
--  wishbone_out(1) <= wishbone_out_record.wb_ack_o;
--  wishbone_out(0) <= wishbone_out_record.wb_inta_o; 


entity Wishbone_Empty_Slot is
  port (  
	 wishbone_in : in std_logic_vector(100 downto 0);
	 wishbone_out : out std_logic_vector(100 downto 0)  
  );
end entity Wishbone_Empty_Slot;

architecture behave of Wishbone_Empty_Slot is
--  signal wishbone_in_record  : wishbone_bus_in_type;
--  signal wishbone_out_record : wishbone_bus_out_type;
constant	DontCareValue		: std_logic := 'X';

begin
-- Unpack the wishbone array into a record so the modules code is not confusing.
--  wishbone_in_record.wb_clk_i <= wishbone_in(61);
--  wishbone_in_record.wb_rst_i <= wishbone_in(60);
--  wishbone_in_record.wb_dat_i <= wishbone_in(59 downto 28);
--  wishbone_in_record.wb_adr_i <= wishbone_in(27 downto 3);
--  wishbone_in_record.wb_we_i <= wishbone_in(2);
--  wishbone_in_record.wb_cyc_i <= wishbone_in(1);
--  wishbone_in_record.wb_stb_i <= wishbone_in(0); 
--  
--  wishbone_out(33 downto 2) <= wishbone_out_record.wb_dat_o;
--  wishbone_out(1) <= wishbone_out_record.wb_ack_o;
--  wishbone_out(0) <= wishbone_out_record.wb_inta_o;  

--Actual code for the module
--  wishbone_out_record.wb_ack_o <= wishbone_in_record.wb_cyc_i and wishbone_in_record.wb_stb_i;
    wishbone_out(1) <= wishbone_in(1) and wishbone_in(0);
	wishbone_out(49 downto 34) <= x"00" & x"00"; -- Vendor: None   Device: None
	 
--  wishbone_out_record.wb_inta_o <= '0';	 
    wishbone_out(0) <= '0';
	 
--  wishbone_out_record.wb_dat_o <= (others => DontCareValue);	 
    wishbone_out(33 downto 2) <= (others => DontCareValue); 

end behave;


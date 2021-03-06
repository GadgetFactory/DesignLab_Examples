----------------------------------------------------------------------------------
-- Company: Gadget Factory
-- Engineer: Alvaro Lopes
-- 
-- Create Date:    13:56:50 12/10/2013 
-- Design Name: 
-- Module Name:    Wishbone_Symbol_Example - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- This is an example template to use for your own Wishbone Peripherals.
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
-- This example uses asynchronous outputs.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library DesignLab;
use DesignLab.ALL;

entity Wishbone_to_Registers_x10 is
  port (
  	 wishbone_in : in std_logic_vector(100 downto 0);
	 wishbone_out : out std_logic_vector(100 downto 0);
	 
	 --Registers
	 register0_in  : in std_logic_vector(31 downto 0);  -- Register 0 (32 bits)
	 register0_out : out std_logic_vector(31 downto 0); -- Register 0 (32 bits)
	 register1_in  : in std_logic_vector(31 downto 0);  -- Register 0 (32 bits)
	 register1_out : out std_logic_vector(31 downto 0); -- Register 0 (32 bits)
	 register2_in  : in std_logic_vector(31 downto 0);  -- Register 0 (32 bits)
	 register2_out : out std_logic_vector(31 downto 0); -- Register 0 (32 bits)
	 register3_in  : in std_logic_vector(31 downto 0);  -- Register 0 (32 bits)
	 register3_out : out std_logic_vector(31 downto 0); -- Register 0 (32 bits)
	 register4_in  : in std_logic_vector(31 downto 0);  -- Register 0 (32 bits)
	 register4_out : out std_logic_vector(31 downto 0); -- Register 0 (32 bits)
	 register5_in  : in std_logic_vector(31 downto 0);  -- Register 0 (32 bits)
	 register5_out : out std_logic_vector(31 downto 0); -- Register 0 (32 bits)
	 register6_in  : in std_logic_vector(31 downto 0);  -- Register 0 (32 bits)
	 register6_out : out std_logic_vector(31 downto 0); -- Register 0 (32 bits)
	 register7_in  : in std_logic_vector(31 downto 0);  -- Register 0 (32 bits)
	 register7_out : out std_logic_vector(31 downto 0); -- Register 0 (32 bits)
	 register8_in  : in std_logic_vector(31 downto 0);  -- Register 0 (32 bits)
	 register8_out : out std_logic_vector(31 downto 0); -- Register 0 (32 bits)
	 register9_in  : in std_logic_vector(31 downto 0);  -- Register 0 (32 bits)
	 register9_out : out std_logic_vector(31 downto 0) -- Register 0 (32 bits) 
  );
end entity Wishbone_to_Registers_x10;



architecture rtl of Wishbone_to_Registers_x10 is

--Define your registers here


--Wishbone signals - Don't touch.
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
-- Unpack the wishbone array into signals so the modules code is not confusing. - Don't touch.
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
-- End unpacking Wishbone signals

  -- Asynchronous acknowledge

  wb_ack_o <= '1' when wb_cyc_i='1' and wb_stb_i='1' else '0';

  -- Multiplex the data output (asynchronous)

  --This is for a Wishbone read
  process(register0_in,register1_in,register2_in,register3_in,register4_in,register5_in,register6_in,register7_in,register8_in,register9_in, wb_adr_i)
  begin

    -- Multiplex the read depending on the address. Use only the 2 lowest bits of addr

    case wb_adr_i(9 downto 2) is
      when x"00" =>
        wb_dat_o <= register0_in;  -- Output register0
      when x"01" =>
        wb_dat_o <= register1_in;  
      when x"02" =>
		  wb_dat_o <= register2_in;  
      when x"03" =>
		  wb_dat_o <= register3_in;  
      when x"04" =>
		  wb_dat_o <= register4_in;  
      when x"05" =>
		  wb_dat_o <= register5_in; 
      when x"06" =>
		  wb_dat_o <= register6_in;  
      when x"07" =>
		  wb_dat_o <= register7_in;  
      when x"08" =>
		  wb_dat_o <= register8_in;  
      when x"09" =>
		  wb_dat_o <= register9_in;  
      when others =>
        wb_dat_o <= (others => 'X'); -- Return undefined for all other addresses
    end case;

  end process;


  --This is for a Wishbone write
  process(wb_clk_i)
  begin

    if rising_edge(wb_clk_i) then  -- Synchronous to the rising edge of the clock

      if wb_rst_i='1' then
        -- Reset request, put register1 and register2 with zeroes,
        -- put register 3 with binary 10101010b

--        register0 <= (others => '0');
--        register1 <= (others => '0');
--        register2 <= "10101010";

      else -- Not reset

        -- Check if someone is writing
        if wb_cyc_i='1' and wb_stb_i='1' and wb_we_i='1' then
          -- Yes, it's a write. See for which register based on address
          case wb_adr_i(9 downto 2) is
            when x"00" =>
              register0_out <= wb_dat_i;  -- Input for register 0
            when x"01" =>
              register1_out <= wb_dat_i;  
            when x"02" =>
              register2_out <= wb_dat_i; 
            when x"03" =>
              register3_out <= wb_dat_i; 
            when x"04" =>
              register4_out <= wb_dat_i; 
            when x"05" =>
              register5_out <= wb_dat_i; 
            when x"06" =>
              register6_out <= wb_dat_i; 
            when x"07" =>
              register7_out <= wb_dat_i; 
            when x"08" =>
              register8_out <= wb_dat_i; 
            when x"09" =>
              register9_out <= wb_dat_i; 			  
            when others =>
              null; -- Nothing to do for other addresses
          end case;

        end if;

      end if;

    end if;

  end process;

end rtl;


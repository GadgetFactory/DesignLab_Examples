----------------------------------------------------------------------------------
-- Company: Gadget Factory
-- Engineer: Alvaro Lopes
-- 
-- Create Date:    13:56:50 12/10/2013 
-- Design Name: 
-- Module Name:    TEMPLATE_zpuino_wb_Wishbone - Behavioral 
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

entity TEMPLATE_zpuino_wb_Wishbone is
  port (
  	 wishbone_in : in std_logic_vector(61 downto 0);
	 wishbone_out : out std_logic_vector(33 downto 0)
  );
end entity TEMPLATE_zpuino_wb_Wishbone;



architecture rtl of TEMPLATE_zpuino_wb_Wishbone is

--Define your registers here
  signal register0: std_logic_vector(31 downto 0); -- Register 0 (32 bits)
  signal register1: std_logic_vector(31 downto 0); -- Register 1 (32 bits)
  signal register2: std_logic_vector(7 downto 0);  -- Register 2 (8 bits)

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
-- End unpacking Wishbone signals

  -- Asynchronous acknowledge

  wb_ack_o <= '1' when wb_cyc_i='1' and wb_stb_i='1' else '0';

  -- Multiplex the data output (asynchronous)

  process(register0,register1,register2, wb_adr_i)
  begin

    -- Multiplex the read depending on the address. Use only the 2 lowest bits of addr

    case wb_adr_i(3 downto 2) is
      when "00" =>
        wb_dat_o <= register0;  -- Output register0
      when "01" =>
        wb_dat_o <= register1;  -- Output register1
      when "10" =>
        wb_dat_o(31 downto 0) <= (others => '0'); -- We put all upper 24 bits to zero
        wb_dat_o(7 downto 0) <= register2;        -- since register2 only has 8 bits
      when others =>
        wb_dat_o <= (others => 'X'); -- Return undefined for all other addresses
    end case;

  end process;


  process(wb_clk_i)
  begin

    if rising_edge(wb_clk_i) then  -- Synchronous to the rising edge of the clock

      if wb_rst_i='1' then
        -- Reset request, put register1 and register2 with zeroes,
        -- put register 3 with binary 10101010b

        register0 <= (others => '0');
        register1 <= (others => '0');
        register2 <= "10101010";

      else -- Not reset

        -- Check if someone is writing
        if wb_cyc_i='1' and wb_stb_i='1' and wb_we_i='1' then
          -- Yes, it's a write. See for which register based on address
          case wb_adr_i(3 downto 2) is
            when "00" =>
              register0 <= wb_dat_i;  -- Set register0
            when "01" =>
              register1 <= wb_dat_i;  -- Set register1
            when "10" =>
              register2 <= wb_dat_i(7 downto 0); -- Only lower 8 bits for register2
            when others =>
              null; -- Nothing to do for other addresses
          end case;

        end if;

      end if;

    end if;

  end process;

end rtl;


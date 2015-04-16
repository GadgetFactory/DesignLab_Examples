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
package Wishbone_to_Registers_n_package is
	type register_type is array(natural range <>) of std_logic_vector(31 downto 0);
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

--library work;
--use work.Wishbone_to_Registers_n_package.all;

library DesignLab;
use DesignLab.Wishbone_to_Registers_n_package.all;
use DesignLab.ALL;

entity Wishbone_to_Registers_n is
  generic ( register_count : integer := 3 );
  port (
  	 wishbone_in : in std_logic_vector(100 downto 0);
	 wishbone_out : out std_logic_vector(100 downto 0);
	 
	 clk_96Mhz : out std_logic;
	 
	 --Registers
	 register_in : in register_type(0 to register_count-1);
	 register_out : out register_type(0 to register_count-1)
  );
end entity Wishbone_to_Registers_n;



architecture rtl of Wishbone_to_Registers_n is

--Define your registers here
--  type register_type is array(0 to register_count) of std_logic_vector(31 downto 0);
--  signal register_in_array : register_type;
--  signal register_out_array : register_type;

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

  clk_96Mhz <= wb_clk_i;

  -- Asynchronous acknowledge

  wb_ack_o <= '1' when wb_cyc_i='1' and wb_stb_i='1' else '0';

  -- Multiplex the data output (asynchronous)

  --This is for a Wishbone read
  process(wb_adr_i)
  begin

    -- Multiplex the read depending on the address. Use only the 2 lowest bits of addr

	for i in 0 to register_count-1 loop
		if wb_adr_i(9 downto 2) = i then
			wb_dat_o <= register_in(i);
		end if;
	end loop;

  end process;


  --This is for a Wishbone write
  process(wb_clk_i)
  begin

    if rising_edge(wb_clk_i) then  -- Synchronous to the rising edge of the clock

      if wb_rst_i='1' then
        -- Reset request, put register1 and register2 with zeroes,
        -- put register 3 with binary 10101010b
		for i in 0 to register_count-1 loop
			register_out(i) <= (others => '0');
		end loop;			

      else -- Not reset

        -- Check if someone is writing
        if wb_cyc_i='1' and wb_stb_i='1' and wb_we_i='1' then
          -- Yes, it's a write. See for which register based on address
			for i in 0 to register_count-1 loop
				if wb_adr_i(9 downto 2) = i then
					register_out(i) <= wb_dat_i;
				end if;
			end loop;		  

        end if;

      end if;

    end if;

  end process;

end rtl;


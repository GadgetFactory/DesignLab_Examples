library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

--library DesignLab;
--use DesignLab.ALL;

entity Simulate_Your_CCL_Design is
end entity;


architecture sim of Simulate_Your_CCL_Design is

  constant period: time := 10 ns;

  signal clk: std_logic := '1';
  signal rst: std_logic := '0';

	COMPONENT Wishbone_Symbol_Example
	PORT(
		--Put your custom external connections here
		buttons : IN std_logic_vector(3 downto 0);          
		leds : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
  
  --Define your external connections here
  signal buttons: 	std_logic_vector(3 downto 0) := "1010";
  signal leds: 		std_logic_vector(3 downto 0);

begin

  clk <= not clk after period/2;

  -- Reset
  process
  begin
    wait for 5 ns;
    rst <= '1';
    wait for 20 ns;
    rst <= '0';
    wait;
  end process;

	uut: Wishbone_Symbol_Example PORT MAP(
		--Define your external connections here
		buttons => buttons,
		leds => leds
	);

  process

  begin
    
    wait until rst='1';
    wait until rst='0';
    wait until rising_edge(clk);

	-- This is where you should start providing your stimulus to test your design.
	
	-- Provide stimulus on the buttons
		buttons <= "0000";
		wait for 100 ns;
		
	-- Check that the leds match
		assert( leds = "0000");

	-- Provide stimulus on the buttons
		buttons <= "1111";
		wait for 100 ns;
		
	-- Check that the leds match
		assert( leds = "1111");

    wait for 200 ns;
    report "Finsihed" severity failure;
  end process;


end sim;

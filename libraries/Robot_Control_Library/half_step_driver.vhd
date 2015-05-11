library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- This source has been developed with help from a stepper controller
-- implementation on Opencores developed by:
--   c2003 Franks Development, LLC
--   http://www.franks-development.com

entity half_step_driver is
    Port (	
	 			StepDrive : out std_logic_vector(3 downto 0); -- the 4 output to drive the MOSFETS driving the coils in the motor.
		 		clock : in std_logic;								 -- clock input to logic device
		 		Direction : in std_logic;							 -- spin clockwise or counter-clockwise? (actual direction depends on correct hookup/pin assignements)
		 		StepEnable : in std_logic;							 -- move a single step on next clock divider rollover.  leave high for a single clock to get a single step.  If high across rollover, may get two steps
		 		ProvideStaticHolding : in std_logic			    -- leave motor coils energized when not rotating, so that counter-torque is applied if attempt to move shaft
		);
end half_step_driver;

architecture StepDrive of half_step_driver is
	signal state : std_logic_vector(2 downto 0);				-- simple state machine, 8 states
begin
	process(clock)
	begin
		if ( (clock'Event) and (clock = '1') ) then		 --on clock
			if (ProvideStaticHolding = '0') then --should we leave coils in energized state by defaul or not?
				StepDrive <= "0000";
			else
				StepDrive <= "1111";
			end if;				
		  if (StepEnable = '1') then -- are we supposed to step on this clock?
				if (Direction = '1') then state <= state + "01"; end if; -- to change the direction of a stepper motor, you energize 
				if (Direction = '0') then state <= state - "01"; end if; -- the coils in the opposite pattern, so just run states backwards	
				case state is 
					when "000" =>
						StepDrive <= "0001";			-- these states follow proper pattern of coil energizing for turning steppers					
					when "001" =>
						StepDrive <= "0101";						
					when "010" =>	
						StepDrive <= "0100";									
					when "011" =>
					  StepDrive <= "0110";						
					when "100" =>
						StepDrive <= "0010";
					when "101" =>
						StepDrive <= "1010";						
					when "110" =>	
						StepDrive <= "1000";									
					when "111" =>
					  StepDrive <= "1001";						
					when others =>
				end case; --state
			end if;
		end if;
end process;
end StepDrive;

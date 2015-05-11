--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : 
--  /   /         Filename : xil_12112_30
-- /___/   /\     Timestamp : 09/23/2014 15:24:59
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

--library work;
--use work.Wishbone_to_Registers_n_package.all;

library DesignLab;
use DesignLab.ALL;
use DesignLab.Wishbone_to_Registers_n_package.all;

entity RCL_PWM_x48 is
	generic ( 
				pwm_count : integer := 48;
				pwm_width : integer := 9;
				register_count : integer := 48	--Each PWM has 1 register
			);
   port ( wishbone_in  : in    std_logic_vector (100 downto 0); 
          wishbone_out : out   std_logic_vector (100 downto 0);
			 
			 --Put your external connections here
			 PWM : out std_logic_vector(pwm_count-1 downto 0)
--			 DIR : out std_logic_vector(pwm_count-1 downto 0);
--			 PWM_clk : in std_logic
			 );
end RCL_PWM_x48;

architecture BEHAVIORAL of RCL_PWM_x48 is

	COMPONENT Wishbone_to_Registers_n
	generic ( register_count : integer := register_count );
	PORT(
		wishbone_in : IN std_logic_vector(100 downto 0);         
		wishbone_out : OUT std_logic_vector(100 downto 0);
		clk_96Mhz : out std_logic;
		register_in : in register_type(0 to register_count-1);
		register_out : out register_type(0 to register_count-1)
		);
	END COMPONENT;
	
	COMPONENT PWMGenerator
	generic (
		C_PWM_WIDTH : integer := pwm_width;
		C_PWM_TYPE : integer := 1           -- 2 phase, 1 phase or Enable chopping
	);	
	PORT(
		Clk : in std_logic;
		Duty : in std_logic_vector(C_PWM_WIDTH-1 downto 0);
		Out1 : out std_logic;
		Out2 : out std_logic 
		);
	END COMPONENT;	
	
  signal register_in_array : register_type(0 to register_count-1);
  signal register_out_array : register_type(0 to register_count-1);
  signal DIR : std_logic_vector(pwm_count-1 downto 0);
  
  signal clk_96Mhz : std_logic;  
	
	--Put your unique register names here

begin
	--Put your code here
	
	GEN_PWMS:
	for j in 0 to pwm_count-1 generate
		Inst_pwm_inst: PWMGenerator 
		GENERIC MAP(
			C_PWM_WIDTH => pwm_width,
			C_PWM_TYPE => 1
		)
		PORT MAP(
			CLK => clk_96Mhz,
			Duty => register_out_array(j)(pwm_width-1 downto 0),
			Out1 => PWM(j),
			Out2 => DIR(j)
		);	
		--register_in_array(j) <= register_out_array(j); 	--So we can read back what was written to the register.
	end generate GEN_PWMS;

	--Do not touch
	Inst_Wishbone_to_Registers_n: Wishbone_to_Registers_n 
	generic map (register_count => register_count) 
	PORT MAP(
		wishbone_in => wishbone_in,
		wishbone_out => wishbone_out,
		clk_96Mhz => clk_96Mhz,
		register_in => register_in_array,
		register_out => register_out_array
	);

end BEHAVIORAL;



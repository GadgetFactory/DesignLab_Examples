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

entity RCL_Quadrature_Decoder_x8 is
	generic ( 
				quad_count : integer := 8;
				register_count : integer := 32	--Each Quad has 4 registers
			);
   port ( wishbone_in  : in    std_logic_vector (100 downto 0); 
          wishbone_out : out   std_logic_vector (100 downto 0);
			 
			 --Put your external connections here
			 A : in std_logic_vector(quad_count-1 downto 0);
			 B : in std_logic_vector(quad_count-1 downto 0);
			 I : in std_logic_vector(quad_count-1 downto 0)
			 );
end RCL_Quadrature_Decoder_x8;

architecture BEHAVIORAL of RCL_Quadrature_Decoder_x8 is

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
	
	COMPONENT quad_inst
	PORT(
		CLK : IN std_logic;
		Reset : IN std_logic;
		A_CLK : IN std_logic;
		B_CLK : IN std_logic;
		I_CLK : IN std_logic;          
		PULSE_COUNT : OUT std_logic_vector(31 downto 0);
		REV_COUNT : OUT std_logic_vector(31 downto 0);
		TSPEED : OUT std_logic_vector(31 downto 0);
		TACCEL : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;	
	
  signal register_in_array : register_type(0 to register_count-1);
  signal register_out_array : register_type(0 to register_count-1);
  
  signal PULSE_COUNT : register_type(0 to quad_count-1);
  signal REV_COUNT : register_type(0 to quad_count-1);
  signal TSPEED : register_type(0 to quad_count-1);
  signal TACCEL : register_type(0 to quad_count-1);
  
  signal clk_96Mhz : std_logic;  
	
	--Put your unique register names here

begin
	--Put your code here
	
	GEN_QUADS:
	for j in 0 to quad_count-1 generate
		Inst_quad_inst: quad_inst PORT MAP(
			CLK => clk_96Mhz,
			Reset => '0',
			A_CLK => A(j),
			B_CLK => B(j),
			I_CLK => I(j),
			PULSE_COUNT => PULSE_COUNT(j),
			REV_COUNT => REV_COUNT(j),
			TSPEED => TSPEED(j),
			TACCEL => TACCEL(j)
		);
		register_in_array(j*4) <= PULSE_COUNT(j);
		register_in_array(j*4+1) <= REV_COUNT(j);
		register_in_array(j*4+2) <= TSPEED(j);
		register_in_array(j*4+3) <= TACCEL(j);		
	end generate GEN_QUADS;

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



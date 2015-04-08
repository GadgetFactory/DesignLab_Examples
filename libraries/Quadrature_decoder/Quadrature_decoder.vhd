
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Quadrature_decoder is
   port ( wishbone_in  : in    std_logic_vector (100 downto 0); 
          wishbone_out : out   std_logic_vector (100 downto 0);
			 
			Clk : in  STD_LOGIC;
			A : in std_logic;
			B : in std_logic;
			A_s : in std_logic;
			B_s : in std_logic;
			A_t : in std_logic;
			B_t : in std_logic;
			A_f : in std_logic;
			B_f : in std_logic
			 );
end Quadrature_decoder;

architecture BEHAVIORAL of Quadrature_decoder is

	COMPONENT Wishbone_to_Registers_x10
	PORT(
		wishbone_in : IN std_logic_vector(100 downto 0);
		register0_in : IN std_logic_vector(31 downto 0);
		register1_in : IN std_logic_vector(31 downto 0);
		register2_in : IN std_logic_vector(31 downto 0);
      register3_in : IN std_logic_vector(31 downto 0);  		
      register4_in : IN std_logic_vector(31 downto 0);  		
      register5_in : IN std_logic_vector(31 downto 0);  		
      register6_in : IN std_logic_vector(31 downto 0);  		
      register7_in : IN std_logic_vector(31 downto 0);  		
      register8_in : IN std_logic_vector(31 downto 0);  		
      register9_in : IN std_logic_vector(31 downto 0);  		
		wishbone_out : OUT std_logic_vector(100 downto 0);
		register0_out : OUT std_logic_vector(31 downto 0);
		register1_out : OUT std_logic_vector(31 downto 0);
		register2_out : OUT std_logic_vector(31 downto 0);
		register3_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Q_Decoder is
    Port ( 	Clk : IN std_logic;
		QuadA : IN std_logic;
		QuadB : IN std_logic;
		QuadA_s : IN std_logic;
		QuadB_s : IN std_logic;
		QuadA_t : IN std_logic;
		QuadB_t : IN std_logic;
		QuadA_f : IN std_logic;
		QuadB_f : IN std_logic;          
		Position : OUT std_logic_vector(31 downto 0);
		Position_s : OUT std_logic_vector(31 downto 0);
		Position_t : OUT std_logic_vector(31 downto 0);
		Position_f : OUT std_logic_vector(31 downto 0)
			);
   end COMPONENT;

	
	signal register0_in: std_logic_vector(31 downto 0);
	signal register0_out: std_logic_vector(31 downto 0);
	signal register1_in: std_logic_vector(31 downto 0);
	signal register1_out: std_logic_vector(31 downto 0);
	signal register2_in: std_logic_vector(31 downto 0);
	signal register2_out: std_logic_vector(31 downto 0);	
	signal register3_in: std_logic_vector(31 downto 0);
	signal register3_out: std_logic_vector(31 downto 0);	
	
	--Put your unique register names here

begin

	--Put your code here
--	leds <= register0_out(3 downto 0);
	--register1_in(3 downto 0) <= buttons;


Encoder : Q_Decoder PORT MAP(
			QuadA => A,
			Quadb => B,
			QuadA_s => A_s,
			Quadb_s => B_s,
			QuadA_t => A_t,
			Quadb_t => B_t,
			QuadA_f => A_f,
			Quadb_f => B_f,
			Clk => Clk,
			Position => register0_in,
			Position_s => register1_in, 
			Position_t => register2_in, 
			Position_f => register3_in 

	);

	--Do not touch
	Inst_Wishbone_to_Registers: Wishbone_to_Registers_x10 PORT MAP(
		wishbone_in => wishbone_in,
		wishbone_out => wishbone_out,
		register0_in => register0_in,
		register0_out => register0_out,
		register1_in => register1_in,
		register1_out => register1_out,
		register2_in => register2_in,
		register2_out => register2_out,
		register3_in => register3_in,
		register3_out => register3_out,
		--Unused inputs need to be tied to ground
		register4_in => x"00000000",
		register5_in => x"00000000",
		register6_in => x"00000000",
		register7_in => x"00000000",
		register8_in => x"00000000",
		register9_in => x"00000000"
	);

end BEHAVIORAL;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:44:24 03/27/2015 
-- Design Name: 
-- Module Name:    Quadrature_Decoder - Behavioral 
-- 
-- based on: 
-- 1. http://www.fpga4fun.com/QuadratureDecoder.html (Verilog code) 
-- 2. http://www.hackmeister.dk/2010/07/using-a-quadrature-encoder-as-input-to-fpga/ (VHDL code)
-- Contributor: Filip Filipov 
-- Forum topic: 
--
----------------------------------------------------------------------------------
Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity Q_Decoder is
    Port ( Clk : in  STD_LOGIC;
		     QuadA : in  STD_LOGIC;
			  QuadB : in  STD_LOGIC;
        	  QuadA_s : in  STD_LOGIC;
			  QuadB_s : in  STD_LOGIC;
			  QuadA_t : in  STD_LOGIC; 
			  QuadB_t : in  STD_LOGIC;
			  QuadA_f : in  STD_LOGIC;
			  QuadB_f : in  STD_LOGIC;
         
			  Position : out  STD_LOGIC_VECTOR (31 downto 0);
			  Position_s : out  STD_LOGIC_VECTOR (31 downto 0);
			  Position_t : out  STD_LOGIC_VECTOR (31 downto 0);
			  Position_f : out  STD_LOGIC_VECTOR (31 downto 0));
end Q_Decoder;
 
architecture Behavioral of Q_Decoder is

 --- first wheel
signal QuadA_Delayed: unsigned(2 downto 0) := "000";
signal QuadB_Delayed: unsigned(2 downto 0) := "000";
 
signal Count_Enable: STD_LOGIC;
signal Count_Direction: STD_LOGIC;

signal Count: signed(31 downto 0) := (others => '0');--"00000000";
-----------------------------------
-----------------------------------
--- second wheel
signal QuadA_Delayed_s: unsigned(2 downto 0) := "000";
signal QuadB_Delayed_s: unsigned(2 downto 0) := "000";
 
signal Count_Enable_s: STD_LOGIC;
signal Count_Direction_s: STD_LOGIC;

signal Count_s: signed(31 downto 0) := (others => '0');--"00000000";
-----------------------------------
-----------------------------------
-- third wheel
signal QuadA_Delayed_t: unsigned(2 downto 0) := "000";
signal QuadB_Delayed_t: unsigned(2 downto 0) := "000";
 
signal Count_Enable_t: STD_LOGIC;
signal Count_Direction_t: STD_LOGIC;

signal Count_t: signed(31 downto 0) := (others => '0');--"00000000";
-----------------------------------
-----------------------------------
-- fourt wheel
signal QuadA_Delayed_f: unsigned(2 downto 0) := "000";
signal QuadB_Delayed_f: unsigned(2 downto 0) := "000";
 
signal Count_Enable_f: STD_LOGIC;
signal Count_Direction_f: STD_LOGIC;

signal Count_f: signed(31 downto 0) := (others => '0');--"00000000";
-----------------------------------
-----------------------------------
begin
 
--- first wheel
process (Clk)
begin
	if Clk='1' and Clk'event then
		QuadA_Delayed <= (QuadA_Delayed(1), QuadA_Delayed(0), QuadA);
		QuadB_Delayed <= (QuadB_Delayed(1), QuadB_Delayed(0), QuadB);
		if Count_Enable='1' then
			if Count_Direction='1' then
				Count <= Count + 1;
				Position <= std_logic_vector(Count);
			else
				Count <= Count - 1;
				Position <= std_logic_vector(Count);
			end if;
		end if;
	end if;
end process;
 
Count_Enable <= QuadA_Delayed(1) xor QuadA_Delayed(2) xor QuadB_Delayed(1)
				xor QuadB_Delayed(2);
Count_Direction <= QuadA_Delayed(1) xor QuadB_Delayed(2);

-----------------------------------
-----------------------------------
--- second wheel
process (Clk)
begin
	if Clk='1' and Clk'event then
		QuadA_Delayed_s <= (QuadA_Delayed_s(1), QuadA_Delayed_s(0), QuadA_s);
		QuadB_Delayed_s <= (QuadB_Delayed_s(1), QuadB_Delayed_s(0), QuadB_s);
		if Count_Enable_s='1' then
			if Count_Direction_s='1' then
				Count_s <= Count_s + 1;
				Position_s <= std_logic_vector(Count_s);
			else
				Count_s <= Count_s - 1;
				Position_s <= std_logic_vector(Count_s);
			end if;
		end if;
	end if;
end process;
 
Count_Enable_s <= QuadA_Delayed_s(1) xor QuadA_Delayed_s(2) xor QuadB_Delayed_s(1)
				xor QuadB_Delayed_s(2);
Count_Direction_s <= QuadA_Delayed_s(1) xor QuadB_Delayed_s(2);

-----------------------------------
-----------------------------------
-- third wheel
process (Clk)
begin
	if Clk='1' and Clk'event then
		QuadA_Delayed_t <= (QuadA_Delayed_t(1), QuadA_Delayed_t(0), QuadA_t);
		QuadB_Delayed_t <= (QuadB_Delayed_t(1), QuadB_Delayed_t(0), QuadB_t);
		if Count_Enable_t='1' then
			if Count_Direction_t='1' then
				Count_t <= Count_t + 1;
				Position_t <= std_logic_vector(Count_t);
			else
				Count_t <= Count_t - 1;
				Position_t <= std_logic_vector(Count_t);
			end if;
		end if;
	end if;
end process;
 
Count_Enable_t <= QuadA_Delayed_t(1) xor QuadA_Delayed_t(2) xor QuadB_Delayed_t(1)
				xor QuadB_Delayed_t(2);
Count_Direction_t <= QuadA_Delayed_t(1) xor QuadB_Delayed_t(2);

-----------------------------------
-----------------------------------
-- fourt wheel
process (Clk)
begin
	if Clk='1' and Clk'event then
		QuadA_Delayed_f <= (QuadA_Delayed_f(1), QuadA_Delayed_f(0), QuadA_f);
		QuadB_Delayed_f <= (QuadB_Delayed_f(1), QuadB_Delayed_f(0), QuadB_f);
		if Count_Enable_f='1' then
			if Count_Direction_f='1' then
				Count_f <= Count_f + 1;
				Position_f <= std_logic_vector(Count_f);
			else
				Count_f <= Count_f - 1;
				Position_f <= std_logic_vector(Count_f);
			end if;
		end if;
	end if;
end process;
 
Count_Enable_f <= QuadA_Delayed_f(1) xor QuadA_Delayed_f(2) xor QuadB_Delayed_f(1)
				xor QuadB_Delayed_f(2);
Count_Direction_f <= QuadA_Delayed_f(1) xor QuadB_Delayed_f(2);




 
end Behavioral;

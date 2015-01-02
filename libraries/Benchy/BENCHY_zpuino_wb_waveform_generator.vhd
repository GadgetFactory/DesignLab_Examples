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

entity BENCHY_zpuino_wb_waveform_generator is
  port (
  	wishbone_in : in std_logic_vector(100 downto 0);
	wishbone_out : out std_logic_vector(100 downto 0);
	 
	clk_in		: in  STD_LOGIC;
	 
	sin_out : OUT std_logic_vector(11 downto 0);
	cos_out : OUT std_logic_vector(11 downto 0);
	--squ_out : OUT std_logic_vector(11 downto 0);
	saw_out : OUT std_logic_vector(11 downto 0);
	
	sin_dac_out : OUT std_logic;	 
	cos_dac_out : OUT std_logic;
	squ_dac_out : OUT std_logic;
	saw_dac_out : OUT std_logic
	
	--all_dac_out : OUT std_logic
  );
end entity BENCHY_zpuino_wb_waveform_generator;



architecture rtl of BENCHY_zpuino_wb_waveform_generator is
	COMPONENT waveform_gen
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		phase_inc : IN std_logic_vector(31 downto 0);          
		sin_out : OUT std_logic_vector(11 downto 0);
		cos_out : OUT std_logic_vector(11 downto 0);
		squ_out : OUT std_logic_vector(11 downto 0);
		saw_out : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;
	
	COMPONENT AUDIO_zpuino_sa_sigmadeltaDAC
	  generic (
		 BITS: integer := 12
	  );
		port (
		 clk_96Mhz:      in std_logic;
		 --rst:      in std_logic;
		 data_in:  in std_logic_vector(BITS-1 downto 0);
		 audio_out: out std_logic
		 );
	end COMPONENT;	

--Define your registers here
	signal phase_inc_r : std_logic_vector(31 downto 0) := x"028c1980";	--x"028c1980" should give an output of 1Mhz. Wofram Alpha: x=10,y=(x*2^32)/(100 + .5)
--	signal waveform_sel: std_logic_vector(7 downto 0) := "00000010";				--Default to sine wave output
	signal dac_in_s: std_logic_vector(11 downto 0);
	signal sin_out_s: std_logic_vector(11 downto 0);
	signal cos_out_s: std_logic_vector(11 downto 0);
	signal squ_out_s: std_logic_vector(11 downto 0);
	signal saw_out_s: std_logic_vector(11 downto 0);
--  signal register0: std_logic_vector(31 downto 0); -- Register 0 (32 bits)
--  signal register1: std_logic_vector(31 downto 0); -- Register 1 (32 bits)
--  signal register2: std_logic_vector(7 downto 0);  -- Register 2 (8 bits)

	--signal nReset : std_logic;

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


  --nReset <= not wb_rst_i;
	
  -- Asynchronous acknowledge

  wb_ack_o <= '1' when wb_cyc_i='1' and wb_stb_i='1' else '0';

  -- Multiplex the data output (asynchronous)

  process(phase_inc_r, wb_adr_i)
  begin

    -- Multiplex the read depending on the address. Use only the 2 lowest bits of addr

    case wb_adr_i(3 downto 2) is
      when "00" =>
        wb_dat_o <= phase_inc_r;  -- Output register0
--      when "01" =>
--        wb_dat_o(31 downto 0) <= (others => '0'); -- We put all upper 24 bits to zero
--        wb_dat_o(7 downto 0) <= waveform_sel;        -- since register1 only has 8 bits		
--      when "10" =>
--        wb_dat_o(31 downto 0) <= (others => '0'); -- We put all upper 24 bits to zero
--        wb_dat_o(7 downto 0) <= register2;        -- since register2 only has 8 bits
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

        phase_inc_r <= (others => '0');
        --waveform_sel <= (others => '0');
--        register2 <= "10101010";

      else -- Not reset

        -- Check if someone is writing
        if wb_cyc_i='1' and wb_stb_i='1' and wb_we_i='1' then
          -- Yes, it's a write. See for which register based on address
          case wb_adr_i(3 downto 2) is
            when "00" =>
              phase_inc_r <= wb_dat_i;  -- Set register0
--            when "01" =>
--              waveform_sel <= wb_dat_i(7 downto 0);  -- Set register1
--            when "10" =>
--              register2 <= wb_dat_i(7 downto 0); -- Only lower 8 bits for register2
            when others =>
              null; -- Nothing to do for other addresses
          end case;

        end if;

      end if;

    end if;

  end process;
  
  sin_out <= sin_out_s;
  cos_out <= cos_out_s;
  --squ_out <= squ_out_s;
  saw_out <= saw_out_s;
  
	Inst_waveform_gen: waveform_gen PORT MAP(
		clk => wb_clk_i,
		reset => '1',
		phase_inc => phase_inc_r,		
		sin_out => sin_out_s,
		cos_out => cos_out_s,
		squ_out => squ_out_s,
		saw_out => saw_out_s
	);
	
	
	Inst_dac1: AUDIO_zpuino_sa_sigmadeltaDAC 
	generic MAP (
	   BITS => 12
	)	
	PORT MAP(
		audio_out => sin_dac_out,
		data_in => sin_out_s,
		clk_96Mhz => clk_in
	);		
	
	Inst_dac2: AUDIO_zpuino_sa_sigmadeltaDAC 
	generic MAP (
	   BITS => 12
	)	
	PORT MAP(
		audio_out => cos_dac_out,
		data_in => cos_out_s,
		clk_96Mhz => clk_in
	);		

	Inst_dac3: AUDIO_zpuino_sa_sigmadeltaDAC 
	generic MAP (
	   BITS => 12
	)	
	PORT MAP(
		audio_out => squ_dac_out,
		data_in => squ_out_s,
		clk_96Mhz => clk_in
	);		

	Inst_dac4: AUDIO_zpuino_sa_sigmadeltaDAC 
	generic MAP (
	   BITS => 12
	)	
	PORT MAP(
		audio_out => saw_dac_out,
		data_in => saw_out_s,
		clk_96Mhz => clk_in
	);				

--	process (waveform_sel,sin_out_s,cos_out_s,squ_out_s,saw_out_s)
--	begin
--		case waveform_sel(1 downto 0) is
--			when "00" => dac_in_s <= sin_out_s;
--			when "01" => dac_in_s <= cos_out_s;
--			when "10" => dac_in_s <= squ_out_s;
--			when "11" => dac_in_s <= saw_out_s;
--			when others => dac_in_s <= squ_out_s;
--		end case;
--	end process;	

end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tb_top is
end entity;

architecture sim of tb_top is


  signal wishbone_in:   std_logic_vector(100 downto 0);
	signal wishbone_out:  std_logic_vector(100 downto 0);
  signal wishbone_slot_video_in : std_logic_vector(100 downto 0);
  signal wishbone_slot_video_out : std_logic_vector(100 downto 0);
  signal la :std_logic_vector(31 downto 0) := x"00000001";

  -- Aliasing
  alias wb_clk_i: std_logic is wishbone_in(61);
  alias wb_rst_i: std_logic is wishbone_in(60);
  alias wb_dat_i: std_logic_vector(31 downto 0) is wishbone_in(59 downto 28);
  alias wb_adr_i: std_logic_vector(26 downto 2) is  wishbone_in(27 downto 3);
  alias wb_we_i:  std_logic is wishbone_in(2);
  alias wb_cyc_i: std_logic is wishbone_in(1);
  alias wb_stb_i: std_logic is wishbone_in(0);
  
  alias id: std_logic_vector(15 downto 0) is wishbone_out(49 downto 34);
  alias wb_dat_o: std_logic_vector(31 downto 0) is wishbone_out(33 downto 2);
  alias wb_ack_o: std_logic is wishbone_out(1);
  alias wb_inta_o: std_logic is wishbone_out(0);
-- End unpacking Wishbone array 

--Unpack DMA array
	alias mi_wb_dat_o: std_logic_vector(31 downto 0) is wishbone_slot_video_in(31 downto 0);
	alias mi_wb_adr_o: std_logic_vector(27 downto 0) is wishbone_slot_video_in(77 downto 50);
	alias mi_wb_we_o: std_logic is wishbone_slot_video_in(100);
	alias mi_wb_cyc_o: std_logic is wishbone_slot_video_in(99);
	alias mi_wb_stb_o: std_logic is wishbone_slot_video_in(98);
	
	alias mi_wb_dat_i: std_logic_vector(31 downto 0) is wishbone_slot_video_out(31 downto 0);
	alias mi_wb_ack_i: std_logic is wishbone_slot_video_out(100);
	alias mi_wb_stall_i:std_logic is wishbone_slot_video_out(99);

 -- SDRAM signals
  signal DRAM_ADDR   :    STD_LOGIC_VECTOR (12 downto 0);
  signal DRAM_BA      :   STD_LOGIC_VECTOR (1 downto 0);
  signal DRAM_CAS_N   :    STD_LOGIC;
  signal DRAM_CKE      :    STD_LOGIC;
  signal DRAM_CLK      :   STD_LOGIC;
  signal DRAM_CS_N   :    STD_LOGIC;
  signal DRAM_DQ      :  STD_LOGIC_VECTOR(15 downto 0);
  signal DRAM_DQM      :   STD_LOGIC_VECTOR(1 downto 0);
  signal DRAM_RAS_N   :   STD_LOGIC;
  signal DRAM_WE_N    :   STD_LOGIC;
  signal sram_addr:  std_logic_vector(18 downto 0);
  signal sram_data:  std_logic_vector(15 downto 0);
  signal sram_ce:    std_logic;
  signal sram_we:    std_logic;
  signal sram_oe:    std_logic;
  signal sram_be:    std_logic;
  signal sram_addr_i:  std_logic_vector(18 downto 0);
  signal sram_ce_i:    std_logic;
  signal sram_we_i:    std_logic;
  signal sram_oe_i:    std_logic;
  signal sram_be_i:    std_logic;


  signal clk: std_logic := '0';
  constant PERIOD: time := 31.25 ns;

begin

  clk <= not clk after 10.416667 ns;
  wb_clk_i<=clk;

  uut: entity work.BENCHY_wb_SumpBlaze_LogicAnalyzer32
	port map (
		wishbone_in   => wishbone_in,
		wishbone_out  => wishbone_out,
		wishbone_slot_video_in  => wishbone_slot_video_in,
		wishbone_slot_video_out => wishbone_slot_video_out,
		la                      => la
	);

  wb_rst_i<='0', '1' after 20 ns, '0' after 80 ns;


  -- Waveform
  process
  begin
    wait until rising_edge(clk);
    la <= la(30 downto 0) & la(31);
    wait until rising_edge(clk);
  end process;

  stim: process

    procedure wbwrite(addr: in std_logic_vector(31 downto 0); data: std_logic_vector(31 downto 0) ) is
    begin
      wait until rising_edge(clk);
      wait for 5 ns;
      wb_adr_i <= addr(26 downto 2);
      wb_dat_i <= data;
      wb_cyc_i<='1';
      wb_stb_i<='1';
      wb_we_i<='1';

      dly: loop
        wait until rising_edge(clk);
        if wb_ack_o='1' then

        wb_cyc_i<='0';
        wb_stb_i<='0';
        wb_we_i<='0';
        exit dly;
        end if;
      end loop;
    end procedure;

    procedure command(cmdin: in std_logic_vector(7 downto 0); data: std_logic_vector(31 downto 0) ) is
    begin
      wbwrite( x"0000" & "000000" & cmdin & "00", data );
    end procedure;
  begin
    wb_cyc_i<='0';
    wait for 1 us;
    wbwrite(x"00000400", x"00100000"); -- Base Address
    wbwrite(x"00000404", x"00200000"); -- End of memory

    command(x"00",x"00000000"); -- Reset
    command(x"C0",x"FFFFFFFE"); -- Mask
    command(x"C1",x"00000001"); -- Value
    command(x"C2",x"08000000"); -- Conf
    command(x"80",x"00000001"); -- Speed
    command(x"81",x"01000010"); -- Size
    command(x"82",x"00000000"); -- Flags
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      wait until rising_edge(clk);
    command(x"01",x"00000000"); -- Arm
      wait for 200 us;
    wbwrite(x"00000408", x"00000001"); -- Clear trigger indicator

  end process;


  memorystuff: block
    signal sysclk_sram_we: std_logic;
  begin

  sdram: entity work.mt48lc16m16a2
    GENERIC MAP  (
        addr_bits  => 12,
        data_bits  => 16,
        col_bits   => 8,
        index      => 0,
      	fname      => "sdram.srec"
    )
    PORT MAP (
        Dq    => DRAM_DQ,
        Addr  => DRAM_ADDR(11 downto 0),
        Ba    => DRAM_BA,
        Clk   => DRAM_CLK,
        Cke   => DRAM_CKE,
        Cs_n  => DRAM_CS_N,
        Ras_n => DRAM_RAS_N,
        Cas_n => DRAM_CAS_N,
        We_n  => DRAM_WE_N,
        Dqm   => DRAM_DQM
    );



  sram_addr <= transport sram_addr_i after 1.7 ns;
  sram_we <= transport sram_we_i after 1.9 ns;
  sram_oe <= transport sram_oe_i after 1.7 ns;
  sram_ce <= transport sram_ce_i after 1.7 ns;

  sysclk_sram_we <= transport wb_clk_i after 3 ns;

  sram_inst: entity work.sdram_ctrl
    port map (
      wb_clk_i    => wb_clk_i,
  	 	wb_rst_i    => wb_rst_i,
      wb_dat_o    => mi_wb_dat_i,
      wb_dat_i    => mi_wb_dat_o,
      wb_adr_i    => mi_wb_adr_o(26 downto 2),
      wb_we_i     => mi_wb_we_o,
      wb_cyc_i    => mi_wb_cyc_o,
      wb_stb_i    => mi_wb_stb_o,
      wb_sel_i    => "1111",--mi_wb_sel_o,
      wb_ack_o    => mi_wb_ack_i,
      wb_stall_o  => mi_wb_stall_i,

      clk_off_3ns => sysclk_sram_we,
      DRAM_ADDR   => DRAM_ADDR(11 downto 0),
      DRAM_BA     => DRAM_BA,
      DRAM_CAS_N  => DRAM_CAS_N,
      DRAM_CKE    => DRAM_CKE,
      DRAM_CLK    => DRAM_CLK,
      DRAM_CS_N   => DRAM_CS_N,
      DRAM_DQ     => DRAM_DQ,
      DRAM_DQM    => DRAM_DQM,
      DRAM_RAS_N  => DRAM_RAS_N,
      DRAM_WE_N   => DRAM_WE_N
    );

    DRAM_ADDR(12) <= '0';

  end block;

end sim;

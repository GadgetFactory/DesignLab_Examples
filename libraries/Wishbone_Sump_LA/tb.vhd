library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity la_tb is
end entity;

architecture sim of la_tb is

	signal cmd : std_logic_vector (39 downto 0) := (others => '0');
	signal memoryIn, memoryOut : std_logic_vector (35 downto 0);
	signal output : std_logic_vector (31 downto 0);
  signal la_input : std_logic_vector (31 downto 0) := x"00000001";

	signal clock : std_logic := '0';
	signal read, write, execute, send, busy, reset, run : std_logic;
	signal tx_bytes : integer range 0 to 4;
	signal extClockIn, extTriggerIn : std_logic;
  signal sysrst : std_logic;

  signal stb, cyc, stall, ack: std_logic;
  signal cti: std_logic_vector(2 downto 0);

begin

  clock <= not clock after 5 ns;
  sysrst <= '0', '1' after 10 ns, '0' after 30 ns;


	Inst_core: entity work.core
	port map(
		clock => clock,
    reset => reset,
		cmd => cmd,
    run => run,
		execute => execute,
		la_input => la_input,
		la_inputClock => extClockIn,
		output => output,
		outputSend => send,
		outputBusy => busy,
		memoryIn => memoryIn,
		memoryOut => memoryOut,
		memoryRead => read,
		memoryWrite => write,
		extTriggerIn => extTriggerIn,
		extTriggerOut => open,
		extClockOut => open,
		armLED => open,
		triggerLED => open,
		tx_bytes => tx_bytes
	);

  -- Waveform
  process
  begin
    wait until rising_edge(clock);
    la_input <= la_input(30 downto 0) & la_input(31);
    wait until rising_edge(clock);
  end process;

  stim: process

    procedure command(cmdin: in std_logic_vector(7 downto 0); data: std_logic_vector(31 downto 0) ) is
    begin
      wait until rising_edge(clock);
      cmd <= data & cmdin;
      execute<='1';
      wait until rising_edge(clock);
      execute<='0';
    end procedure;

  begin
    execute<='0';
    wait for 1 us;
    command(x"00",x"00000000"); -- Reset
    command(x"C0",x"FFFFFFFE"); -- Mask
    command(x"C1",x"00000001"); -- Value
    command(x"C2",x"08000000"); -- Conf
    command(x"80",x"00000001"); -- Speed
    command(x"81",x"01000010"); -- Size
    command(x"82",x"00000000"); -- Flags
      wait until rising_edge(clock);
      wait until rising_edge(clock);
      wait until rising_edge(clock);
      wait until rising_edge(clock);
      wait until rising_edge(clock);
      wait until rising_edge(clock);
    command(x"01",x"00000000"); -- Arm
      wait for 60 us;
  end process;


  sumpwb_inst: entity work.sump_wishbone
  port map (
    clk           => clock,
    rst           => sysrst,

    clock         => clock,
    reset         => reset,
    write         => write,
    memoryout     => memoryout(31 downto 0),
    run           => run,
    send          => send,
    -- DMA
    mi_wb_dat_i   => x"00000000",
    mi_wb_dat_o   => open,
    mi_wb_adr_o   => open,
    mi_wb_sel_o   => open,
    mi_wb_cti_o   => open,
    mi_wb_we_o    => open,
    mi_wb_cyc_o   => cyc,
    mi_wb_stb_o   => stb,
    mi_wb_ack_i   => ack,
    mi_wb_stall_i => stall

  );

  -- Memorysim - write only
  memsim: block
    type memstate_t is (IDLE, ACC, BURST);

    type memregs_t is record
      state: memstate_t;
      oddeven: std_logic;
      cnt:    integer;
      ack:    std_logic;
      queued: std_logic;
    end record;

    signal mr: memregs_t;

  begin
    process(clock, mr, cyc, stb)
      variable w: memregs_t;
    begin
      w := mr;

      case mr.state is
        when IDLE =>
          stall <= '0';
          ack <= '0';
          if cyc='1' and stb='1' then
            w.state := ACC;
            w.queued:='1';
            w.cnt := 6;
          end if;
        when ACC =>
          stall <= '1';
          if mr.cnt=0 then
            w.state := BURST;
            w.oddeven := '0';
          else
            w.cnt := mr.cnt - 1;
          end if;
        when BURST =>
          stall <= mr.oddeven;
          if mr.oddeven='0' and cyc='1' then
            w.oddeven := not mr.oddeven;
            w.queued:='1';
          else
            w.oddeven:= not cyc;
          end if;
      
          if mr.queued='1' then
            w.queued:= '0';
          end if;
          w.ack := w.queued;
          if cyc='0' then
            w.state := IDLE;
          end if;
        when others =>
      end case;
       ack <= mr.ack;

      if sysrst='1' then
        w.state := IDLE;
        w.ack := '0';
      end if;

      if rising_edge(clock) then
        mr <= w;
      end if;
    end process;
  end block;



end sim;

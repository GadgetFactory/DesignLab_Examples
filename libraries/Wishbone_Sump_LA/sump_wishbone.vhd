library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sump_wishbone is
  port (
    clk:          in std_logic;
    rst:          in std_logic;

    -- Signals to/from core
    clock:        in std_logic;
    reset:        in std_logic;
    write:        in std_logic;
    memoryOut:    in std_logic_vector(31 downto 0);
    run:          in std_logic;
    send:         in std_logic;
    -- DMA
    mi_wb_dat_i:  in std_logic_vector(31 downto 0);
    mi_wb_dat_o:  out std_logic_vector(31 downto 0);
    mi_wb_adr_o:  out std_logic_vector(27 downto 0);
    mi_wb_sel_o:  out std_logic_vector(3 downto 0);
    mi_wb_cti_o:  out std_logic_vector(2 downto 0);
    mi_wb_we_o:   out std_logic;
    mi_wb_cyc_o:  out std_logic;
    mi_wb_stb_o:  out std_logic;
    mi_wb_ack_i:  in std_logic;
    mi_wb_stall_i: in std_logic

  );
end entity sump_wishbone;

architecture behave of sump_wishbone is

  signal fifo_read : std_logic := '0';
  signal sob,eob,wnext,rnext: std_logic;
  signal fifo_almost_full, fifo_empty: std_logic;
  type fillstate_t is ( IDLE, FILL );
  type oregs_type is record
    state:  fillstate_t;
    sob:  std_logic;
    flush:  std_logic;
  end record;
  signal oregs: oregs_type;
  signal abort: std_logic := '0';
  signal fifo_data: std_logic_vector(31 downto 0);

begin

  fifo_inst: entity work.async_fifo
    generic map (
      address_bits    => 10,
      data_bits       => 32,
      threshold       => 900
    )
    port map (
      clk_r => clock,
      clk_w => clock,
      arst  => reset,
      wr    => write,
      rd    => fifo_read,
      write => memoryOut(31 downto 0),
      read  => fifo_data,
      almost_full  => fifo_almost_full,
      empty => fifo_empty
    );

    inst_burstctrl: entity work.wb_burstctrl
     generic map (
       WIDTH_BITS   => 16
     )
     port map (
       clk    => clock,
       rst    => rst,
       sob    => sob,
   
       rnext  => rnext,
       wnext  => wnext,
   
       stb    => mi_wb_stb_o,
       cyc    => mi_wb_cyc_o,
       cti    => mi_wb_cti_o,
       stall  => mi_wb_stall_i,
       ack    => mi_wb_ack_i,

       req    => open,
       eob    => eob
     );


  sob <= oregs.sob;

  -- Outputter
  process(clock,oregs, fifo_empty, send, abort, wnext, eob)
    variable w: oregs_type;
  begin
    w:=oregs;

    case oregs.state is
      when IDLE =>
        w.sob:='0';
        if send='1' then
          w.flush := '1';
        end if;

        if fifo_almost_full='1' or oregs.flush='1' then
          fifo_read <= not fifo_empty;
          w.state := FILL;
          w.sob :='1';
        end if;

      when FILL =>
        if fifo_empty='1' then
          fifo_read<='0';
        else
          fifo_read <= wnext;
        end if;
        w.sob := '0';
        if send='1' then
          w.flush := '1';
        end if;

        if abort='1' then --
        end if;

        if send='1' then
          w.flush := '1';
        end if;

        if eob='1' then
          if oregs.flush='0' then
            w.state := IDLE;
          else
            -- Need to flush
            fifo_read <= not fifo_empty;

            if fifo_empty='1' then
              w.state := IDLE;
            else
              w.sob :='1';
            end if;

            w.flush := not fifo_empty;
          end if;
        end if;
          
      when others =>
    end case;

    if rst='1' then
      w.state := IDLE;
      w.sob :='0';
      w.flush :='0';
    end if;

    if rising_edge(clock) then
      oregs<=w;
    end if;
  end process;

end behave;

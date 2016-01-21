library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sump_wishbone is
  port (
    clk:          in std_logic;
    rst:          in std_logic;
    -- Main wishbone signals
    wb_dat_i:     in std_logic_vector(31 downto 0); -- Wishbone data input  (32 bits)
    wb_adr_i:     in std_logic_vector(26 downto 2); -- Wishbone address input  (32 bits)
    wb_we_i:      in std_logic;                     -- Wishbone write enable signal
    wb_cyc_i:     in std_logic;                     -- Wishbone cycle signal
    wb_stb_i:     in std_logic;                     -- Wishbone strobe  signal

    wb_dat_o:     out std_logic_vector(31 downto 0); -- Wishbone data output (32 bits)
    wb_ack_o:     out std_logic;                      -- Wishbone acknowledge out signal



    -- Signals to/from core
    --clock:        in std_logic;
    reset:        in std_logic;
    write:        in std_logic;
    memoryOut:    in std_logic_vector(31 downto 0);
    run:          in std_logic;
    send:         in std_logic;
    cmd:          out std_logic_vector(39 downto 0);
    execute:      out std_logic;
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
    sob:    std_logic;
    flush:  std_logic;
    addr:   unsigned(27 downto 0); -- Current address
  end record;
  signal oregs: oregs_type;
  signal abort: std_logic := '0';
  signal fifo_data: std_logic_vector(31 downto 0);

  type rregs_type is record
    ack:  std_logic;
    triggered: std_logic;
    baddr:  unsigned(27 downto 0); -- Base address
    asize:  unsigned(27 downto 0); -- Address size
  end record;
  signal rregs:  rregs_type;

  signal memidle: std_logic;

begin

  fifo_inst: entity work.async_fifo
    generic map (
      address_bits    => 10,
      data_bits       => 32,
      threshold       => 900
    )
    port map (
      clk_r => clk,
      clk_w => clk,
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
       clk    => clk,
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

  mi_wb_adr_o <= std_logic_vector(oregs.addr);
  mi_wb_dat_o <= fifo_data;
  mi_wb_we_o  <= '1';

  sob <= oregs.sob;

  memidle<='1' when oregs.state=IDLE else '0';

  -- Outputter
  process(clk,oregs, fifo_empty, send, abort, wnext, eob, rregs, fifo_almost_full)
    variable w: oregs_type;
    variable addrinc: unsigned(27 downto 0);
  begin
    w:=oregs;

    addrinc := oregs.addr + 4;

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
        if wnext='1' then
          if (addrinc > rregs.asize) then
            w.addr := rregs.baddr;  -- Wrap
          else
            w.addr := addrinc;
          end if;
        end if;

        w.sob := '0';

        if send='1' then
          w.flush := '1';
        end if;

        if abort='1' then --
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

    if reset='1' then
      w.addr := rregs.baddr;
    end if;

    if rst='1' then
      w.state := IDLE;
      w.sob :='0';
      w.flush :='0';
    end if;

    if rising_edge(clk) then
      oregs<=w;
    end if;
  end process;


  -- Register access

  cmd <=  wb_dat_i & wb_adr_i(9 downto 2);

  process(clk,rst,wb_dat_i, wb_adr_i, wb_we_i, wb_cyc_i, wb_stb_i, rregs, wb_dat_i, run)
    variable w: rregs_type;
  begin
    w:=rregs;
    w.ack:='0';
    execute<='0';
    if run='1' then
      w.triggered := '1';
    end if;

    if wb_cyc_i='1' and wb_stb_i='1' and rregs.ack='0' then
      if wb_we_i='1' then
        -- Writes
        if wb_adr_i(10)='0' then
          -- Direct SUMP writes
          execute<='1';
        else
          case wb_adr_i(3 downto 2) is
            when "00" =>
              w.baddr := unsigned( wb_dat_i(w.baddr'RANGE));
            when "01" =>
              w.asize := unsigned( wb_dat_i(w.asize'RANGE));
            when "10" =>
              if wb_dat_i(0)='1' then
                w.triggered:='0';
              end if;
            when others =>
          end case;

        end if;
        wb_dat_o(31 downto 2)<=(others => '0');
        wb_dat_o(0) <= memidle;
        wb_dat_o(1) <= rregs.triggered;
      end if;
      w.ack:='1';
    end if;

    if rst='1' then
      w.ack:='0';
      w.triggered:='0';
    end if;

    if rising_edge(clk) then
      rregs<=w;
    end if;
  end process;

  wb_ack_o <= rregs.ack;

end behave;

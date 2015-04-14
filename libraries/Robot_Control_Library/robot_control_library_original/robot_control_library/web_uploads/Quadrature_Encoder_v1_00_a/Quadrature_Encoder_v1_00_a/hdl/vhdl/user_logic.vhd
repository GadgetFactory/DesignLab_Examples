------------------------------------------------------------------------------
-- user_logic.vhd - entity/architecture pair
------------------------------------------------------------------------------
--
-- ***************************************************************************
-- **                                                                       **
-- **                                                                       **
-- ***************************************************************************
--
------------------------------------------------------------------------------
-- Filename:          user_logic.vhd
-- Version:           1.00.a
-- Description:       User logic.
-- Date:              Tue Oct 12 08:23:33 2005
-- VHDL Standard:     VHDL'93
------------------------------------------------------------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   clock signals:                         "clk", "clk_div#", "clk_#x"
--   reset signals:                         "rst", "rst_n"
--   generics:                              "C_*"
--   user defined types:                    "*_TYPE"
--   state machine next state:              "*_ns"
--   state machine current state:           "*_cs"
--   combinatorial signals:                 "*_com"
--   pipelined or register delay signals:   "*_d#"
--   counter signals:                       "*cnt*"
--   clock enable signals:                  "*_ce"
--   internal version of output port:       "*_i"
--   device pins:                           "*_pin"
--   ports:                                 "- Names begin with Uppercase"
--   processes:                             "*_PROCESS"
--   component instantiations:              "<ENTITY_>I_<#|FUNC>"
------------------------------------------------------------------------------

-- DO NOT EDIT BELOW THIS LINE --------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library proc_common_v2_00_a;
use proc_common_v2_00_a.proc_common_pkg.all;
-- DO NOT EDIT ABOVE THIS LINE --------------------

--USER libraries added here
library Quadrature_Encoder_v1_00_a;
use Quadrature_Encoder_v1_00_a.all;

------------------------------------------------------------------------------
-- Entity section
------------------------------------------------------------------------------
-- Definition of Generics:
--   C_DWIDTH                     -- User logic data bus width
--   C_NUM_CE                     -- User logic chip enable bus width
--
-- Definition of Ports:
--   Bus2IP_Clk                   -- Bus to IP clock
--   Bus2IP_Reset                 -- Bus to IP reset
--   Bus2IP_Data                  -- Bus to IP data bus for user logic
--   Bus2IP_BE                    -- Bus to IP byte enables for user logic
--   Bus2IP_RdCE                  -- Bus to IP read chip enable for user logic
--   Bus2IP_WrCE                  -- Bus to IP write chip enable for user logic
--   IP2Bus_Data                  -- IP to Bus data bus for user logic
--   IP2Bus_Ack                   -- IP to Bus acknowledgement
--   IP2Bus_Retry                 -- IP to Bus retry response
--   IP2Bus_Error                 -- IP to Bus error response
--   IP2Bus_ToutSup               -- IP to Bus timeout suppress
------------------------------------------------------------------------------

entity user_logic is
  generic
  (
    -- ADD USER GENERICS BELOW THIS LINE ---------------
    C_QE_INST : integer := 1;
    C_QE_CLK_COUNT_WIDTH : integer := 32;
    C_QE_PULSE_COUNT_WIDTH : integer := 32;
    C_QE_REV_COUNT_WIDTH : integer := 32;
    C_QE_NUM_COUNT : integer := 5;
    C_QE_SPEED_WIDTH : integer := 32;
    C_QE_ACCELERATION_WIDTH : integer := 32;
    C_QE_SPEED_TYPE : integer := 0;
    -- C_QE_OPB_ENABLED : integer := 1;
    -- ADD USER GENERICS ABOVE THIS LINE ---------------

    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol parameters, do not add to or delete
    C_DWIDTH                       : integer              := 32;
    C_NUM_CE                       : integer              := C_QE_INST*4
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );
  port
  (
    -- ADD USER PORTS BELOW THIS LINE ------------------
    ABI_CON : in std_logic_vector(0 to C_QE_INST*3-1);
    TIMER_CLK : in std_logic;
    PULSE_COUNT_OUT : out signed((C_QE_INST*C_QE_PULSE_COUNT_WIDTH)-1 downto 0);
    REV_COUNT_OUT : out signed((C_QE_INST*C_QE_REV_COUNT_WIDTH)-1 downto 0);
    SPEED_OUT : out signed((C_QE_INST*C_QE_SPEED_WIDTH)-1 downto 0);
    ACCELERATION_OUT : out signed((C_QE_INST*C_QE_ACCELERATION_WIDTH)-1 downto 0);
    -- ADD USER PORTS ABOVE THIS LINE ------------------

    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol ports, do not add to or delete
    Bus2IP_Clk                     : in  std_logic;
    Bus2IP_Reset                   : in  std_logic;
    Bus2IP_Data                    : in  std_logic_vector(0 to C_DWIDTH-1);
    Bus2IP_BE                      : in  std_logic_vector(0 to C_DWIDTH/8-1);
    Bus2IP_RdCE                    : in  std_logic_vector(0 to C_NUM_CE-1);
    Bus2IP_WrCE                    : in  std_logic_vector(0 to C_NUM_CE-1);
    IP2Bus_Data                    : out std_logic_vector(0 to C_DWIDTH-1);
    IP2Bus_Ack                     : out std_logic;
    IP2Bus_Retry                   : out std_logic;
    IP2Bus_Error                   : out std_logic;
    IP2Bus_ToutSup                 : out std_logic
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );
end entity user_logic;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of user_logic is

  --USER signal declarations added here, as needed for user logic
  
  component quad_inst is
    generic (
      C_QE_CLK_COUNT_WIDTH : integer := 32;
      C_QE_PULSE_COUNT_WIDTH : integer := 32;
      C_QE_REV_COUNT_WIDTH : integer := 32;
      C_QE_NUM_COUNT : integer := 5;
      C_QE_SPEED_WIDTH : integer := 32;
      C_QE_ACCELERATION_WIDTH : integer := 32;
      C_QE_SPEED_TYPE : integer := 0
    );
    Port(
        CLK : in std_logic; -- clk for timer
        Reset : in std_logic; -- reset
        A_CLK : in std_logic; -- clk
        B_CLK : in std_logic; -- 90 phase clk
        I_CLK : in std_logic; -- Revolutions clk
        PULSE_COUNT : out signed(C_QE_PULSE_COUNT_WIDTH-1 downto 0); -- pulse count 
        REV_COUNT : out signed(C_QE_REV_COUNT_WIDTH-1 downto 0); -- Revolutions count
        TSPEED : out signed(C_QE_SPEED_WIDTH-1 downto 0); -- number of clk's between 1 puls
        TACCEL : out signed(C_QE_ACCELERATION_WIDTH-1 downto 0)  -- number of clk's between each speed measurement
    );
  end component;

  signal input_list : std_logic_vector(0 to C_QE_INST*3-1);
  type pulse_count_reg_type is array (0 to C_QE_INST-1) of signed(C_QE_PULSE_COUNT_WIDTH-1 downto 0);
  signal pulse_count_reg : pulse_count_reg_type;
  type rev_count_reg_type is array (0 to C_QE_INST-1) of signed(C_QE_REV_COUNT_WIDTH-1 downto 0);
  signal rev_count_reg : rev_count_reg_type;
  type speed_reg_type is array (0 to C_QE_INST-1) of signed(C_QE_SPEED_WIDTH-1 downto 0);
  signal speed_reg : speed_reg_type;
  type accel_reg_type is array (0 to C_QE_INST-1) of signed(C_QE_ACCELERATION_WIDTH-1 downto 0);
  signal accel_reg : accel_reg_type;
    
  function vector_or (bv: in std_logic_vector) return std_logic is
    variable result : std_logic := '0';
  begin
    for index in bv'range loop
      result := result or bv(index);
    end loop;
    return result;
  end function vector_or;

--  ------------------------------------------
  -- Signals for user logic slave model s/w accessible register example
  ------------------------------------------
  signal slv_reg_write_select           : std_logic_vector(0 to C_NUM_CE-1);
  signal slv_reg_read_select            : std_logic_vector(0 to C_NUM_CE-1);
  signal slv_ip2bus_data                : std_logic_vector(0 to C_DWIDTH-1);
  signal slv_read_ack                   : std_logic;
  signal slv_write_ack                  : std_logic;

begin

  --USER logic implementation added here  
  QEGEN: for i in 0 to C_QE_INST-1 generate
--    OPB_ENABLED: if C_QE_OPB_ENABLED = 1 generate
--      driver : quad_inst 
--      generic map (
--        C_QE_CLK_COUNT_WIDTH => C_QE_CLK_COUNT_WIDTH,
--        C_QE_PULSE_COUNT_WIDTH => C_QE_PULSE_COUNT_WIDTH,
--        C_QE_REV_COUNT_WIDTH => C_QE_REV_COUNT_WIDTH,
--        C_QE_NUM_COUNT => C_QE_NUM_COUNT,
--        C_QE_SPEED_WIDTH => C_QE_SPEED_WIDTH,
--        C_QE_ACCELERATION_WIDTH => C_QE_ACCELERATION_WIDTH,
--        C_QE_SPEED_TYPE => C_QE_SPEED_TYPE
--      )
--      port map (
--        CLK => TIMER_CLK,
--        Reset => Bus2IP_Reset,
--        A_CLK => input_list(i*3),
--        B_CLK => input_list(i*3+1),
--        I_CLK => input_list(i*3+2),
--        PULSE_COUNT => pulse_count_reg(i),
--        REV_COUNT => rev_count_reg(i),
--        TSPEED => speed_reg(i),
--        TACCEL => accel_reg(i) 
--      );
--    end generate;
--
--    OPB_DISABLED: if C_QE_OPB_ENABLED = 0 generate
      driver : quad_inst 
      generic map (
        C_QE_CLK_COUNT_WIDTH => C_QE_CLK_COUNT_WIDTH,
        C_QE_PULSE_COUNT_WIDTH => C_QE_PULSE_COUNT_WIDTH,
        C_QE_REV_COUNT_WIDTH => C_QE_REV_COUNT_WIDTH,
        C_QE_NUM_COUNT => C_QE_NUM_COUNT,
        C_QE_SPEED_WIDTH => C_QE_SPEED_WIDTH,
        C_QE_ACCELERATION_WIDTH => C_QE_ACCELERATION_WIDTH,
        C_QE_SPEED_TYPE => C_QE_SPEED_TYPE
      )
      port map (
        CLK => TIMER_CLK,
        Reset => Bus2IP_Reset,
        A_CLK => input_list(i*3),
        B_CLK => input_list(i*3+1),
        I_CLK => input_list(i*3+2),

        PULSE_COUNT => pulse_count_reg(i),
        REV_COUNT => rev_count_reg(i),
        TSPEED => speed_reg(i),
        TACCEL => accel_reg(i) 
--        PULSE_COUNT => PULSE_COUNT_OUT(((i+1)*C_QE_PULSE_COUNT_WIDTH)-1 downto i*C_QE_PULSE_COUNT_WIDTH),
--        REV_COUNT => REV_COUNT_OUT(((i+1)*C_QE_REV_COUNT_WIDTH)-1 downto i*C_QE_REV_COUNT_WIDTH),
--        TSPEED => SPEED_OUT(((i+1)*C_QE_SPEED_WIDTH)-1 downto i*C_QE_SPEED_WIDTH),
--        TACCEL => ACCELERATION_OUT(((i+1)*C_QE_ACCELERATION_WIDTH)-1 downto i*C_QE_ACCELERATION_WIDTH)
      );
--    end generate;
    PULSE_COUNT_OUT(((i+1)*C_QE_PULSE_COUNT_WIDTH)-1 downto i*C_QE_PULSE_COUNT_WIDTH) <= pulse_count_reg(i);
    REV_COUNT_OUT(((i+1)*C_QE_REV_COUNT_WIDTH)-1 downto i*C_QE_REV_COUNT_WIDTH) <= rev_count_reg(i);
    SPEED_OUT(((i+1)*C_QE_SPEED_WIDTH)-1 downto i*C_QE_SPEED_WIDTH) <= speed_reg(i);
    ACCELERATION_OUT(((i+1)*C_QE_ACCELERATION_WIDTH)-1 downto i*C_QE_ACCELERATION_WIDTH) <= accel_reg(i);
  end generate;

--  ------------------------------------------
  -- code to read/write user logic slave model s/w accessible registers
  --    Bus2IP_WrCE or   Memory Mapped
  --       Bus2IP_RdCE   Register
  --            "1000"   C_BASEADDR + 0x0
  --            "0100"   C_BASEADDR + 0x4
  -- 
  ------------------------------------------
  slv_reg_write_select <= Bus2IP_WrCE(0 to C_NUM_CE-1);
  slv_reg_read_select  <= Bus2IP_RdCE(0 to C_NUM_CE-1);
  slv_write_ack        <= vector_or(Bus2IP_WrCE);
  slv_read_ack         <= vector_or(Bus2IP_RdCE);
--  slv_write_ack        <= Bus2IP_WrCE(0);
--  slv_read_ack         <= Bus2IP_RdCE(0);

  -- implement slave model register(s)
  SLAVE_REG_WRITE_PROC : process( Bus2IP_Clk ) is
  variable reg_select : bit_vector(0 to C_NUM_CE-1);
  --type clk_count_type is array (0 to C_SDC_INST-1) of std_logic_vector(C_SDC_RESOLUTION-1+12 downto 0);
  --variable clk_count : clk_count_type;
	begin
    if Bus2IP_Clk'event and Bus2IP_Clk = '1' then
      if Bus2IP_Reset = '1' then
        -- Reset 
        for i in 0 to C_QE_INST-1 loop
 ---         --MULTISOURCE???????pulse_count_reg(i) <= (others => '0');
          
        end loop;
        --for i in 0 to C_SDC_INST-1 loop
        --  enable_pins(i*2) <= '0';
        --  enable_pins(i*2+1) <= '0';
        --end loop;
      else
        reg_select := (0 => '1', others => '0');
        for i in 0 to C_QE_INST-1 loop
          if slv_reg_write_select = To_StdLogicVector(reg_select) then
            --hold_bit_reg(i) <= Bus2IP_Data(0);
            --dir_bit_reg(i) <= Bus2IP_Data(1);
            --enable_pins(i*2) <= Bus2IP_Data(2);
            --enable_pins(i*2+1) <= Bus2IP_Data(2);
            --clk_div_reg(i) <= Bus2IP_Data(3 to C_SDC_RESOLUTION+2);
            --enable_count_reg(i) <= Bus2IP_Data(C_SDC_RESOLUTION+3 to C_SDC_RESOLUTION+C_SDC_STEP_COUNT+2);
          end if;
          --if clk_count(i)(C_SDC_RESOLUTION-1+12 downto 12)=clk_div_reg(i) then
            --clk_count(i) := (others => '0');
            ---- Update clk
            --if clk_reg(i)='0' then clk_reg(i)<='1'; else clk_reg(i)<='0'; end if;
            ---- if enable_count reached zero turn of stepper
            --if enable_count_reg(i)>0 then
--              enable_bit_reg(i) <= '1';
              --enable_count_reg(i) <= enable_count_reg(i)-1;            
            --else
              --enable_bit_reg(i) <= '0';
            --end if;
          --end if;
          --clk_count(i) := clk_count(i)+1;
          reg_select := reg_select srl 1;
        end loop;  -- i
      end if;
    end if;
	end process SLAVE_REG_WRITE_PROC;


  SLAVE_REG_READ_PROC : process( slv_reg_read_select ) is
  variable reg_select : bit_vector(0 to C_NUM_CE-1);
	begin
    reg_select := (0 => '1', others => '0');
    for i in 0 to C_QE_INST-1 loop
      if slv_reg_read_select = To_StdLogicVector(reg_select) then  
        -- pulse count
        -- Set upper part of bus to pulse register.. 
        slv_ip2bus_data(C_DWIDTH-C_QE_PULSE_COUNT_WIDTH to C_DWIDTH-1) 
            <= conv_std_logic_vector(pulse_count_reg(i), C_QE_PULSE_COUNT_WIDTH);
        -- if the pulse count is negative the most significant bit (msb)
        -- will be '1' and the opb bus (all 32 bit) is set accordingly.
        slv_ip2bus_data(0 to C_DWIDTH-C_QE_PULSE_COUNT_WIDTH-1) <= (others => pulse_count_reg(i)(C_QE_PULSE_COUNT_WIDTH-1));
      end if;
        
      reg_select := reg_select srl 1;
      if slv_reg_read_select = To_StdLogicVector(reg_select) then
        -- rev count
        slv_ip2bus_data(C_DWIDTH-C_QE_REV_COUNT_WIDTH to C_DWIDTH-1) 
            <= conv_std_logic_vector(rev_count_reg(i), C_QE_REV_COUNT_WIDTH);
        slv_ip2bus_data(0 to C_DWIDTH-C_QE_REV_COUNT_WIDTH-1) <= (others => rev_count_reg(i)(C_QE_REV_COUNT_WIDTH-1));
  	  end if;

      reg_select := reg_select srl 1;
      if slv_reg_read_select = To_StdLogicVector(reg_select) then
        --speed
        slv_ip2bus_data(C_DWIDTH-C_QE_SPEED_WIDTH to C_DWIDTH-1) 
            <= conv_std_logic_vector(speed_reg(i), C_QE_SPEED_WIDTH);
        slv_ip2bus_data(0 to C_DWIDTH-C_QE_SPEED_WIDTH-1) <= (others => speed_reg(i)(C_QE_SPEED_WIDTH-1));
  	  end if;

      reg_select := reg_select srl 1;
      if slv_reg_read_select = To_StdLogicVector(reg_select) then
        --accel
        slv_ip2bus_data(C_DWIDTH-C_QE_ACCELERATION_WIDTH to C_DWIDTH-1) 
            <= conv_std_logic_vector(accel_reg(i), C_QE_ACCELERATION_WIDTH);
        slv_ip2bus_data(0 to C_DWIDTH-C_QE_ACCELERATION_WIDTH-1) <= (others => accel_reg(i)(C_QE_ACCELERATION_WIDTH-1));
  	  end if;
      reg_select := reg_select srl 1;
    end loop; 
  end process SLAVE_REG_READ_PROC;

  ------------------------------------------
  -- code to drive IP to Bus signals
  ------------------------------------------
  -- input to quadrature encoder
  input_list         <= ABI_CON;
  IP2Bus_Data        <= slv_ip2bus_data;
  IP2Bus_Ack         <= slv_write_ack or slv_read_ack;
  IP2Bus_Error       <= '0';
  IP2Bus_Retry       <= '0';
  IP2Bus_ToutSup     <= '0';  

end IMP;

-- This wonderful Block RAM module is from Dan Strother's website.
-- http://danstrother.com/2010/09/11/inferring-rams-in-fpgas/

-- A parameterized, inferable, true dual-port, dual-clock block RAM in VHDL.
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity BRAM36k8bit is
generic (
    DATA    : integer := 8;
    ADDR    : integer := 15
);
port (
    -- Port A
    a_clk   : in  std_logic;
    a_we    : in  std_logic;
    a_addr  : in  std_logic_vector(ADDR-1 downto 0);
    a_din   : in  std_logic_vector(DATA-1 downto 0);
    a_dout  : out std_logic_vector(DATA-1 downto 0);
     
    -- Port B
    b_clk   : in  std_logic;
    b_we    : in  std_logic;
    b_addr  : in  std_logic_vector(ADDR-1 downto 0);
    b_din   : in  std_logic_vector(DATA-1 downto 0);
    b_dout  : out std_logic_vector(DATA-1 downto 0)
);
end BRAM36k8bit;
 
architecture rtl of BRAM36k8bit is
    -- Shared memory
    type mem_type is array ( (2**ADDR)-1 downto 0 ) of std_logic_vector(DATA-1 downto 0);
    shared variable mem : mem_type;
begin
 
-- Port A
process(a_clk)
begin
    if(a_clk'event and a_clk='1') then
        if(a_we='1') then
            mem(conv_integer(a_addr)) := a_din;
        end if;
        a_dout <= mem(conv_integer(a_addr));
    end if;
end process;
 
-- Port B
process(b_clk)
begin
    if(b_clk'event and b_clk='1') then
        if(b_we='1') then
            mem(conv_integer(b_addr)) := b_din;
        end if;
        b_dout <= mem(conv_integer(b_addr));
    end if;
end process;
 
end rtl;
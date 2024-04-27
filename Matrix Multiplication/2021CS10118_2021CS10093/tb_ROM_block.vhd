library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
ENTITY tb_ROM_block IS
END tb_ROM_block;
ARCHITECTURE behavior OF tb_ROM_block IS
COMPONENT dist_mem_gen_2
  PORT (
  a : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
  d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  clk : IN STD_LOGIC;
  we : IN STD_LOGIC;
  spo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));

END COMPONENT;
--Inputs
signal clk : std_logic := '0';
signal we : std_logic := '1';
signal rdaddress : std_logic_vector(13 downto 0) := (others => '0');
--Outputs
signal data ,d: std_logic_vector(15 downto 0) := (others => '0');
-- Clock period definitions
constant clock_period : time := 100 ns;
signal i: integer;
BEGIN
-- Read image in VHDL
uut: dist_mem_gen_2 PORT MAP (
spo => data,
a => rdaddress,
d => d,
clk => clk,
we => we
);
-- Clock process definitions
clock_process :process
begin
clk <= '0';
wait for clock_period/2;
clk <= '1';
wait for clock_period/2;
end process;
-- Stimulus process
stim_proc: process
begin
for i in 0 to 16383 loop
rdaddress <= std_logic_vector(to_unsigned(i, 14));
wait for 20 ns;
end loop;
wait;
end process;
END;
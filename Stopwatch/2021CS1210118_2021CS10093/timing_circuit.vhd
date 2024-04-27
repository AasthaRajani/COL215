----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2022 05:53:56 PM
-- Design Name: 
-- Module Name: timing_circuit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timing_circuit is
--  Port ( );
    Port (clk : in std_logic;
          clk_out : out std_logic);
end timing_circuit;

architecture Behavioral of timing_circuit is
signal count : integer :=0;
signal tmp : std_logic := '0';
begin
process(clk)
begin
if rising_edge(clk) then
    count <= count +1;
    if count = 5000000 then
        tmp <= not tmp;
        count <= 0;
    end if;
clk_out <= tmp;
end if;
end process;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2022 04:33:47 PM
-- Design Name: 
-- Module Name: register - Behavioral
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

entity register_2 is
--  Port ( );
    Port( reg_2_cmd : in std_logic;
          din : in std_logic_vector(15 downto 0);
          read : in std_logic;
          write : in std_logic;
          dout: out std_logic_vector(15 downto 0));

end register_2;

architecture Behavioral of register_2 is
signal temp : std_logic_vector(15 downto 0);
begin
process(reg_2_cmd)
begin
if reg_2_cmd='1' then
    if read = '1' then
        temp <= din;
    elsif write = '1' then
        temp <= (others=>'0');
   end if;
end if;
dout<=temp;
end process;

end Behavioral;

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

entity registe is
--  Port ( );
    Port( 
          reg_1_cmd : in std_logic;
          din : in std_logic_vector(7 downto 0);
          read : in std_logic;
          write : in std_logic;
          dout: out std_logic_vector(7 downto 0));

end registe;

architecture Behavioral of registe is

begin
process(reg_1_cmd,read,write)
begin
if reg_1_cmd='1' then
    if write = '1' then
        dout <= din;
    elsif read = '1' then
        dout <= (others=>'0');
    end if;
end if;
end process;

end Behavioral;

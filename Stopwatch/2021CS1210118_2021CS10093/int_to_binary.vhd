----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2022 07:43:49 PM
-- Design Name: 
-- Module Name: int_to_binary - Behavioral
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

entity int_to_binary is
--  Port ( );
    Port ( a : in integer;
           b1, b2, b3, b4 : out std_logic);
end int_to_binary;

architecture Behavioral of int_to_binary is

begin
process(a)
begin
    if a = 0 then
         b1 <= '0';
         b2 <= '0';
         b3 <= '0';
         b4 <= '0';
    elsif a = 1 then
        b1 <= '1';
        b2 <= '0';
        b3 <= '0';
        b4 <= '0';
    elsif a=2 then
        b1 <= '0';
        b2 <= '1';
        b3 <= '0';
        b4 <= '0';
    elsif a = 3 then 
        b1 <= '1';
        b2 <= '1';
        b3 <= '0';
        b4 <= '0';
    elsif a = 4 then
        b1 <= '0';
        b2 <= '0';
        b3 <= '1';
        b4 <= '0';
    elsif a = 5 then
        b1 <= '1';
        b2 <= '0';
        b3 <= '1';
        b4 <= '0';
    elsif a = 6 then
        b1 <= '0';
        b2 <= '1';
        b3 <= '1';
        b4 <= '0';
    elsif a = 7 then
        b1 <= '1';
        b2 <= '1';
        b3 <= '1';
        b4 <= '0';
    elsif a = 8 then
        b1 <= '0';
        b2 <= '0';
        b3 <= '0';
        b4 <= '1';
    else 
        b1 <= '1';
        b2 <= '0';
        b3 <= '0';
        b4 <= '1';
    end if;
end process;


end Behavioral;

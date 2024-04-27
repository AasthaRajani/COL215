----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.10.2022 14:16:31
-- Design Name: 
-- Module Name: switch - Behavioral
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

entity switch is
--  Port ( );
    Port ( clk : in std_logic;
    start : in std_logic;
           reset : in std_logic;
           pause : in std_logic;
           continue : in std_logic;
           enable_watch : out std_logic;
           reset_watch : out std_logic);
end switch;

architecture Behavioral of switch is
SIGNAL start_prev,pause_prev,reset_prev,continue_prev,c : std_logic := '0';
begin
--reset_watch <= reset ;
process(clk)
begin 
if rising_edge(clk) then 
if start/= start_prev then
if start ='1' then
    enable_watch <= '1';
    reset_watch<='0';
end if;
c<= start;
start_prev <= c;
end if;

if pause_prev /= pause then
    if  pause = '1' then
        enable_watch <= '0';
        reset_watch<='0';
    end if;
    c<=pause;
 pause_prev <= c;
elsif  continue_prev /= continue then
    if continue = '1' then
        enable_watch <= '1';
        reset_watch <= '0';
    end if;
    c<=continue;
  continue_prev <= c;
elsif reset_prev /= reset then
    if reset = '1' then
        enable_watch <= '1' ;
        reset_watch <= '1';
    end if;
   c<=reset;
  reset_prev <= c;
end if;
end if;
end process;
end Behavioral;

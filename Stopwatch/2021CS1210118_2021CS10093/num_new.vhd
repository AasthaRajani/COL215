----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2022 14:35:29
-- Design Name: 
-- Module Name: num_new - Behavioral
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

entity num_new is
--  Port ( );
    Port( clk : in std_logic;
          int1 , int2 , int3, int4 : out integer;
          out_wave : out std_logic;
          enable_watch : in std_logic;
          reset_watch : in std_logic);
end num_new;

architecture Behavioral of num_new is
signal temp1, temp2 , temp3 , temp4 : std_logic :='1';
signal count1 , count2 ,count3 , count4: integer := 0;
signal o1,o2,o3 : std_logic;

begin
process(clk, enable_watch)
begin
if reset_watch = '1' then
count1 <= 0;
temp1 <= '1';
elsif enable_watch= '1' and rising_edge(clk) then
    count1 <= count1 + 1;
    if count1 = 9 then
        temp1 <= not temp1;
        count1 <= 0;
    elsif count1 = 5 then 
        temp1 <= not temp1;
    end if;
end if;
int1 <= count1;
o1 <= temp1;
end process;
process(o1, enable_watch)
begin
if reset_watch = '1' then
count2 <= 0;
temp2 <= '1';
elsif enable_watch= '1' and rising_edge(o1) then
    count2 <= count2 + 1;
    if count2 = 9 then
        temp2 <= not temp2;
        count2 <= 0;
    elsif count2 = 5 then 
        temp2 <= not temp2;
    end if;
end if;
int2 <= count2;
o2 <= temp2;
end process;

process(o2,enable_watch)
begin 
if reset_watch = '1' then
count3 <= 0;
temp3 <= '1';
elsif enable_watch= '1' and rising_edge(o2) then
    count3 <= count3 + 1;
    if count3 = 5 then
        temp3 <= not temp3;
        count3 <= 0;
    elsif count3 = 3 then 
        temp3 <= not temp3;
    end if;
end if;
int3 <= count3;
o3 <= temp3;
end process;
process(o3, enable_watch)
begin
if reset_watch = '1' then
count4 <= 0;
temp4 <= '1';
elsif enable_watch= '1' and rising_edge(o3) then
    count4 <= count4 + 1;
    if count4 = 9 then
        temp4 <= not temp4;
        count4 <= 0;
    elsif count4 = 5 then 
        temp4 <= not temp4;
    end if;
end if;
int4 <= count4;
out_wave <= temp4;
end process;
end Behavioral;

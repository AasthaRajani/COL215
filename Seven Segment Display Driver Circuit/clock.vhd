---------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 10/20/2022 05:37:50 PM
-- Design Name:
-- Module Name: clock - Behavioral
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

entity clock is
--  Port ( );
    Port( clk : in STD_LOGIC;
          clock_1 : buffer STD_LOGIC;
          clock_2 : buffer STD_LOGIC;
          a0 : out STD_LOGIC;
          a1 : out STD_LOGIC;
          a2 : out STD_LOGIC;
          a3 : out STD_LOGIC);
end clock;

architecture Behavioral of clock is
signal tmp1 : std_logic :='0';
signal tmp2 : std_logic :='0';
signal int1 : integer :=0;
signal int2 : integer :=0;
begin
process (clk)
begin
    if (clk'event and clk='1') then
        int1 <= int1 +1 ;
        if int1=500000 then
            tmp1<=not tmp1;
            clock_1<=tmp1;
            int1<=0;
        end if;
    end if;
    clock_1<=tmp1;

end process;
process(clk)
begin
    if (clk'event and clk='1') then
       int2 <= int2 +1 ;
       if int2=250000 then
           tmp2<=not tmp2;
           clock_2<=tmp2;
           int2<=0;
       end if;
   end if;
   clock_2<=tmp2;

end process;
process(clock_1,clock_2)
begin
if clock_1 = '0' then
    if clock_2 = '0' then
        a0 <= '0';
        a1 <= '1';
        a2 <= '1';
        a3 <= '1';
    else
        a0 <= '1';
        a1 <= '0';
        a2 <= '1';
        a3 <= '1';
    end if;
else
    if clock_2 = '0' then
        a0 <= '1';
        a1 <= '1';
        a2 <= '0';
        a3 <= '1';
    else
        a0 <= '1';
        a1 <= '1';
        a2 <= '1';
        a3 <= '0';
    end if;
end if;
end process;
end Behavioral;
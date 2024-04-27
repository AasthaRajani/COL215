----------------------------------------------------------------------------------

-- Company: 

-- Engineer: 

-- 

-- Create Date: 10/21/2022 09:57:27 AM

-- Design Name: 

-- Module Name: main_fun - Behavioral

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


entity main_fun is

--  Port ( );

    Port ( p0 : in std_logic;

           p1 : in std_logic;

           p2 : in std_logic;

           p3 : in std_logic;

           q0 : in std_logic;

           q1 : in std_logic;

           q2 : in std_logic;

           q3 : in std_logic;

           r0 : in std_logic;

           r1 : in std_logic;

           r2 : in std_logic;

           r3 : in std_logic;

           s0 : in std_logic;

           s1 : in std_logic;

           s2 : in std_logic;

           s3 : in std_logic;

           clk : in std_logic;

          l0 : out std_logic;

          l1 : out std_logic;

          l2 : out std_logic;

          l3 : out std_logic;

          l4 : out std_logic;

          l5 : out std_logic;

          l6 : out std_logic;

          a0 : out std_logic;

          a1 : out std_logic;

          a2 : out std_logic;

          a3 : out std_logic;
          dp : out std_logic );

           

           

end main_fun;



architecture Behavioral of main_fun is

    component seven_segment

    Port ( a: in STD_LOGIC;

           b: in STD_LOGIC;

           c: in STD_LOGIC;

           d: in STD_LOGIC;

           l0: out STD_LOGIC;

           l1: out STD_LOGIC;

           l2: out STD_LOGIC;

           l3: out STD_LOGIC;

           l4: out STD_LOGIC;

           l5: out STD_LOGIC;

           l6: out STD_LOGIC);

    end component;

    component clock

    Port( clk : in STD_LOGIC;

          clock_1 : buffer STD_LOGIC;

          clock_2 : buffer STD_LOGIC;

          a0 : out STD_LOGIC;

          a1 : out STD_LOGIC;

          a2 : out STD_LOGIC;

          a3 : out STD_LOGIC;
          dp : out std_logic);

    end component;

    signal d0,d1: std_logic;

    signal v0,v1,v2,v3: std_logic;

begin

lab1 : clock port map(clk => clk,clock_1 => d0,clock_2=>d1,a0=> a0, a1 => a1, a2 => a2, a3 => a3, dp => dp);

v0<=((NOT d0) AND (NOT d1) AND p0) OR (d0 AND (NOT d1) AND p1) OR (d1 AND (NOT d0) AND p2) OR (d1 AND d0 AND p3);

v1<=((NOT d0) AND (NOT d1) AND q0) OR (d0 AND (NOT d1) AND q1) OR (d1 AND (NOT d0) AND q2) OR (d1 AND d0 AND q3);

v2<=((NOT d0) AND (NOT d1) AND r0) OR (d0 AND (NOT d1) AND r1) OR (d1 AND (NOT d0) AND r2) OR (d1 AND d0 AND r3);

v3<=((NOT d0) AND (NOT d1) AND s0) OR (d0 AND (NOT d1) AND s1) OR (d1 AND (NOT d0) AND s2) OR (d1 AND d0 AND s3);

lab2 : seven_segment port map(a=> v0, b=> v1, c=> v2, d=> v3, l0=> l0,l1 => l1, l2 => l2, l3=> l3, l4=> l4, l5 => l5, l6=> l6);



end Behavioral;

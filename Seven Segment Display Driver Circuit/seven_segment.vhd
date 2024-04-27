---------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 11.10.2022 15:48:47
-- Design Name:
-- Module Name: func_A - Behavioral
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

entity seven_segment is
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

--  Port ( );
end seven_segment;

architecture Behavioral of seven_segment is

begin
    l0<=((NOT a) AND (NOT b) AND (NOT c) AND d) OR ((NOT a) AND b AND (NOT c) AND (NOT d)) OR (a AND b AND (NOT c) AND d) OR (a AND (NOT b) AND c AND d) ;
    l1<=(a AND b AND (NOT d)) OR (a AND c AND d) OR ((NOT a) AND b AND (NOT c) AND d) OR (b AND c AND (NOT d));
    l2<=((NOT a) AND (NOT b) AND c AND (NOT d)) OR (a AND b AND c) OR (a AND b AND (NOT d));
    l3<=(b AND c AND d) OR ((NOT a) AND b AND (NOT c) AND (NOT d)) OR ((NOT a) AND (NOT b) AND (NOT c) AND d) OR (a AND (NOT b) AND c AND (NOT d));
    l4<=((NOT a) AND d) OR ((NOT b) AND (NOT c) AND d) OR ((NOT a) AND b AND (NOT c)) ;
    l5<=(a AND b AND (NOT c) AND d) OR ((NOT a) AND c AND d) OR ((NOT a) AND (NOT b) AND d) OR ((NOT a) AND (NOT b) AND c);
    l6<=((NOT a) AND b AND c AND d) OR (a AND b AND (NOT c) AND (NOT d)) OR ((NOT a) AND (NOT b) AND (NOT c));


end Behavioral;
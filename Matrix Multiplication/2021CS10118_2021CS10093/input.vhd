----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2022 05:22:43 PM
-- Design Name: 
-- Module Name: input - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity input is
 Port ( a : in std_logic_vector(13 downto 0);
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
--        b : std_logic_vector(6 downto 0);
-- a0 : in std_logic;
--         a1 : in std_logic;
--         a2 : in std_logic;
--         a3 : in std_logic;
--         a4 : in std_logic;
--         a5 : in std_logic;
--         a6 : in std_logic;
--         b0 : in std_logic;
--         b1 : in std_logic;
--         b2 : in std_logic;
--         b3 : in std_logic;
--         b4 : in std_logic;
--         b5 : in std_logic;
--         b6 : in std_logic;
--         oo : out std_logic_vector(15 downto 0));
end input;

architecture Behavioral of input is
component dist_mem_gen_2
 PORT (
  a : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
  d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  clk : IN STD_LOGIC;
  we : IN STD_LOGIC;
  spo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
end component;
--component fsm_new 
--    Port(clk : in std_logic;
--         o1 : out std_logic_vector(15 downto 0);
--         rom1_cmd : buffer std_logic;
--         rom2_cmd : buffer std_logic;
--         ram_cmd : buffer std_logic;
--         reg_1_cmd : buffer std_logic;
--         reg_2_cmd : buffer std_logic;
--         reg_3_cmd : buffer std_logic;
--         mac_cmd : buffer std_logic;
--         r1 : out std_logic;
--         w1 : out std_logic;
--         r2 : out std_logic;
--         w2 : out std_logic;
--         r3 : out std_logic;
--         w3 : out std_logic);
-- end component;
component main_fun

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
 end component;
 component fsm
    Port ( clk : in std_logic);
 end component;
signal oo: std_logic_vector(15 downto 0);
begin
lab1 : fsm port map(clk=> clk);
lab2 : dist_mem_gen_2 port map( a=> a , clk => clk, d=>(others=>'0'), we=> '0', spo=> oo);
lab3 : main_fun port map(p0=>oo(15), q0=> oo(14), r0 => oo(13), s0 => oo(12), p1=> oo(11), q1 => oo(10) , r1=>oo(9), s1=>oo(8),p2=>oo(7),q2=>oo(6),r2=>oo(5),s2=>oo(4),p3=>oo(3),q3=>oo(2),r3=>oo(1),s3=>oo(0),l0=>l0,l1=>l1,l2=>l2,l3=>l3,l4=>l4,l5=>l5,l6=>l6,a0=>a0,a1=>a1,a2=>a2,a3=>a3,dp=>dp,clk=>clk);

--column <= to_integer(b);

end Behavioral;

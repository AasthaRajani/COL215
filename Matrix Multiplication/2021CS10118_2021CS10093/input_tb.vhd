----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2022 06:52:09 PM
-- Design Name: 
-- Module Name: input_tb - tb
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

entity input_tb is
--  Port ( );
end input_tb;

architecture tb of input_tb is
--component input 
-- Port(  a : in std_logic_vector(13 downto 0);
--       clk : in std_logic;
       
--                 l0 : out std_logic;
       
--                 l1 : out std_logic;
       
--                 l2 : out std_logic;
       
--                 l3 : out std_logic;
       
--                 l4 : out std_logic;
       
--                 l5 : out std_logic;
       
--                 l6 : out std_logic;
       
--                 a0 : out std_logic;
       
--                 a1 : out std_logic;
       
--                 a2 : out std_logic;
       
--                 a3 : out std_logic;
--                 dp : out std_logic );
 component fsm
   Port ( clk : in std_logic;
          o1 : out std_logic_vector(15 downto 0));
end component;
--signal l0,l1,l2,l3,l4,l5,l6 : std_logic;
--signal a : std_logic_vector(13 downto 0);
--signal a0,a1,a2,a3,dp : std_logic;
signal clk : std_logic;
signal o1 : std_logic_vector(15 downto 0);
constant clock_period : time := 10 ns;
begin
--uut : input port map(a=>a, clk=>clk, l0=>l0,l1=>l1,l2=>l2,l3=>l3,l4=>l4,l5=>l5,l6=>l6,a0=>a0,a1=>a1,a2=>a2,a3=>a3,dp=>dp);
uut : fsm port map(clk=>clk,o1=>o1);
process
begin
clk <= '0';
wait for clock_period/2;
clk <= '1';
wait for clock_period/2;
end process;
--a <= "00000000000000" , "00000000000001" after 20 ns;

end tb;

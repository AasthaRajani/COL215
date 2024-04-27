---------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 10/20/2022 12:50:55 PM
-- Design Name:
-- Module Name: mux_2_tb - tb
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

entity main_fun_tb is
--  Port ( );
end main_fun_tb;

architecture tb of main_fun_tb is
    component main_fun
        Port(p0 : in STD_LOGIC;
         p1 : in STD_LOGIC;
         p2 : in STD_LOGIC;
         p3 : in STD_LOGIC;
         q0 : in STD_LOGIC;
         q1 : in STD_LOGIC;
         q2 : in STD_LOGIC;
         q3 : in STD_LOGIC;
         r0 : in STD_LOGIC;
         r1 : in STD_LOGIC;
         r2 : in STD_LOGIC;
         r3 : in STD_LOGIC;
         s0 : in STD_LOGIC;
         s1 : in STD_LOGIC;
         s2 : in STD_LOGIC;
         s3 : in STD_LOGIC;
         clk : in std_logic;
         l0 : out STD_LOGIC;
         l1 : out STD_LOGIC;
         l2 : out STD_LOGIC;
         l3 : out STD_LOGIC;
         l4 : out std_logic;
         l5 : out std_logic;
         l6 : out std_logic;
         a0 : out std_logic;
         a1 : out std_logic;
         a2 : out std_logic;
         a3 : out std_logic);
--         o7 : out_logic;

    end component;
    signal p0,p1,p2,p3,q0,q1,q2,q3,r0,r1,r2,r3,s0,s1,s2,s3,clk: std_logic;
    signal l0,l1,l2,l3,l4,l5,l6,a0,a1,a2,a3: std_logic;
--    signal clk : std_logic := '0';
    constant clk_period : time := 20 ns;
begin
    UUT : main_fun port map( p0=>p0,p1=>p1,p2=>p2,p3=>p3,r0=>r0,r1=>r1,r2=>r2,r3=>r3,s0=>s0,s1=>s1,s2=>s2,s3=>s3,clk=>clk,q0=>q0,q1=>q1,q2=>q2,q3=>q3,l0=>l0,l1=>l1,l2=>l2,l3=>l3,l4=>l4,l5=>l5,l6=>l6,a0=>a0,a1=>a1,a2=>a2,a3=>a3);
    clk_process :process
    begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
    end process;
    p0 <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0'  after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns, '1' after 65 ns, '0'  after 70 ns, '1' after 75 ns ;
    p1 <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0'  after 60 ns, '1' after 70 ns;
    p2 <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
    p3 <= '0', '1' after 40 ns;
    q0 <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0'  after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns, '1' after 65 ns, '0'  after 70 ns, '1' after 75 ns ;
    q1 <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0'  after 60 ns, '1' after 70 ns;
    q2 <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
    q3 <= '0', '1' after 40 ns;
    r0 <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0'  after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns, '1' after 65 ns, '0'  after 70 ns, '1' after 75 ns ;
    r1 <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0'  after 60 ns, '1' after 70 ns;
    r2 <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
    r3 <= '0', '1' after 40 ns;
    s0 <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0'  after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns, '1' after 65 ns, '0'  after 70 ns, '1' after 75 ns ;
    s1 <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0'  after 60 ns, '1' after 70 ns;
    s2 <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
    s3 <= '0', '1' after 40 ns;



end tb;
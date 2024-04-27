----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2022 13:54:59
-- Design Name: 
-- Module Name: stopwatch - Behavioral
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

entity stopwatch is
--  Port ( );
Port( start : in std_logic;
      pause : in std_logic;
      continue : in std_logic;
      reset: in std_logic;
      clk : in std_logic;
      w1 : out std_logic;
      w2 : out std_logic;
      w3 : out std_logic;
      w4 : out std_logic;
      w5 : out std_logic;
      w6 : out std_logic;
      w7 : out std_Logic;
      y1 : out std_logic;
      y2 : out std_logic;
      y3 : out std_logic;
      y4 : out std_logic;
      dp : out std_logic);
end stopwatch;

architecture Behavioral of stopwatch is
 component timing_circuit
       port ( clk : in std_logic;
             clk_out : out std_logic);
   end component;
   component int_to_binary
       port ( a : in integer;
              b1,b2,b3,b4 : out std_logic);
   end component;
component main_fun
           port ( p0 : in std_logic;
       
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
  component num 
  Port  (clk : in std_logic;
        enable_watch : in std_logic;
        reset_watch : in std_logic;
        int :out integer;
        out_wave : out std_logic);
  end component;
  component num_new
  Port ( enable_watch : in std_logic;
      reset_watch : in std_logic;
      clk : in std_logic;
      out_wave : out std_logic;
      int1 , int2 , int3 , int4: out integer);
  end component;
  component switch
    Port( start : in std_logic;
            reset : in std_logic;
            pause : in std_logic;
            continue : in std_logic;
            enable_watch : out std_logic;
            reset_watch : out std_logic;
            clk : in std_logic);
   end component;
signal pp0,pp1,pp2,pp3,qq0,qq1,qq2,qq3,rr0,rr1,rr2,rr3,ss1,ss2,ss3,ss0: std_logic;
signal clk_out,o: std_logic;
signal enable_watch,reset_watch : std_logic;
signal in1 ,in2 , in3 , in4 : integer;
signal start_pulse, pause_pulse, continue_pulse, reset_pulse : std_logic;
begin
--enable_watch <= ((start) and (not reset) and (not pause)) or (continue and (not reset) and start);
--reset_watch <= reset and start ;
--process(start, pause, continue, reset)
--begin
--if rising_edge(start) then
--    enable_watch <= '1';
--    reset_watch <= '0' ;
--elsif rising_edge(pause) then 
--    enable_watch <= '0';
--    reset_watch <= '0';
--elsif rising_edge(continue) then 
--    enable_watch <= '1';
--    reset_watch <= '0';
--elsif rising_edge(reset) then
--    enable_watch <= '0';
--    reset_watch <='1';
--end if;
--end process;
    
lab0 : switch port map( clk=>clk,start=> start, pause=> pause, continue=> continue, reset=> reset, enable_watch=> enable_watch, reset_watch=> reset_watch);
lab1 : timing_circuit port map ( clk => clk , clk_out => clk_out);
--lab2 : num port map( enable_watch => enable_watch , reset_watch => reset_watch , clk => clk_out , int => in1 , out_wave=> o1);
lab3 : num_new port map( enable_watch => enable_watch, reset_watch => reset_watch, clk=> clk_out , int1 => in1 , int2 => in2 , int3 => in3 , int4 => in4 , out_wave => o);
--lab4 : num port map (enable_watch => enable_watch, reset_watch => reset_watch , clk => o2 ,int => in4 , out_wave=> o3);

lab5 : int_to_binary port map( a=> in4, b1=>ss0,b2 => ss1,b3=> ss2, b4 => ss3);
lab6 : int_to_binary port map( a=> in3, b1=>rr0,b2 => rr1,b3=> rr2, b4 => rr3);
lab7 : int_to_binary port map( a=> in2, b1=>qq0,b2 => qq1,b3=> qq2, b4 => qq3);
lab8 : int_to_binary port map( a=> in1, b1=>pp0,b2 => pp1,b3=> pp2, b4 => pp3);
lab9 : main_fun port map( dp=>dp,s3=>pp0, r3=>pp1, q3=>pp2, p3=>pp3, s2=>qq0, r2=>qq1, q2=>qq2, p2=>qq3, s1=>rr0, r1=>rr1, q1=>rr2, p1=>rr3, s0=>ss0, r0=>ss1, q0=>ss2, p0=>ss3, clk=>clk, l0=>w1, l1=>w2, l2=>w3, l3=>w4, l4=>w5, l5=>w6, l6=>w7, a0 => y1 , a1 => y2 , a2 => y3, a3 => y4);

end Behavioral;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- entity declaration for your testbench.
--Notice that the entity port list is empty here.
entity stopwatch_tb is
end stopwatch_tb;

architecture tb of stopwatch_tb is

    component stopwatch is
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
          y4 : out std_logic);
  
                end component;
           
                signal start, pause, continue, reset : STD_LOGIC;
                
                signal w1, w2, w3, w4, w5, w6, w7,y1, y2, y3, y4 : STD_LOGIC;
           
           --declare inputs and initialize them to zero.
           signal clk : std_logic := '0';
           -- signal reset : std_logic := '0';
           
           --declare outputs
           
           -- define the period of clock here.
           -- It's recommended to use CAPITAL letters to define constants.
           constant CLK_PERIOD : time := 10 ns;
           
           begin
           
               -- instantiate the unit under test (uut)
              uut : stopwatch port map (
                       start => start,
                       pause => pause,
                       continue => continue,
                       reset => reset,
                       Clk => Clk,
                       w1 => w1,
                       w2 => w2,
                       w3 => w3,
                        w4 => w4,
                      w5 => w5,
                      w6 => w6,
                      w7 => w7,
                      y1 => y1,
                      y2 => y2,
                      y3 => y3,
                      y4 => y4
                  );
                      
                      --     input_arr_16 <= "0010010100100101" ;
                      
                         -- Clock process definitions( clock with 50% duty cycle is generated here.
                         Clk_process :process
                         begin
                              Clk <= '0';
                              wait for CLK_PERIOD/2;  --for half of clock period clk stays at '0'.
                              Clk <= '1';
                              wait for CLK_PERIOD/2;  --for next half of clock period clk stays at '1'.
                         end process;
                      
                          start <= '0', '1' after 30 ms, '0' after 60 ms, '1' after 70 ms;
                          pause <= '0', '1' after 10 ms, '0' after 20 ms, '1' after 30 ms, '0' after 40 ms;
                          continue <= '0', '1' after 5 ms, '0' after 9 ms, '1' after 15 ms, '0' after 35 ms;
                          reset <= '0', '1' after 65 ms;
                          
                         -- Stimulus process, Apply inputs here.
                      --  stim_proc: process
                      --   begin
                      --        wait for CLK_PERIOD*10; --wait for 10 clock cycles.
                      --        reset <='1';                    --then apply reset for 2 clock cycles.
                      --        wait for CLK_PERIOD*2;
---        reset <='0';                    --then pull down reset for 20 clock cycles.
                      --        wait for CLK_PERIOD*20;
                      --        reset <= '1';               --then apply reset for one clock cycle.
                      --        wait for CLK_PERIOD;
                      --        reset <= '0';               --pull down reset and let the counter run.
                      --        wait;
                      --  end process;
                      END tb;
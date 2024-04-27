----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2022 04:15:27 PM
-- Design Name: 
-- Module Name: fsm - Behavioral
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm is
--  Port ( );
    Port(clk : in std_logic;
        o1 : out std_logic_vector(15 downto 0));
--         clk2 : in std_logic;
--         clk3 : in std_logic;
--         rom_cmd : out std_logic;
--         ram_cmd : out std_logic;
--         reg_1_cmd : out std_logic;
--         reg_2_cmd : out std_logic;
--         reg_3_cmd : out std_logic;
--         mac_cmd : out std_logic);
end fsm;

architecture Behavioral of fsm is
component registe
Port( reg_1_cmd : in std_logic;
          din : in std_logic_vector(7 downto 0);
          read : in std_logic;
          write : in std_logic;
          dout: out std_logic_vector(7 downto 0));

end component;
component register_2
Port ( reg_2_cmd : in std_logic;
          din : in std_logic_vector(15 downto 0);
          read : in std_logic;
          write : in std_logic;
          dout: out std_logic_vector(15 downto 0));
end component;
component mac
    Port ( in1 : in std_logic_vector(7 downto 0);
       in2 : in std_logic_vector(7 downto 0);
       mac_cmd : in std_logic;
--       sum : in std_logic_vector(15 downto 0);
--           clk2 : in std_logic;
--           clk3 : in std_logic;
       out1 : out std_logic_vector(15 downto 0));
end component;
component dist_mem_gen_1
Port(a : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
 end component;
 component dist_mem_gen_0
 Port(a : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
     spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
  end component;
 component dist_mem_gen_2
  PORT (
   a : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
   d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
   clk : IN STD_LOGIC;
   we : IN STD_LOGIC;
   spo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
 );
   end component;

signal r1,w1,r2,w2,r3,w3,we : std_logic;
signal ram_cmd,rom1_cmd,rom2_cmd, reg_1_cmd, reg_2_cmd, reg_3_cmd, mac_cmd : std_logic;
signal c : integer := 0;
signal d_out1 , d_out2 : std_logic_vector(7 downto 0);
signal  a1,a2,a3 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
 signal spo1,spo2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
 signal sum,mac_out : std_logic_vector(15 downto 0);
 signal ram_in : std_logic_vector(15 downto 0) := (others=>'0');
 signal counter,REG_3_COUNT : integer :=0;
--signal o1 : std_logic_vector(15 downto 0);
type state_type is(off_state, rom_state, reg_state, mac_state, reg_3_state, ram_state);
signal state : state_type:=off_state;
begin
process(clk)
begin
if rising_edge(clk) then
--counter <= counter +1;
    case state is
    when off_state=>
        if counter mod 136=1 then
            state<=rom_state;
        end if;
    when rom_state=>
        if counter mod 136=2 then
            state<= reg_state;
        end if;
--    when reg_state=>
--        if counter=3 then
--            state<= reg_state;
--        end if;
    when reg_state=>
        if counter mod 136 =3 then
            state<= mac_state;
        end if;
    when mac_state=>
        if counter mod 136<133 and counter mod 136>3 then
            state<= mac_state;
        elsif counter mod 136=133 then
            state<=reg_3_state;
        end if;
    when reg_3_state=>
        if counter mod 136=134 then
            state<= ram_state;
        end if;
    when ram_state=>
        if counter mod 136=135 then
            state<= off_state;
--            counter<=0;
        end if;
        
    end case;      
    counter <= counter +1;
end if;
end process;
rom1_cmd <='1'  when state=rom_state else '0';
rom2_cmd <='1'  when state=rom_state else '0';
reg_1_cmd <='1' when state=reg_state else '0';
reg_2_cmd <='1' when state=reg_state else '0';
mac_cmd <='1' when state=mac_state else '0';
reg_3_cmd <='1' when state=reg_3_state else '0';
ram_cmd <='1' when state=ram_state else '0';

r1 <= '1' when mac_cmd='1' else '0';
r2 <='1' when mac_cmd='1' else '0';
w1 <= '1' when reg_1_cmd ='1' else '0';
w2 <= '1' when reg_2_cmd ='1' else '0';
r3 <= '1' when ram_cmd ='1' else '0';
w3 <= '1' when reg_3_cmd='1' else '0';
we <= '0' when ram_cmd ='1' else '0';
process
begin
for i in 0 to 127 loop
    a3 <= std_logic_vector(to_unsigned(i+(c*128),14));
    for j in 0 to 127 loop
        a1<=std_logic_vector(to_unsigned((j+128)*i,14));
        a2<=std_logic_vector(to_unsigned((j+128)*i,14));
    wait for 10 ns;
    c<= c+1;
    end loop;
    
    wait;
end loop;
c <= 0;
wait;
end process;
label_0 : dist_mem_gen_0 port map( a=> a1, spo=> spo1);
label_1 : dist_mem_gen_1 port map( a=> a2, spo=> spo2);
label_2 : registe port map(reg_1_cmd=>reg_1_cmd, read=> r1, write => w1, dout=> d_out1,din=>spo1);
label_3 : registe port map(reg_1_cmd=>reg_2_cmd, read=>r2, write=>w2, dout=> d_out2, din=>spo2);
label_4 : mac port map( mac_cmd=> MAC_CMD,in1=> d_out1, in2=> d_out2,out1=>mac_out);
label_5 : register_2 port map ( reg_2_cmd=> reg_3_cmd,din=>mac_out,dout=> ram_in,read=>r3,write=>w3);
label_6 : dist_mem_gen_2 port map(a=>a3,clk=>clk,we=>we,d=> ram_in,spo=>o1);
end Behavioral;

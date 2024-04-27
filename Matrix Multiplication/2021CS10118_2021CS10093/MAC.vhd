----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2022 03:33:21 PM
-- Design Name: 
-- Module Name: MAC - Behavioral
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
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MAC is
--  Port ( );s
    Port ( in1 : in std_logic_vector(7 downto 0);
           in2 : in std_logic_vector(7 downto 0);
           mac_cmd : in std_logic;
--           sum : in std_logic_vector(15 downto 0);
--           clk2 : in std_logic;
--           clk3 : in std_logic;
           out1 : out std_logic_vector(15 downto 0));
end MAC;

architecture Behavioral of MAC is
--component register_2
--Port(reg_2_cmd : in std_logic;
--          din : in std_logic_vector(15 downto 0);
--          read : in std_logic;
--          write : in std_logic;
--          dout: out std_logic_vector(15 downto 0));
--end component;
--signal summ : std_logic_vector(15 downto 0) := "0000000000000000";
signal h: std_logic_vector(15 downto 0) ;
signal prod : std_logic_vector(15 downto 0);
signal counter : integer :=0;
begin
--h<=sum;
process(mac_cmd,h)
begin
if mac_cmd='1' then
   
    prod <= std_logic_vector(unsigned(in1) * unsigned(in2));
     h <= prod;
elsif mac_cmd ='0' then
    h<=h + prod;
end if;
out1<= h;
end process;

end Behavioral;

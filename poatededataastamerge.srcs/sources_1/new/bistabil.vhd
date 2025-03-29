----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2024 04:25:13 PM
-- Design Name: 
-- Module Name: bistabil - Behavioral
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

entity bistabil is
    Port ( j : in STD_LOGIC;
           k : in STD_LOGIC;
           clk : in STD_LOGIC;
           r : in STD_LOGIC;
           q : out STD_LOGIC;
           qn : out STD_LOGIC);
end bistabil;

architecture Behavioral of bistabil is

signal stare : std_logic;
signal input : std_logic_vector (1 downto 0);

begin

input <= j&k;

process(clk,r)
begin
if r = '1' then
  stare <= '0';
else
  if falling_edge(clk) then
     case input is
        when "00" => stare <= stare;
        when "01" => stare <= '0';
        when "10" => stare <= '1';
        when "11" => stare <= not stare;
        when others => stare <= stare;
     end case;
     end if;
     end if;
     end process;
     
     q <= stare;
     qn <= not stare;
  
end Behavioral;

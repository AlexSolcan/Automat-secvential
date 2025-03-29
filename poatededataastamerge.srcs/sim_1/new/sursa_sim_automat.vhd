----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2024 05:22:10 PM
-- Design Name: 
-- Module Name: sursa_sim_automat - Behavioral
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

entity sursa_sim_automat is
--  Port ( );
end sursa_sim_automat;

architecture Behavioral of sursa_sim_automat is
component automat is
    Port ( clk : in STD_LOGIC;
           r : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (2 downto 0));
end component automat;

signal clk,r:std_logic;
signal q:std_logic_vector (2 downto 0);

begin

UT: automat port map (clk,r,q);

process
begin

clk <= '0'; wait for 1.2 ns;
clk <= '1'; wait for 1.2 ns;

end process;

r <= '1' after 0 ns, '0' after 2.2 ns;
end Behavioral;

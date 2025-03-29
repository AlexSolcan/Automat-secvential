----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2024 06:55:41 PM
-- Design Name: 
-- Module Name: sursa_sim_neinversor - Behavioral
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

entity sursa_sim_neinversor is
--  Port ( );
end sursa_sim_neinversor;

architecture Behavioral of sursa_sim_neinversor is
component neinv is
    Port ( x : in STD_LOGIC;
           y : out STD_LOGIC);
end component neinv;

signal x : std_logic;
signal y : std_logic;

begin

ut: neinv port map ( x => x, y => y);

process
begin

x <= '0'; wait for 100 ns;
x <= '1'; wait for 100 ns;
x <= '0'; wait for 50 ns;
x <= '1'; wait for 50 ns;

end process;
end Behavioral;

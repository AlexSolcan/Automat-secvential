----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2024 06:06:05 PM
-- Design Name: 
-- Module Name: sursa_sim_bistabil - Behavioral
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

entity sursa_sim_bistabil is
--  Port ( );
end sursa_sim_bistabil;

architecture Behavioral of sursa_sim_bistabil is

component bistabil is
    Port ( j : in STD_LOGIC;
           k : in STD_LOGIC;
           clk : in STD_LOGIC;
           r : in STD_LOGIC;
           q : out STD_LOGIC;
           qn : out STD_LOGIC);
end component bistabil;


signal clk: std_logic := '0';
signal r: std_logic := '0';
signal j: std_logic := '0';
signal k: std_logic := '0';

signal q: std_logic;
signal qn: std_logic;

constant clk_period : time := 10 ns;

begin  

uut: bistabil port map(clk => clk,
                       r => r,
                       j => j,
                       k => k,
                       q => q,
                       qn => qn);

process
begin
clk <= '0';wait for clk_period/3;
clk <= '1';wait for clk_period/3;
end process;

process
begin

r <= '0';
j <= '0';
k <= '0';

wait for clk_period;

r <= '1';
j <= '1';
k <= '0';

wait for clk_period;

r <= '0';
j <= '0';
k <= '1';

wait for clk_period;

r <= '1';
j <= '1';
k <= '1';

wait for clk_period;

r <= '0';
j <= '1';
k <= '1';

wait for clk_period;

r <= '1';
j <= '0';
k <= '0';

end process;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2024 06:28:22 PM
-- Design Name: 
-- Module Name: sursa_sim_mux4 - Behavioral
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

entity sursa_sim_mux4 is
--  Port ( );
end sursa_sim_mux4;

architecture Behavioral of sursa_sim_mux4 is

component  mux4 is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           i2 : in STD_LOGIC;
           i3 : in STD_LOGIC;
           a1 : in STD_LOGIC;
           a0 : in STD_LOGIC;
           y : out STD_LOGIC);
end component mux4;

signal i0: std_logic :='0';
signal i1: std_logic :='0';
signal i2: std_logic :='0';
signal i3: std_logic :='0';
signal a1: std_logic :='0';
signal a0: std_logic := '0';

signal y: std_logic;


begin

ut: mux4 port map(i0 => i0,
                  i1 => i1,
                  i2 => i2,
                  i3 => i3,
                  a1 => a1,
                  a0 => a0,
                  y => y);
process
begin 

i0 <= '0';
i1 <= '0';
i2 <= '0';
i3 <= '0';
a1 <='0';
a0 <= '0';

wait for 10 ns;

i0 <= '1';
i1 <= '1';
i2 <= '1';
i3 <= '1';
a1 <= '1';
a0 <= '1';

wait for 10 ns;

i0 <= '1';
i1 <= '0';
i2 <= '0';
i3 <= '1';
a1 <= '1';
a0 <='1';

wait for 10 ns;

i0 <= '1';
i1 <= '0';
i2 <= '1';
i3 <= '1';
a1 <='1';
a0 <= '1';

wait for 10 ns;

i0 <= '0';
i1 <= '1';
i2 <= '0';
i3 <= '0';
a1 <= '0';
a0 <= '1';
wait for 10 ns;

end process;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2024 04:40:18 PM
-- Design Name: 
-- Module Name: automat - Behavioral
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

entity automat is
    Port ( clk : in STD_LOGIC;
           r : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (2 downto 0));
end automat;

architecture Behavioral of automat is

component mux4 is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           i2 : in STD_LOGIC;
           i3 : in STD_LOGIC;
           a1 : in STD_LOGIC;
           a0 : in STD_LOGIC;
           y : out STD_LOGIC);
end component mux4;

component bistabil is
    Port ( j : in STD_LOGIC;
           k : in STD_LOGIC;
           clk : in STD_LOGIC;
           r : in STD_LOGIC;
           q : out STD_LOGIC;
           qn : out STD_LOGIC);
end component bistabil;

component inv is
    Port ( x : in STD_LOGIC;
           y : out STD_LOGIC);
end component inv;

component neinv is
    Port ( x : in STD_LOGIC;
           y : out STD_LOGIC);
end component neinv;

signal netJ2, netJ1, netJ0, netK2, netK1, netK0: std_logic;
signal qint: std_logic_vector(2 downto 0);
signal netA, netB:std_logic;

begin

q <= qint;

JK2: bistabil port map(clk => clk,
                       r => r,
                       j => netJ2,
                       k => netK2,
                       q => qint (2));
JK1: bistabil port map(clk => clk,
                       r => r,
                       j => netJ1,
                       k => netK1,
                       q => qint (1));
JK0: bistabil port map(clk => clk,
                       r => r,
                       j => netJ0,
                       k => netK0,
                       q => qint (0));
                       
M1: mux4 port map (i0 =>'1',
                   i1 => '0',
                   i2 => '0',
                   i3 => '0',
                   a1 => qint(2),
                   a0 => qint(1),
                   y => netJ2);
                   
M2: mux4 port map (i0 => '0',
                   i1 => '0',
                   i2 => netA,
                   i3 => '0',
                   a1 => qint (2),
                   a0 => qint(1),
                   y => netK2);                  

M3: mux4 port map (i0 => '0',
                   i1 => '0',
                   i2 => '1',
                   i3 => '0',
                   a1 => qint (2),
                   a0 => qint (1),
                   y => netJ1);
 
M4: mux4 port map(i0 => '0',
                  i1 => '1',
                  i2 => '0',
                  i3 => netA,
                  a1 => qint(2),
                  a0 => qint(1),
                  y => netK1);
                  
M5: mux4 port map(i0 => '0',
                  i1 => netB,
                  i2 => '0',
                  i3 => netB,
                  a1 => qint(2),
                  a0 => qint(1),
                  y => netJ0);
                  
M6: mux4 port map (i0 => '1',
                   i1 => netA,
                   i2 => netA,
                   i3 => '0',
                   a1 => qint(2),
                   a0 => qint(1),
                   y => netK0);
                                                     
I: inv port map(x => qint(0), y => netB);

NEI: neinv port map(x => qint(0), y => netA);
end Behavioral;

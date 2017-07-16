----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:48 11/18/2011 
-- Design Name: 
-- Module Name:    fa - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
library work;
use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fa is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end fa;

architecture Behavioral of fa is

	component halfadder
	Port (A : in  STD_LOGIC;
         B : in  STD_LOGIC;
         S : out  STD_LOGIC;
			C: out  STD_LOGIC);
	end component;
	signal s1,c1,c2:std_logic:='0';
	begin 
		ex1: halfadder port map(A,B,s1,c1);
		ex2: halfadder port map(C,s1,S,c2);
		Cout<= (c1 or c2);
end Behavioral;


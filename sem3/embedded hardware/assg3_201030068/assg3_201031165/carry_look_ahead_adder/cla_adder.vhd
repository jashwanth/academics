----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:41:10 11/19/2011 
-- Design Name: 
-- Module Name:    cla_adder - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cla_adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
			  Cout : out STD_LOGIC);
end cla_adder;

architecture Behavioral of cla_adder is
		
			  signal h_sum,G,P:STD_LOGIC_VECTOR(3 downto 0);
			  signal Co:STD_LOGIC_VECTOR(3 downto 1);
begin
 h_sum <= A XOR B;
    G <= A AND B;
    P <= A OR B;
    PROCESS (G,P,Co,C)
    BEGIN
    Co(1) <= G(0) OR (P(0) AND C);
        inst: FOR i IN 1 TO 2 LOOP
              Co(i+1) <= G(i) OR (P(i) AND Co(i));
              END LOOP;
    Cout <= G(3) OR (P(3) AND Co(3));
    END PROCESS;

    S(0) <= h_sum(0) XOR C;
    S(3 DOWNTO 1) <= h_sum(3 DOWNTO 1) XOR Co(3 DOWNTO 1);
	 end Behavioral;


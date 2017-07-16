----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:20:14 11/19/2011 
-- Design Name: 
-- Module Name:    led_display - Behavioral 
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

entity led_display is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0);
			  C : out STD_LOGIC_VECTOR(7 downto 0));
end led_display;

architecture Behavioral of led_display is

begin
	process(A)
	begin
	if(A="0000") then
			C(0)<='0';
			C(1)<='0';
			C(2)<='0';
			C(3)<='0';
			C(4)<='0';
			C(5)<='0';
			C(6)<='1';
			C(7)<='1';
			elsif(A="0001") then
			C(0)<='1';
			C(1)<='0';
			C(2)<='0';
			C(3)<='1';
			C(4)<='1';
			C(5)<='1';
			C(6)<='1';
			C(7)<='1';
			elsif(A="0010") then
			C(0)<='0';
			C(1)<='0';
			C(2)<='1';
			C(3)<='0';
			C(4)<='0';
			C(5)<='1';
			C(6)<='0';
			C(7)<='1';
			elsif(A="0011") then
			C(0)<='0';
			C(1)<='0';
			C(2)<='0';
			C(3)<='0';
			C(4)<='1';
			C(5)<='1';
			C(6)<='0';
			C(7)<='1';
			elsif(A="0100") then
			C(0)<='1';
			C(1)<='0';
			C(2)<='0';
			C(3)<='1';
			C(4)<='1';
			C(5)<='0';
			C(6)<='0';
			C(7)<='1';
			elsif(A="0101") then
			C(0)<='0';
			C(1)<='1';
			C(2)<='0';
			C(3)<='0';
			C(4)<='1';
			C(5)<='0';
			C(6)<='0';
			C(7)<='1';
			elsif(A="0110") then
			C(0)<='0';
			C(1)<='1';
			C(2)<='0';
			C(3)<='0';
			C(4)<='0';
			C(5)<='0';
			C(6)<='0';
			C(7)<='1';
			elsif(A="0111") then
			C(0)<='0';
			C(1)<='0';
			C(2)<='0';
			C(3)<='1';
			C(4)<='1';
			C(5)<='1';
			C(6)<='1';
			C(7)<='1';
			elsif(A="1000") then
			C(0)<='0';
			C(1)<='0';
			C(2)<='0';
			C(3)<='0';
			C(4)<='0';
			C(5)<='0';
			C(6)<='0';
			C(7)<='1';
			elsif(A="1001") then
			C(0)<='0';
			C(1)<='0';
			C(2)<='0';
			C(3)<='0';
			C(4)<='1';
			C(5)<='0';
			C(6)<='0';
			C(7)<='1';
			elsif(A="1010") then
			C(0)<='0';
			C(1)<='0';
			C(2)<='0';
			C(3)<='1';
			C(4)<='0';
			C(5)<='0';
			C(6)<='0';
			C(7)<='1';
			elsif(A="1011") then
			C(0)<='1';
			C(1)<='1';
			C(2)<='0';
			C(3)<='0';
			C(4)<='0';
			C(5)<='0';
			C(6)<='0';
			C(7)<='1';
			elsif(A="1100") then
			C(0)<='0';
			C(1)<='1';
			C(2)<='1';
			C(3)<='0';
			C(4)<='0';
			C(5)<='0';
			C(6)<='1';
			C(7)<='1';
			elsif(A="1101") then
			C(0)<='1';
			C(1)<='0';
			C(2)<='0';
			C(3)<='0';
			C(4)<='0';
			C(5)<='1';
			C(6)<='0';
			C(7)<='1';
			elsif(A="1110") then
			C(0)<='0';
			C(1)<='1';
			C(2)<='1';
			C(3)<='0';
			C(4)<='0';
			C(5)<='0';
			C(6)<='0';
			C(7)<='1';
			elsif(A="1111") then
			C(0)<='0';
			C(1)<='1';
			C(2)<='1';
			C(3)<='1';
			C(4)<='0';
			C(5)<='0';
			C(6)<='0';
			C(7)<='1';
		end if;
		B(0)<='0';
		B(1)<='1';
		B(2)<='1';
		B(3)<='1';
end process;

end Behavioral;
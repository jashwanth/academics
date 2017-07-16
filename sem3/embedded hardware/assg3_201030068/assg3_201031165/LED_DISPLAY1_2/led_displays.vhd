----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:35:06 11/19/2011 
-- Design Name: 
-- Module Name:    led_displays - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_displays is
	port (	clk				: in	std_logic;
				reset				: in	std_logic;

				digit0			: in	std_logic_vector(3 downto 0);
				digit1			: in	std_logic_vector(3 downto 0);
				--digit2			: in	std_logic_vector(3 downto 0);
				--digit3			: in	std_logic_vector(3 downto 0);

							seg				: out	std_logic_vector(6 downto 0);
								an					: out	std_logic_vector(3 downto 0));
end led_displays;

architecture Arch of led_displays is

	signal anode		: std_logic_vector(3 downto 0);

begin

an <= anode;

process (clk)
	variable bcd		: std_logic_vector(3 downto 0);
	variable counter	: unsigned(7 downto 0);
begin
	if (clk'event and clk='1') then
		if (reset='1') then
			bcd := (others => '0');
			counter := (others => '0');

			anode <= b"1110";
			
		else
			if (counter=b"0000_0000") then
				anode <= anode(2 downto 0) & anode(3);
			end if;

			counter := counter + 1;

			case anode is
				when "1110" => bcd	:= digit0;
				when "1101" => bcd	:= digit1;
				when others => bcd	:= digit0;
							
			end case;

			-- Display Segments: A B C D E F G
			case bcd is
				when "0000" => seg <= "0000001";	-- 0
				when "0001" => seg <= "1001111";	-- 1
				when "0010" => seg <= "0010010";	-- 2
				when "0011" => seg <= "0000110";	-- 3
				when "0100" => seg <= "1001100";	-- 4
				when "0101" => seg <= "0100100";	-- 5
				when "0110" => seg <= "0100000";	-- 6
				when "0111" => seg <= "0001111";	-- 7
				when "1000" => seg <= "0000000";	-- 8
				when "1001" => seg <= "0000100";	-- 9
				when "1010" => seg <= "0001000";	-- A
				when "1011" => seg <= "1100000";	-- B
				when "1100" => seg <= "0110001";	-- C
				when "1101" => seg <= "1000010";	-- D
				when "1110" => seg <= "0110000";	-- E
				when others => seg <= "0111000";	-- F
			end case;
		end if;
	end if;
end process;
end Arch;
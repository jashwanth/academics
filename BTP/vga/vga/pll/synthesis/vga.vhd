library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity vga is
port(
clock_24: in std_logic_vector(1 downto 0);
vga_h,vga_v: out std_logic;
vga_r,vga_g,vga_b:out std_logic_vector(3 downto 0);
key : in std_logic_vector(3 downto 0);
sw: in std_logic_vector(1 downto 0)
);
end vga;
architecture main of vga is
signal reset,vgaclk :std_logic:='0';
--------------------------------------
 component pll is
        port (
            clk_in_clk  : in  std_logic := 'X'; -- clk
            reset_reset : in  std_logic := 'X'; -- reset
            clk_out_clk : out std_logic         -- clk
        );
    end component pll;
	 ------------------------------
component sync is
port(
clk: in std_logic;
hsync,vsync:out std_logic;
r,g,b:out std_logic_vector(3 downto 0);
keys:in std_logic_vector(3 downto 0);
s: in std_logic_vector(1 downto 0));
end component sync;
begin 
c1: sync port map(vgaclk,vga_h,vga_v,vga_r,vga_g,vga_b,key,sw);
c2: pll port map(clock_24(0),reset,vgaclk);
end main;

-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 12.0 Build 263 08/02/2012 Service Pack 2 SJ Web Edition"

-- DATE "10/07/2013 16:24:42"

-- 
-- Device: Altera EP2C20F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	vga IS
    PORT (
	clock_24 : IN std_logic_vector(1 DOWNTO 0);
	vga_h : OUT std_logic;
	vga_v : OUT std_logic;
	vga_r : OUT std_logic_vector(3 DOWNTO 0);
	vga_g : OUT std_logic_vector(3 DOWNTO 0);
	vga_b : OUT std_logic_vector(3 DOWNTO 0);
	key : IN std_logic_vector(3 DOWNTO 0);
	sw : IN std_logic_vector(1 DOWNTO 0)
	);
END vga;

-- Design Ports Information
-- clock_24[1]	=>  Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- vga_h	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vga_v	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vga_r[0]	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vga_r[1]	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vga_r[2]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vga_r[3]	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vga_g[0]	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vga_g[1]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vga_g[2]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vga_g[3]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vga_b[0]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vga_b[1]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vga_b[2]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vga_b[3]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sw[1]	=>  Location: PIN_L21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sw[0]	=>  Location: PIN_L22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clock_24[0]	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- key[3]	=>  Location: PIN_T21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- key[2]	=>  Location: PIN_T22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- key[1]	=>  Location: PIN_R21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- key[0]	=>  Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF vga IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock_24 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_vga_h : std_logic;
SIGNAL ww_vga_v : std_logic;
SIGNAL ww_vga_r : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_vga_g : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_vga_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_key : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_sw : std_logic_vector(1 DOWNTO 0);
SIGNAL \c2|altpll_0|sd1|pll_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \c2|altpll_0|sd1|pll_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \c2|altpll_0|sd1|_clk0~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \c2|altpll_0|sd1|pll~CLK1\ : std_logic;
SIGNAL \c2|altpll_0|sd1|pll~CLK2\ : std_logic;
SIGNAL \c1|Add1~1\ : std_logic;
SIGNAL \c1|Add1~0_combout\ : std_logic;
SIGNAL \c1|Add1~3\ : std_logic;
SIGNAL \c1|Add1~2_combout\ : std_logic;
SIGNAL \c1|Add1~5\ : std_logic;
SIGNAL \c1|Add1~4_combout\ : std_logic;
SIGNAL \c1|Add1~7\ : std_logic;
SIGNAL \c1|Add1~6_combout\ : std_logic;
SIGNAL \c1|Add1~9\ : std_logic;
SIGNAL \c1|Add1~8_combout\ : std_logic;
SIGNAL \c1|Add1~11\ : std_logic;
SIGNAL \c1|Add1~10_combout\ : std_logic;
SIGNAL \c1|Add1~13\ : std_logic;
SIGNAL \c1|Add1~12_combout\ : std_logic;
SIGNAL \c1|Add1~15\ : std_logic;
SIGNAL \c1|Add1~14_combout\ : std_logic;
SIGNAL \c1|LessThan3~1_cout\ : std_logic;
SIGNAL \c1|LessThan3~3_cout\ : std_logic;
SIGNAL \c1|LessThan3~5_cout\ : std_logic;
SIGNAL \c1|LessThan3~7_cout\ : std_logic;
SIGNAL \c1|LessThan3~9_cout\ : std_logic;
SIGNAL \c1|LessThan3~11_cout\ : std_logic;
SIGNAL \c1|LessThan3~13_cout\ : std_logic;
SIGNAL \c1|LessThan3~15_cout\ : std_logic;
SIGNAL \c1|LessThan3~17_cout\ : std_logic;
SIGNAL \c1|LessThan3~19_cout\ : std_logic;
SIGNAL \c1|LessThan3~20_combout\ : std_logic;
SIGNAL \c1|Add1~16_combout\ : std_logic;
SIGNAL \c1|Add0~1\ : std_logic;
SIGNAL \c1|Add0~0_combout\ : std_logic;
SIGNAL \c1|Add0~3\ : std_logic;
SIGNAL \c1|Add0~2_combout\ : std_logic;
SIGNAL \c1|Add0~5\ : std_logic;
SIGNAL \c1|Add0~4_combout\ : std_logic;
SIGNAL \c1|Add0~7\ : std_logic;
SIGNAL \c1|Add0~6_combout\ : std_logic;
SIGNAL \c1|Add0~9\ : std_logic;
SIGNAL \c1|Add0~8_combout\ : std_logic;
SIGNAL \c1|Add0~11\ : std_logic;
SIGNAL \c1|Add0~10_combout\ : std_logic;
SIGNAL \c1|Add0~13\ : std_logic;
SIGNAL \c1|Add0~12_combout\ : std_logic;
SIGNAL \c1|Add0~15\ : std_logic;
SIGNAL \c1|Add0~14_combout\ : std_logic;
SIGNAL \c1|LessThan1~1_cout\ : std_logic;
SIGNAL \c1|LessThan1~3_cout\ : std_logic;
SIGNAL \c1|LessThan1~5_cout\ : std_logic;
SIGNAL \c1|LessThan1~7_cout\ : std_logic;
SIGNAL \c1|LessThan1~9_cout\ : std_logic;
SIGNAL \c1|LessThan1~11_cout\ : std_logic;
SIGNAL \c1|LessThan1~13_cout\ : std_logic;
SIGNAL \c1|LessThan1~15_cout\ : std_logic;
SIGNAL \c1|LessThan1~17_cout\ : std_logic;
SIGNAL \c1|LessThan1~19_cout\ : std_logic;
SIGNAL \c1|LessThan1~20_combout\ : std_logic;
SIGNAL \c1|Add0~16_combout\ : std_logic;
SIGNAL \c1|Add3~0_combout\ : std_logic;
SIGNAL \c1|Add3~4_combout\ : std_logic;
SIGNAL \c1|Add3~6_combout\ : std_logic;
SIGNAL \c1|Add2~0_combout\ : std_logic;
SIGNAL \c1|Add2~2_combout\ : std_logic;
SIGNAL \c1|Add2~4_combout\ : std_logic;
SIGNAL \c1|Add2~6_combout\ : std_logic;
SIGNAL \c1|Add2~8_combout\ : std_logic;
SIGNAL \c1|Add2~10_combout\ : std_logic;
SIGNAL \c1|Add2~12_combout\ : std_logic;
SIGNAL \c1|Add2~14_combout\ : std_logic;
SIGNAL \c1|LessThan5~1_cout\ : std_logic;
SIGNAL \c1|LessThan5~3_cout\ : std_logic;
SIGNAL \c1|LessThan5~5_cout\ : std_logic;
SIGNAL \c1|LessThan5~7_cout\ : std_logic;
SIGNAL \c1|LessThan5~9_cout\ : std_logic;
SIGNAL \c1|LessThan5~11_cout\ : std_logic;
SIGNAL \c1|LessThan5~13_cout\ : std_logic;
SIGNAL \c1|LessThan5~15_cout\ : std_logic;
SIGNAL \c1|LessThan5~17_cout\ : std_logic;
SIGNAL \c1|LessThan5~19_cout\ : std_logic;
SIGNAL \c1|LessThan5~20_combout\ : std_logic;
SIGNAL \c1|hpos[3]~17_combout\ : std_logic;
SIGNAL \c1|Add8~3_combout\ : std_logic;
SIGNAL \c1|Add8~5_combout\ : std_logic;
SIGNAL \c1|Add8~7_combout\ : std_logic;
SIGNAL \c1|Add8~19_combout\ : std_logic;
SIGNAL \c1|Add6~3_combout\ : std_logic;
SIGNAL \c1|Add6~9_combout\ : std_logic;
SIGNAL \c1|Add6~11_combout\ : std_logic;
SIGNAL \c1|Add6~17_combout\ : std_logic;
SIGNAL \c1|Add6~19_combout\ : std_logic;
SIGNAL \c1|Add12~3_combout\ : std_logic;
SIGNAL \c1|Add12~7_combout\ : std_logic;
SIGNAL \c1|Add12~13_combout\ : std_logic;
SIGNAL \c1|Add12~15_combout\ : std_logic;
SIGNAL \c1|Add12~20\ : std_logic;
SIGNAL \c1|Add12~21_combout\ : std_logic;
SIGNAL \c1|process_0~0_combout\ : std_logic;
SIGNAL \c1|draw1~0_combout\ : std_logic;
SIGNAL \c1|LessThan16~0_combout\ : std_logic;
SIGNAL \c1|sq_y1[9]~2_combout\ : std_logic;
SIGNAL \c1|sq_y1[3]~5_combout\ : std_logic;
SIGNAL \c1|sq_x1[9]~2_combout\ : std_logic;
SIGNAL \c1|sq_x1[4]~4_combout\ : std_logic;
SIGNAL \c1|sq_y2[7]~2_combout\ : std_logic;
SIGNAL \c1|sq_y2[6]~3_combout\ : std_logic;
SIGNAL \c2|altpll_0|sd1|_clk0\ : std_logic;
SIGNAL \c2|altpll_0|sd1|_clk0~clkctrl_outclk\ : std_logic;
SIGNAL \c1|hpos[0]~11_combout\ : std_logic;
SIGNAL \c1|hpos[4]~20\ : std_logic;
SIGNAL \c1|hpos[5]~22\ : std_logic;
SIGNAL \c1|hpos[6]~24\ : std_logic;
SIGNAL \c1|hpos[7]~25_combout\ : std_logic;
SIGNAL \c1|hpos[7]~26\ : std_logic;
SIGNAL \c1|hpos[8]~27_combout\ : std_logic;
SIGNAL \c1|hpos[8]~28\ : std_logic;
SIGNAL \c1|hpos[9]~29_combout\ : std_logic;
SIGNAL \c1|hpos[9]~30\ : std_logic;
SIGNAL \c1|hpos[10]~31_combout\ : std_logic;
SIGNAL \c1|LessThan8~0_combout\ : std_logic;
SIGNAL \c1|LessThan8~1_combout\ : std_logic;
SIGNAL \c1|hpos[0]~12\ : std_logic;
SIGNAL \c1|hpos[1]~13_combout\ : std_logic;
SIGNAL \c1|hpos[1]~14\ : std_logic;
SIGNAL \c1|hpos[2]~15_combout\ : std_logic;
SIGNAL \c1|hpos[2]~16\ : std_logic;
SIGNAL \c1|hpos[3]~18\ : std_logic;
SIGNAL \c1|hpos[4]~19_combout\ : std_logic;
SIGNAL \c1|hpos[5]~21_combout\ : std_logic;
SIGNAL \c1|process_0~2_combout\ : std_logic;
SIGNAL \c1|hpos[6]~23_combout\ : std_logic;
SIGNAL \c1|process_0~3_combout\ : std_logic;
SIGNAL \c1|hsync~regout\ : std_logic;
SIGNAL \c1|vpos[0]~11_combout\ : std_logic;
SIGNAL \c1|vpos[2]~16\ : std_logic;
SIGNAL \c1|vpos[3]~18\ : std_logic;
SIGNAL \c1|vpos[4]~19_combout\ : std_logic;
SIGNAL \c1|vpos[4]~20\ : std_logic;
SIGNAL \c1|vpos[5]~22\ : std_logic;
SIGNAL \c1|vpos[6]~24\ : std_logic;
SIGNAL \c1|vpos[7]~25_combout\ : std_logic;
SIGNAL \c1|vpos[7]~26\ : std_logic;
SIGNAL \c1|vpos[8]~28\ : std_logic;
SIGNAL \c1|vpos[9]~29_combout\ : std_logic;
SIGNAL \c1|vpos[9]~30\ : std_logic;
SIGNAL \c1|vpos[10]~31_combout\ : std_logic;
SIGNAL \c1|vpos[8]~27_combout\ : std_logic;
SIGNAL \c1|process_0~4_combout\ : std_logic;
SIGNAL \c1|vpos[3]~17_combout\ : std_logic;
SIGNAL \c1|LessThan16~1_combout\ : std_logic;
SIGNAL \c1|LessThan9~0_combout\ : std_logic;
SIGNAL \c1|vpos[0]~12\ : std_logic;
SIGNAL \c1|vpos[1]~13_combout\ : std_logic;
SIGNAL \c1|vpos[1]~14\ : std_logic;
SIGNAL \c1|vpos[2]~15_combout\ : std_logic;
SIGNAL \c1|vpos[5]~21_combout\ : std_logic;
SIGNAL \c1|LessThan12~1_combout\ : std_logic;
SIGNAL \c1|LessThan12~0_combout\ : std_logic;
SIGNAL \c1|process_0~5_combout\ : std_logic;
SIGNAL \c1|vsync~regout\ : std_logic;
SIGNAL \c1|process_0~1_combout\ : std_logic;
SIGNAL \c1|process_0~6_combout\ : std_logic;
SIGNAL \c1|LessThan15~0_combout\ : std_logic;
SIGNAL \c1|process_0~7_combout\ : std_logic;
SIGNAL \c1|process_0~8_combout\ : std_logic;
SIGNAL \c1|LessThan12~2_combout\ : std_logic;
SIGNAL \c1|b~2_combout\ : std_logic;
SIGNAL \c1|Add6~1_combout\ : std_logic;
SIGNAL \c1|sq_x1[10]~0_combout\ : std_logic;
SIGNAL \c1|sq_x1[10]~1_combout\ : std_logic;
SIGNAL \c1|Add6~2\ : std_logic;
SIGNAL \c1|Add6~4\ : std_logic;
SIGNAL \c1|Add6~6\ : std_logic;
SIGNAL \c1|Add6~8\ : std_logic;
SIGNAL \c1|Add6~10\ : std_logic;
SIGNAL \c1|Add6~12\ : std_logic;
SIGNAL \c1|Add6~14\ : std_logic;
SIGNAL \c1|Add6~16\ : std_logic;
SIGNAL \c1|Add6~18\ : std_logic;
SIGNAL \c1|Add6~20\ : std_logic;
SIGNAL \c1|Add6~21_combout\ : std_logic;
SIGNAL \c1|Add6~15_combout\ : std_logic;
SIGNAL \c1|Add6~13_combout\ : std_logic;
SIGNAL \c1|sq_x1[6]~3_combout\ : std_logic;
SIGNAL \c1|Add6~7_combout\ : std_logic;
SIGNAL \c1|sq_x1[3]~5_combout\ : std_logic;
SIGNAL \c1|Add6~5_combout\ : std_logic;
SIGNAL \c1|LessThan0~1_cout\ : std_logic;
SIGNAL \c1|LessThan0~3_cout\ : std_logic;
SIGNAL \c1|LessThan0~5_cout\ : std_logic;
SIGNAL \c1|LessThan0~7_cout\ : std_logic;
SIGNAL \c1|LessThan0~9_cout\ : std_logic;
SIGNAL \c1|LessThan0~11_cout\ : std_logic;
SIGNAL \c1|LessThan0~13_cout\ : std_logic;
SIGNAL \c1|LessThan0~15_cout\ : std_logic;
SIGNAL \c1|LessThan0~17_cout\ : std_logic;
SIGNAL \c1|LessThan0~19_cout\ : std_logic;
SIGNAL \c1|LessThan0~20_combout\ : std_logic;
SIGNAL \c1|Add8~1_combout\ : std_logic;
SIGNAL \c1|sq_y1[10]~0_combout\ : std_logic;
SIGNAL \c1|sq_y1[10]~1_combout\ : std_logic;
SIGNAL \c1|Add8~2\ : std_logic;
SIGNAL \c1|Add8~4\ : std_logic;
SIGNAL \c1|Add8~6\ : std_logic;
SIGNAL \c1|Add8~8\ : std_logic;
SIGNAL \c1|Add8~10\ : std_logic;
SIGNAL \c1|Add8~12\ : std_logic;
SIGNAL \c1|Add8~14\ : std_logic;
SIGNAL \c1|Add8~16\ : std_logic;
SIGNAL \c1|Add8~18\ : std_logic;
SIGNAL \c1|Add8~20\ : std_logic;
SIGNAL \c1|Add8~21_combout\ : std_logic;
SIGNAL \c1|Add8~17_combout\ : std_logic;
SIGNAL \c1|Add8~15_combout\ : std_logic;
SIGNAL \c1|Add8~13_combout\ : std_logic;
SIGNAL \c1|sq_y1[6]~3_combout\ : std_logic;
SIGNAL \c1|Add8~11_combout\ : std_logic;
SIGNAL \c1|Add8~9_combout\ : std_logic;
SIGNAL \c1|sq_y1[4]~4_combout\ : std_logic;
SIGNAL \c1|LessThan2~1_cout\ : std_logic;
SIGNAL \c1|LessThan2~3_cout\ : std_logic;
SIGNAL \c1|LessThan2~5_cout\ : std_logic;
SIGNAL \c1|LessThan2~7_cout\ : std_logic;
SIGNAL \c1|LessThan2~9_cout\ : std_logic;
SIGNAL \c1|LessThan2~11_cout\ : std_logic;
SIGNAL \c1|LessThan2~13_cout\ : std_logic;
SIGNAL \c1|LessThan2~15_cout\ : std_logic;
SIGNAL \c1|LessThan2~17_cout\ : std_logic;
SIGNAL \c1|LessThan2~19_cout\ : std_logic;
SIGNAL \c1|LessThan2~20_combout\ : std_logic;
SIGNAL \c1|draw1~1_combout\ : std_logic;
SIGNAL \c1|Add10~1_combout\ : std_logic;
SIGNAL \c1|sq_x2[10]~0_combout\ : std_logic;
SIGNAL \c1|Add10~2\ : std_logic;
SIGNAL \c1|Add10~3_combout\ : std_logic;
SIGNAL \c1|Add10~4\ : std_logic;
SIGNAL \c1|Add10~5_combout\ : std_logic;
SIGNAL \c1|sq_x2[2]~6_combout\ : std_logic;
SIGNAL \c1|Add10~6\ : std_logic;
SIGNAL \c1|Add10~7_combout\ : std_logic;
SIGNAL \c1|Add10~8\ : std_logic;
SIGNAL \c1|Add10~9_combout\ : std_logic;
SIGNAL \c1|sq_x2[4]~5_combout\ : std_logic;
SIGNAL \c1|Add10~10\ : std_logic;
SIGNAL \c1|Add10~11_combout\ : std_logic;
SIGNAL \c1|sq_x2[5]~4_combout\ : std_logic;
SIGNAL \c1|Add10~12\ : std_logic;
SIGNAL \c1|Add10~13_combout\ : std_logic;
SIGNAL \c1|sq_x2[6]~3_combout\ : std_logic;
SIGNAL \c1|Add10~14\ : std_logic;
SIGNAL \c1|Add10~15_combout\ : std_logic;
SIGNAL \c1|sq_x2[7]~2_combout\ : std_logic;
SIGNAL \c1|Add10~16\ : std_logic;
SIGNAL \c1|Add10~17_combout\ : std_logic;
SIGNAL \c1|sq_x2[8]~1_combout\ : std_logic;
SIGNAL \c1|Add10~18\ : std_logic;
SIGNAL \c1|Add10~19_combout\ : std_logic;
SIGNAL \c1|LessThan4~1_cout\ : std_logic;
SIGNAL \c1|LessThan4~3_cout\ : std_logic;
SIGNAL \c1|LessThan4~5_cout\ : std_logic;
SIGNAL \c1|LessThan4~7_cout\ : std_logic;
SIGNAL \c1|LessThan4~9_cout\ : std_logic;
SIGNAL \c1|LessThan4~11_cout\ : std_logic;
SIGNAL \c1|LessThan4~13_cout\ : std_logic;
SIGNAL \c1|LessThan4~15_cout\ : std_logic;
SIGNAL \c1|LessThan4~17_cout\ : std_logic;
SIGNAL \c1|LessThan4~19_cout\ : std_logic;
SIGNAL \c1|LessThan4~20_combout\ : std_logic;
SIGNAL \c1|vpos[6]~23_combout\ : std_logic;
SIGNAL \c1|Add12~2\ : std_logic;
SIGNAL \c1|Add12~4\ : std_logic;
SIGNAL \c1|Add12~6\ : std_logic;
SIGNAL \c1|Add12~8\ : std_logic;
SIGNAL \c1|Add12~10\ : std_logic;
SIGNAL \c1|Add12~11_combout\ : std_logic;
SIGNAL \c1|sq_y2[5]~4_combout\ : std_logic;
SIGNAL \c1|sq_y2[10]~0_combout\ : std_logic;
SIGNAL \c1|Add12~9_combout\ : std_logic;
SIGNAL \c1|sq_y2[4]~5_combout\ : std_logic;
SIGNAL \c1|Add12~5_combout\ : std_logic;
SIGNAL \c1|sq_y2[2]~6_combout\ : std_logic;
SIGNAL \c1|Add12~1_combout\ : std_logic;
SIGNAL \c1|LessThan6~1_cout\ : std_logic;
SIGNAL \c1|LessThan6~3_cout\ : std_logic;
SIGNAL \c1|LessThan6~5_cout\ : std_logic;
SIGNAL \c1|LessThan6~7_cout\ : std_logic;
SIGNAL \c1|LessThan6~9_cout\ : std_logic;
SIGNAL \c1|LessThan6~11_cout\ : std_logic;
SIGNAL \c1|LessThan6~13_cout\ : std_logic;
SIGNAL \c1|LessThan6~15_cout\ : std_logic;
SIGNAL \c1|LessThan6~17_cout\ : std_logic;
SIGNAL \c1|LessThan6~19_cout\ : std_logic;
SIGNAL \c1|LessThan6~20_combout\ : std_logic;
SIGNAL \c1|draw2~1_combout\ : std_logic;
SIGNAL \c1|Add10~20\ : std_logic;
SIGNAL \c1|Add10~21_combout\ : std_logic;
SIGNAL \c1|Add2~1\ : std_logic;
SIGNAL \c1|Add2~3\ : std_logic;
SIGNAL \c1|Add2~5\ : std_logic;
SIGNAL \c1|Add2~7\ : std_logic;
SIGNAL \c1|Add2~9\ : std_logic;
SIGNAL \c1|Add2~11\ : std_logic;
SIGNAL \c1|Add2~13\ : std_logic;
SIGNAL \c1|Add2~15\ : std_logic;
SIGNAL \c1|Add2~16_combout\ : std_logic;
SIGNAL \c1|Add12~12\ : std_logic;
SIGNAL \c1|Add12~14\ : std_logic;
SIGNAL \c1|Add12~16\ : std_logic;
SIGNAL \c1|Add12~18\ : std_logic;
SIGNAL \c1|Add12~19_combout\ : std_logic;
SIGNAL \c1|Add12~17_combout\ : std_logic;
SIGNAL \c1|sq_y2[8]~1_combout\ : std_logic;
SIGNAL \c1|Add3~1\ : std_logic;
SIGNAL \c1|Add3~3\ : std_logic;
SIGNAL \c1|Add3~5\ : std_logic;
SIGNAL \c1|Add3~7\ : std_logic;
SIGNAL \c1|Add3~9\ : std_logic;
SIGNAL \c1|Add3~11\ : std_logic;
SIGNAL \c1|Add3~13\ : std_logic;
SIGNAL \c1|Add3~15\ : std_logic;
SIGNAL \c1|Add3~16_combout\ : std_logic;
SIGNAL \c1|Add3~14_combout\ : std_logic;
SIGNAL \c1|Add3~12_combout\ : std_logic;
SIGNAL \c1|Add3~10_combout\ : std_logic;
SIGNAL \c1|Add3~8_combout\ : std_logic;
SIGNAL \c1|Add3~2_combout\ : std_logic;
SIGNAL \c1|LessThan7~1_cout\ : std_logic;
SIGNAL \c1|LessThan7~3_cout\ : std_logic;
SIGNAL \c1|LessThan7~5_cout\ : std_logic;
SIGNAL \c1|LessThan7~7_cout\ : std_logic;
SIGNAL \c1|LessThan7~9_cout\ : std_logic;
SIGNAL \c1|LessThan7~11_cout\ : std_logic;
SIGNAL \c1|LessThan7~13_cout\ : std_logic;
SIGNAL \c1|LessThan7~15_cout\ : std_logic;
SIGNAL \c1|LessThan7~17_cout\ : std_logic;
SIGNAL \c1|LessThan7~19_cout\ : std_logic;
SIGNAL \c1|LessThan7~20_combout\ : std_logic;
SIGNAL \c1|draw2~0_combout\ : std_logic;
SIGNAL \c1|r~0_combout\ : std_logic;
SIGNAL \c1|r~1_combout\ : std_logic;
SIGNAL \c1|b~3_combout\ : std_logic;
SIGNAL \c1|b~5_combout\ : std_logic;
SIGNAL \c1|b~4_combout\ : std_logic;
SIGNAL \c1|vpos\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \c1|sq_y2\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \c1|sq_y1\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \c1|sq_x2\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \c1|sq_x1\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \c1|r\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \c1|hpos\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \c1|b\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sw~combout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \key~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clock_24~combout\ : std_logic_vector(1 DOWNTO 0);

BEGIN

ww_clock_24 <= clock_24;
vga_h <= ww_vga_h;
vga_v <= ww_vga_v;
vga_r <= ww_vga_r;
vga_g <= ww_vga_g;
vga_b <= ww_vga_b;
ww_key <= key;
ww_sw <= sw;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\c2|altpll_0|sd1|pll_INCLK_bus\ <= (gnd & \clock_24~combout\(0));

\c2|altpll_0|sd1|_clk0\ <= \c2|altpll_0|sd1|pll_CLK_bus\(0);
\c2|altpll_0|sd1|pll~CLK1\ <= \c2|altpll_0|sd1|pll_CLK_bus\(1);
\c2|altpll_0|sd1|pll~CLK2\ <= \c2|altpll_0|sd1|pll_CLK_bus\(2);

\c2|altpll_0|sd1|_clk0~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \c2|altpll_0|sd1|_clk0\);

-- Location: LCFF_X32_Y14_N7
\c1|hpos[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|hpos[3]~17_combout\,
	sclr => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|hpos\(3));

-- Location: LCCOMB_X37_Y14_N10
\c1|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add1~0_combout\ = (\c1|sq_y1\(2) & (\c1|sq_y1\(3) $ (GND))) # (!\c1|sq_y1\(2) & (!\c1|sq_y1\(3) & VCC))
-- \c1|Add1~1\ = CARRY((\c1|sq_y1\(2) & !\c1|sq_y1\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(2),
	datab => \c1|sq_y1\(3),
	datad => VCC,
	combout => \c1|Add1~0_combout\,
	cout => \c1|Add1~1\);

-- Location: LCCOMB_X37_Y14_N12
\c1|Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add1~2_combout\ = (\c1|sq_y1\(4) & ((\c1|Add1~1\) # (GND))) # (!\c1|sq_y1\(4) & (!\c1|Add1~1\))
-- \c1|Add1~3\ = CARRY((\c1|sq_y1\(4)) # (!\c1|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_y1\(4),
	datad => VCC,
	cin => \c1|Add1~1\,
	combout => \c1|Add1~2_combout\,
	cout => \c1|Add1~3\);

-- Location: LCCOMB_X37_Y14_N14
\c1|Add1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add1~4_combout\ = (\c1|sq_y1\(5) & ((GND) # (!\c1|Add1~3\))) # (!\c1|sq_y1\(5) & (\c1|Add1~3\ $ (GND)))
-- \c1|Add1~5\ = CARRY((\c1|sq_y1\(5)) # (!\c1|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_y1\(5),
	datad => VCC,
	cin => \c1|Add1~3\,
	combout => \c1|Add1~4_combout\,
	cout => \c1|Add1~5\);

-- Location: LCCOMB_X37_Y14_N16
\c1|Add1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add1~6_combout\ = (\c1|sq_y1\(6) & (!\c1|Add1~5\)) # (!\c1|sq_y1\(6) & (\c1|Add1~5\ & VCC))
-- \c1|Add1~7\ = CARRY((\c1|sq_y1\(6) & !\c1|Add1~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_y1\(6),
	datad => VCC,
	cin => \c1|Add1~5\,
	combout => \c1|Add1~6_combout\,
	cout => \c1|Add1~7\);

-- Location: LCCOMB_X37_Y14_N18
\c1|Add1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add1~8_combout\ = (\c1|sq_y1\(7) & (\c1|Add1~7\ $ (GND))) # (!\c1|sq_y1\(7) & (!\c1|Add1~7\ & VCC))
-- \c1|Add1~9\ = CARRY((\c1|sq_y1\(7) & !\c1|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_y1\(7),
	datad => VCC,
	cin => \c1|Add1~7\,
	combout => \c1|Add1~8_combout\,
	cout => \c1|Add1~9\);

-- Location: LCCOMB_X37_Y14_N20
\c1|Add1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add1~10_combout\ = (\c1|sq_y1\(8) & (!\c1|Add1~9\)) # (!\c1|sq_y1\(8) & ((\c1|Add1~9\) # (GND)))
-- \c1|Add1~11\ = CARRY((!\c1|Add1~9\) # (!\c1|sq_y1\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(8),
	datad => VCC,
	cin => \c1|Add1~9\,
	combout => \c1|Add1~10_combout\,
	cout => \c1|Add1~11\);

-- Location: LCCOMB_X37_Y14_N22
\c1|Add1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add1~12_combout\ = (\c1|sq_y1\(9) & (!\c1|Add1~11\ & VCC)) # (!\c1|sq_y1\(9) & (\c1|Add1~11\ $ (GND)))
-- \c1|Add1~13\ = CARRY((!\c1|sq_y1\(9) & !\c1|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_y1\(9),
	datad => VCC,
	cin => \c1|Add1~11\,
	combout => \c1|Add1~12_combout\,
	cout => \c1|Add1~13\);

-- Location: LCCOMB_X37_Y14_N24
\c1|Add1~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add1~14_combout\ = (\c1|sq_y1\(10) & (!\c1|Add1~13\)) # (!\c1|sq_y1\(10) & ((\c1|Add1~13\) # (GND)))
-- \c1|Add1~15\ = CARRY((!\c1|Add1~13\) # (!\c1|sq_y1\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_y1\(10),
	datad => VCC,
	cin => \c1|Add1~13\,
	combout => \c1|Add1~14_combout\,
	cout => \c1|Add1~15\);

-- Location: LCCOMB_X36_Y14_N4
\c1|LessThan3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan3~1_cout\ = CARRY((\c1|sq_y1\(0) & !\c1|vpos\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(0),
	datab => \c1|vpos\(0),
	datad => VCC,
	cout => \c1|LessThan3~1_cout\);

-- Location: LCCOMB_X36_Y14_N6
\c1|LessThan3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan3~3_cout\ = CARRY((\c1|vpos\(1) & ((!\c1|LessThan3~1_cout\) # (!\c1|sq_y1\(1)))) # (!\c1|vpos\(1) & (!\c1|sq_y1\(1) & !\c1|LessThan3~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(1),
	datab => \c1|sq_y1\(1),
	datad => VCC,
	cin => \c1|LessThan3~1_cout\,
	cout => \c1|LessThan3~3_cout\);

-- Location: LCCOMB_X36_Y14_N8
\c1|LessThan3~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan3~5_cout\ = CARRY((\c1|sq_y1\(2) & (!\c1|vpos\(2) & !\c1|LessThan3~3_cout\)) # (!\c1|sq_y1\(2) & ((!\c1|LessThan3~3_cout\) # (!\c1|vpos\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(2),
	datab => \c1|vpos\(2),
	datad => VCC,
	cin => \c1|LessThan3~3_cout\,
	cout => \c1|LessThan3~5_cout\);

-- Location: LCCOMB_X36_Y14_N10
\c1|LessThan3~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan3~7_cout\ = CARRY((\c1|vpos\(3) & ((!\c1|LessThan3~5_cout\) # (!\c1|Add1~0_combout\))) # (!\c1|vpos\(3) & (!\c1|Add1~0_combout\ & !\c1|LessThan3~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(3),
	datab => \c1|Add1~0_combout\,
	datad => VCC,
	cin => \c1|LessThan3~5_cout\,
	cout => \c1|LessThan3~7_cout\);

-- Location: LCCOMB_X36_Y14_N12
\c1|LessThan3~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan3~9_cout\ = CARRY((\c1|vpos\(4) & (\c1|Add1~2_combout\ & !\c1|LessThan3~7_cout\)) # (!\c1|vpos\(4) & ((\c1|Add1~2_combout\) # (!\c1|LessThan3~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(4),
	datab => \c1|Add1~2_combout\,
	datad => VCC,
	cin => \c1|LessThan3~7_cout\,
	cout => \c1|LessThan3~9_cout\);

-- Location: LCCOMB_X36_Y14_N14
\c1|LessThan3~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan3~11_cout\ = CARRY((\c1|vpos\(5) & ((!\c1|LessThan3~9_cout\) # (!\c1|Add1~4_combout\))) # (!\c1|vpos\(5) & (!\c1|Add1~4_combout\ & !\c1|LessThan3~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(5),
	datab => \c1|Add1~4_combout\,
	datad => VCC,
	cin => \c1|LessThan3~9_cout\,
	cout => \c1|LessThan3~11_cout\);

-- Location: LCCOMB_X36_Y14_N16
\c1|LessThan3~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan3~13_cout\ = CARRY((\c1|Add1~6_combout\ & ((!\c1|LessThan3~11_cout\) # (!\c1|vpos\(6)))) # (!\c1|Add1~6_combout\ & (!\c1|vpos\(6) & !\c1|LessThan3~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|Add1~6_combout\,
	datab => \c1|vpos\(6),
	datad => VCC,
	cin => \c1|LessThan3~11_cout\,
	cout => \c1|LessThan3~13_cout\);

-- Location: LCCOMB_X36_Y14_N18
\c1|LessThan3~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan3~15_cout\ = CARRY((\c1|vpos\(7) & ((!\c1|LessThan3~13_cout\) # (!\c1|Add1~8_combout\))) # (!\c1|vpos\(7) & (!\c1|Add1~8_combout\ & !\c1|LessThan3~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(7),
	datab => \c1|Add1~8_combout\,
	datad => VCC,
	cin => \c1|LessThan3~13_cout\,
	cout => \c1|LessThan3~15_cout\);

-- Location: LCCOMB_X36_Y14_N20
\c1|LessThan3~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan3~17_cout\ = CARRY((\c1|Add1~10_combout\ & ((!\c1|LessThan3~15_cout\) # (!\c1|vpos\(8)))) # (!\c1|Add1~10_combout\ & (!\c1|vpos\(8) & !\c1|LessThan3~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|Add1~10_combout\,
	datab => \c1|vpos\(8),
	datad => VCC,
	cin => \c1|LessThan3~15_cout\,
	cout => \c1|LessThan3~17_cout\);

-- Location: LCCOMB_X36_Y14_N22
\c1|LessThan3~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan3~19_cout\ = CARRY((\c1|vpos\(9) & ((!\c1|LessThan3~17_cout\) # (!\c1|Add1~12_combout\))) # (!\c1|vpos\(9) & (!\c1|Add1~12_combout\ & !\c1|LessThan3~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(9),
	datab => \c1|Add1~12_combout\,
	datad => VCC,
	cin => \c1|LessThan3~17_cout\,
	cout => \c1|LessThan3~19_cout\);

-- Location: LCCOMB_X36_Y14_N24
\c1|LessThan3~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan3~20_combout\ = (\c1|vpos\(10) & (!\c1|LessThan3~19_cout\ & \c1|Add1~14_combout\)) # (!\c1|vpos\(10) & ((\c1|Add1~14_combout\) # (!\c1|LessThan3~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|vpos\(10),
	datad => \c1|Add1~14_combout\,
	cin => \c1|LessThan3~19_cout\,
	combout => \c1|LessThan3~20_combout\);

-- Location: LCCOMB_X37_Y14_N26
\c1|Add1~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add1~16_combout\ = !\c1|Add1~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \c1|Add1~15\,
	combout => \c1|Add1~16_combout\);

-- Location: LCCOMB_X33_Y13_N10
\c1|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add0~0_combout\ = (\c1|sq_x1\(2) & (\c1|sq_x1\(3) $ (GND))) # (!\c1|sq_x1\(2) & (!\c1|sq_x1\(3) & VCC))
-- \c1|Add0~1\ = CARRY((\c1|sq_x1\(2) & !\c1|sq_x1\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(2),
	datab => \c1|sq_x1\(3),
	datad => VCC,
	combout => \c1|Add0~0_combout\,
	cout => \c1|Add0~1\);

-- Location: LCCOMB_X33_Y13_N12
\c1|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add0~2_combout\ = (\c1|sq_x1\(4) & ((\c1|Add0~1\) # (GND))) # (!\c1|sq_x1\(4) & (!\c1|Add0~1\))
-- \c1|Add0~3\ = CARRY((\c1|sq_x1\(4)) # (!\c1|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x1\(4),
	datad => VCC,
	cin => \c1|Add0~1\,
	combout => \c1|Add0~2_combout\,
	cout => \c1|Add0~3\);

-- Location: LCCOMB_X33_Y13_N14
\c1|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add0~4_combout\ = (\c1|sq_x1\(5) & ((GND) # (!\c1|Add0~3\))) # (!\c1|sq_x1\(5) & (\c1|Add0~3\ $ (GND)))
-- \c1|Add0~5\ = CARRY((\c1|sq_x1\(5)) # (!\c1|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x1\(5),
	datad => VCC,
	cin => \c1|Add0~3\,
	combout => \c1|Add0~4_combout\,
	cout => \c1|Add0~5\);

-- Location: LCCOMB_X33_Y13_N16
\c1|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add0~6_combout\ = (\c1|sq_x1\(6) & (!\c1|Add0~5\)) # (!\c1|sq_x1\(6) & (\c1|Add0~5\ & VCC))
-- \c1|Add0~7\ = CARRY((\c1|sq_x1\(6) & !\c1|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x1\(6),
	datad => VCC,
	cin => \c1|Add0~5\,
	combout => \c1|Add0~6_combout\,
	cout => \c1|Add0~7\);

-- Location: LCCOMB_X33_Y13_N18
\c1|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add0~8_combout\ = (\c1|sq_x1\(7) & (\c1|Add0~7\ $ (GND))) # (!\c1|sq_x1\(7) & (!\c1|Add0~7\ & VCC))
-- \c1|Add0~9\ = CARRY((\c1|sq_x1\(7) & !\c1|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(7),
	datad => VCC,
	cin => \c1|Add0~7\,
	combout => \c1|Add0~8_combout\,
	cout => \c1|Add0~9\);

-- Location: LCCOMB_X33_Y13_N20
\c1|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add0~10_combout\ = (\c1|sq_x1\(8) & (!\c1|Add0~9\)) # (!\c1|sq_x1\(8) & ((\c1|Add0~9\) # (GND)))
-- \c1|Add0~11\ = CARRY((!\c1|Add0~9\) # (!\c1|sq_x1\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x1\(8),
	datad => VCC,
	cin => \c1|Add0~9\,
	combout => \c1|Add0~10_combout\,
	cout => \c1|Add0~11\);

-- Location: LCCOMB_X33_Y13_N22
\c1|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add0~12_combout\ = (\c1|sq_x1\(9) & (!\c1|Add0~11\ & VCC)) # (!\c1|sq_x1\(9) & (\c1|Add0~11\ $ (GND)))
-- \c1|Add0~13\ = CARRY((!\c1|sq_x1\(9) & !\c1|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x1\(9),
	datad => VCC,
	cin => \c1|Add0~11\,
	combout => \c1|Add0~12_combout\,
	cout => \c1|Add0~13\);

-- Location: LCCOMB_X33_Y13_N24
\c1|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add0~14_combout\ = (\c1|sq_x1\(10) & (!\c1|Add0~13\)) # (!\c1|sq_x1\(10) & ((\c1|Add0~13\) # (GND)))
-- \c1|Add0~15\ = CARRY((!\c1|Add0~13\) # (!\c1|sq_x1\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x1\(10),
	datad => VCC,
	cin => \c1|Add0~13\,
	combout => \c1|Add0~14_combout\,
	cout => \c1|Add0~15\);

-- Location: LCCOMB_X32_Y13_N10
\c1|LessThan1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan1~1_cout\ = CARRY((!\c1|hpos\(0) & \c1|sq_x1\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(0),
	datab => \c1|sq_x1\(0),
	datad => VCC,
	cout => \c1|LessThan1~1_cout\);

-- Location: LCCOMB_X32_Y13_N12
\c1|LessThan1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan1~3_cout\ = CARRY((\c1|sq_x1\(1) & (\c1|hpos\(1) & !\c1|LessThan1~1_cout\)) # (!\c1|sq_x1\(1) & ((\c1|hpos\(1)) # (!\c1|LessThan1~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(1),
	datab => \c1|hpos\(1),
	datad => VCC,
	cin => \c1|LessThan1~1_cout\,
	cout => \c1|LessThan1~3_cout\);

-- Location: LCCOMB_X32_Y13_N14
\c1|LessThan1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan1~5_cout\ = CARRY((\c1|sq_x1\(2) & (!\c1|hpos\(2) & !\c1|LessThan1~3_cout\)) # (!\c1|sq_x1\(2) & ((!\c1|LessThan1~3_cout\) # (!\c1|hpos\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(2),
	datab => \c1|hpos\(2),
	datad => VCC,
	cin => \c1|LessThan1~3_cout\,
	cout => \c1|LessThan1~5_cout\);

-- Location: LCCOMB_X32_Y13_N16
\c1|LessThan1~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan1~7_cout\ = CARRY((\c1|hpos\(3) & ((!\c1|LessThan1~5_cout\) # (!\c1|Add0~0_combout\))) # (!\c1|hpos\(3) & (!\c1|Add0~0_combout\ & !\c1|LessThan1~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(3),
	datab => \c1|Add0~0_combout\,
	datad => VCC,
	cin => \c1|LessThan1~5_cout\,
	cout => \c1|LessThan1~7_cout\);

-- Location: LCCOMB_X32_Y13_N18
\c1|LessThan1~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan1~9_cout\ = CARRY((\c1|hpos\(4) & (\c1|Add0~2_combout\ & !\c1|LessThan1~7_cout\)) # (!\c1|hpos\(4) & ((\c1|Add0~2_combout\) # (!\c1|LessThan1~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(4),
	datab => \c1|Add0~2_combout\,
	datad => VCC,
	cin => \c1|LessThan1~7_cout\,
	cout => \c1|LessThan1~9_cout\);

-- Location: LCCOMB_X32_Y13_N20
\c1|LessThan1~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan1~11_cout\ = CARRY((\c1|hpos\(5) & ((!\c1|LessThan1~9_cout\) # (!\c1|Add0~4_combout\))) # (!\c1|hpos\(5) & (!\c1|Add0~4_combout\ & !\c1|LessThan1~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(5),
	datab => \c1|Add0~4_combout\,
	datad => VCC,
	cin => \c1|LessThan1~9_cout\,
	cout => \c1|LessThan1~11_cout\);

-- Location: LCCOMB_X32_Y13_N22
\c1|LessThan1~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan1~13_cout\ = CARRY((\c1|Add0~6_combout\ & ((!\c1|LessThan1~11_cout\) # (!\c1|hpos\(6)))) # (!\c1|Add0~6_combout\ & (!\c1|hpos\(6) & !\c1|LessThan1~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|Add0~6_combout\,
	datab => \c1|hpos\(6),
	datad => VCC,
	cin => \c1|LessThan1~11_cout\,
	cout => \c1|LessThan1~13_cout\);

-- Location: LCCOMB_X32_Y13_N24
\c1|LessThan1~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan1~15_cout\ = CARRY((\c1|hpos\(7) & ((!\c1|LessThan1~13_cout\) # (!\c1|Add0~8_combout\))) # (!\c1|hpos\(7) & (!\c1|Add0~8_combout\ & !\c1|LessThan1~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(7),
	datab => \c1|Add0~8_combout\,
	datad => VCC,
	cin => \c1|LessThan1~13_cout\,
	cout => \c1|LessThan1~15_cout\);

-- Location: LCCOMB_X32_Y13_N26
\c1|LessThan1~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan1~17_cout\ = CARRY((\c1|hpos\(8) & (\c1|Add0~10_combout\ & !\c1|LessThan1~15_cout\)) # (!\c1|hpos\(8) & ((\c1|Add0~10_combout\) # (!\c1|LessThan1~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(8),
	datab => \c1|Add0~10_combout\,
	datad => VCC,
	cin => \c1|LessThan1~15_cout\,
	cout => \c1|LessThan1~17_cout\);

-- Location: LCCOMB_X32_Y13_N28
\c1|LessThan1~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan1~19_cout\ = CARRY((\c1|Add0~12_combout\ & (\c1|hpos\(9) & !\c1|LessThan1~17_cout\)) # (!\c1|Add0~12_combout\ & ((\c1|hpos\(9)) # (!\c1|LessThan1~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|Add0~12_combout\,
	datab => \c1|hpos\(9),
	datad => VCC,
	cin => \c1|LessThan1~17_cout\,
	cout => \c1|LessThan1~19_cout\);

-- Location: LCCOMB_X32_Y13_N30
\c1|LessThan1~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan1~20_combout\ = (\c1|hpos\(10) & (!\c1|LessThan1~19_cout\ & \c1|Add0~14_combout\)) # (!\c1|hpos\(10) & ((\c1|Add0~14_combout\) # (!\c1|LessThan1~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(10),
	datad => \c1|Add0~14_combout\,
	cin => \c1|LessThan1~19_cout\,
	combout => \c1|LessThan1~20_combout\);

-- Location: LCCOMB_X33_Y13_N26
\c1|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add0~16_combout\ = !\c1|Add0~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \c1|Add0~15\,
	combout => \c1|Add0~16_combout\);

-- Location: LCCOMB_X33_Y15_N14
\c1|Add3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add3~0_combout\ = (\c1|sq_y2\(3) & (\c1|sq_y2\(2) $ (GND))) # (!\c1|sq_y2\(3) & (!\c1|sq_y2\(2) & VCC))
-- \c1|Add3~1\ = CARRY((\c1|sq_y2\(3) & !\c1|sq_y2\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(3),
	datab => \c1|sq_y2\(2),
	datad => VCC,
	combout => \c1|Add3~0_combout\,
	cout => \c1|Add3~1\);

-- Location: LCCOMB_X33_Y15_N18
\c1|Add3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add3~4_combout\ = (\c1|sq_y2\(5) & (\c1|Add3~3\ $ (GND))) # (!\c1|sq_y2\(5) & ((GND) # (!\c1|Add3~3\)))
-- \c1|Add3~5\ = CARRY((!\c1|Add3~3\) # (!\c1|sq_y2\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(5),
	datad => VCC,
	cin => \c1|Add3~3\,
	combout => \c1|Add3~4_combout\,
	cout => \c1|Add3~5\);

-- Location: LCCOMB_X33_Y15_N20
\c1|Add3~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add3~6_combout\ = (\c1|sq_y2\(6) & (!\c1|Add3~5\)) # (!\c1|sq_y2\(6) & (\c1|Add3~5\ & VCC))
-- \c1|Add3~7\ = CARRY((\c1|sq_y2\(6) & !\c1|Add3~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(6),
	datad => VCC,
	cin => \c1|Add3~5\,
	combout => \c1|Add3~6_combout\,
	cout => \c1|Add3~7\);

-- Location: LCCOMB_X33_Y12_N12
\c1|Add2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add2~0_combout\ = (\c1|sq_x2\(2) & (\c1|sq_x2\(3) & VCC)) # (!\c1|sq_x2\(2) & (\c1|sq_x2\(3) $ (VCC)))
-- \c1|Add2~1\ = CARRY((!\c1|sq_x2\(2) & \c1|sq_x2\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x2\(2),
	datab => \c1|sq_x2\(3),
	datad => VCC,
	combout => \c1|Add2~0_combout\,
	cout => \c1|Add2~1\);

-- Location: LCCOMB_X33_Y12_N14
\c1|Add2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add2~2_combout\ = (\c1|sq_x2\(4) & ((\c1|Add2~1\) # (GND))) # (!\c1|sq_x2\(4) & (!\c1|Add2~1\))
-- \c1|Add2~3\ = CARRY((\c1|sq_x2\(4)) # (!\c1|Add2~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x2\(4),
	datad => VCC,
	cin => \c1|Add2~1\,
	combout => \c1|Add2~2_combout\,
	cout => \c1|Add2~3\);

-- Location: LCCOMB_X33_Y12_N16
\c1|Add2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add2~4_combout\ = (\c1|sq_x2\(5) & (\c1|Add2~3\ $ (GND))) # (!\c1|sq_x2\(5) & ((GND) # (!\c1|Add2~3\)))
-- \c1|Add2~5\ = CARRY((!\c1|Add2~3\) # (!\c1|sq_x2\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x2\(5),
	datad => VCC,
	cin => \c1|Add2~3\,
	combout => \c1|Add2~4_combout\,
	cout => \c1|Add2~5\);

-- Location: LCCOMB_X33_Y12_N18
\c1|Add2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add2~6_combout\ = (\c1|sq_x2\(6) & (!\c1|Add2~5\)) # (!\c1|sq_x2\(6) & (\c1|Add2~5\ & VCC))
-- \c1|Add2~7\ = CARRY((\c1|sq_x2\(6) & !\c1|Add2~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x2\(6),
	datad => VCC,
	cin => \c1|Add2~5\,
	combout => \c1|Add2~6_combout\,
	cout => \c1|Add2~7\);

-- Location: LCCOMB_X33_Y12_N20
\c1|Add2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add2~8_combout\ = (\c1|sq_x2\(7) & (!\c1|Add2~7\ & VCC)) # (!\c1|sq_x2\(7) & (\c1|Add2~7\ $ (GND)))
-- \c1|Add2~9\ = CARRY((!\c1|sq_x2\(7) & !\c1|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x2\(7),
	datad => VCC,
	cin => \c1|Add2~7\,
	combout => \c1|Add2~8_combout\,
	cout => \c1|Add2~9\);

-- Location: LCCOMB_X33_Y12_N22
\c1|Add2~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add2~10_combout\ = (\c1|sq_x2\(8) & ((\c1|Add2~9\) # (GND))) # (!\c1|sq_x2\(8) & (!\c1|Add2~9\))
-- \c1|Add2~11\ = CARRY((\c1|sq_x2\(8)) # (!\c1|Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x2\(8),
	datad => VCC,
	cin => \c1|Add2~9\,
	combout => \c1|Add2~10_combout\,
	cout => \c1|Add2~11\);

-- Location: LCCOMB_X33_Y12_N24
\c1|Add2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add2~12_combout\ = (\c1|sq_x2\(9) & (\c1|Add2~11\ $ (GND))) # (!\c1|sq_x2\(9) & (!\c1|Add2~11\ & VCC))
-- \c1|Add2~13\ = CARRY((\c1|sq_x2\(9) & !\c1|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x2\(9),
	datad => VCC,
	cin => \c1|Add2~11\,
	combout => \c1|Add2~12_combout\,
	cout => \c1|Add2~13\);

-- Location: LCCOMB_X33_Y12_N26
\c1|Add2~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add2~14_combout\ = (\c1|sq_x2\(10) & (!\c1|Add2~13\)) # (!\c1|sq_x2\(10) & ((\c1|Add2~13\) # (GND)))
-- \c1|Add2~15\ = CARRY((!\c1|Add2~13\) # (!\c1|sq_x2\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x2\(10),
	datad => VCC,
	cin => \c1|Add2~13\,
	combout => \c1|Add2~14_combout\,
	cout => \c1|Add2~15\);

-- Location: LCCOMB_X32_Y12_N8
\c1|LessThan5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan5~1_cout\ = CARRY((!\c1|hpos\(0) & \c1|sq_x2\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(0),
	datab => \c1|sq_x2\(0),
	datad => VCC,
	cout => \c1|LessThan5~1_cout\);

-- Location: LCCOMB_X32_Y12_N10
\c1|LessThan5~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan5~3_cout\ = CARRY((\c1|sq_x2\(1) & (\c1|hpos\(1) & !\c1|LessThan5~1_cout\)) # (!\c1|sq_x2\(1) & ((\c1|hpos\(1)) # (!\c1|LessThan5~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x2\(1),
	datab => \c1|hpos\(1),
	datad => VCC,
	cin => \c1|LessThan5~1_cout\,
	cout => \c1|LessThan5~3_cout\);

-- Location: LCCOMB_X32_Y12_N12
\c1|LessThan5~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan5~5_cout\ = CARRY((\c1|sq_x2\(2) & ((!\c1|LessThan5~3_cout\) # (!\c1|hpos\(2)))) # (!\c1|sq_x2\(2) & (!\c1|hpos\(2) & !\c1|LessThan5~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x2\(2),
	datab => \c1|hpos\(2),
	datad => VCC,
	cin => \c1|LessThan5~3_cout\,
	cout => \c1|LessThan5~5_cout\);

-- Location: LCCOMB_X32_Y12_N14
\c1|LessThan5~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan5~7_cout\ = CARRY((\c1|hpos\(3) & ((!\c1|LessThan5~5_cout\) # (!\c1|Add2~0_combout\))) # (!\c1|hpos\(3) & (!\c1|Add2~0_combout\ & !\c1|LessThan5~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(3),
	datab => \c1|Add2~0_combout\,
	datad => VCC,
	cin => \c1|LessThan5~5_cout\,
	cout => \c1|LessThan5~7_cout\);

-- Location: LCCOMB_X32_Y12_N16
\c1|LessThan5~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan5~9_cout\ = CARRY((\c1|Add2~2_combout\ & ((!\c1|LessThan5~7_cout\) # (!\c1|hpos\(4)))) # (!\c1|Add2~2_combout\ & (!\c1|hpos\(4) & !\c1|LessThan5~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|Add2~2_combout\,
	datab => \c1|hpos\(4),
	datad => VCC,
	cin => \c1|LessThan5~7_cout\,
	cout => \c1|LessThan5~9_cout\);

-- Location: LCCOMB_X32_Y12_N18
\c1|LessThan5~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan5~11_cout\ = CARRY((\c1|Add2~4_combout\ & (\c1|hpos\(5) & !\c1|LessThan5~9_cout\)) # (!\c1|Add2~4_combout\ & ((\c1|hpos\(5)) # (!\c1|LessThan5~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|Add2~4_combout\,
	datab => \c1|hpos\(5),
	datad => VCC,
	cin => \c1|LessThan5~9_cout\,
	cout => \c1|LessThan5~11_cout\);

-- Location: LCCOMB_X32_Y12_N20
\c1|LessThan5~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan5~13_cout\ = CARRY((\c1|Add2~6_combout\ & ((!\c1|LessThan5~11_cout\) # (!\c1|hpos\(6)))) # (!\c1|Add2~6_combout\ & (!\c1|hpos\(6) & !\c1|LessThan5~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|Add2~6_combout\,
	datab => \c1|hpos\(6),
	datad => VCC,
	cin => \c1|LessThan5~11_cout\,
	cout => \c1|LessThan5~13_cout\);

-- Location: LCCOMB_X32_Y12_N22
\c1|LessThan5~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan5~15_cout\ = CARRY((\c1|hpos\(7) & ((!\c1|LessThan5~13_cout\) # (!\c1|Add2~8_combout\))) # (!\c1|hpos\(7) & (!\c1|Add2~8_combout\ & !\c1|LessThan5~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(7),
	datab => \c1|Add2~8_combout\,
	datad => VCC,
	cin => \c1|LessThan5~13_cout\,
	cout => \c1|LessThan5~15_cout\);

-- Location: LCCOMB_X32_Y12_N24
\c1|LessThan5~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan5~17_cout\ = CARRY((\c1|hpos\(8) & (\c1|Add2~10_combout\ & !\c1|LessThan5~15_cout\)) # (!\c1|hpos\(8) & ((\c1|Add2~10_combout\) # (!\c1|LessThan5~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(8),
	datab => \c1|Add2~10_combout\,
	datad => VCC,
	cin => \c1|LessThan5~15_cout\,
	cout => \c1|LessThan5~17_cout\);

-- Location: LCCOMB_X32_Y12_N26
\c1|LessThan5~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan5~19_cout\ = CARRY((\c1|hpos\(9) & ((!\c1|LessThan5~17_cout\) # (!\c1|Add2~12_combout\))) # (!\c1|hpos\(9) & (!\c1|Add2~12_combout\ & !\c1|LessThan5~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(9),
	datab => \c1|Add2~12_combout\,
	datad => VCC,
	cin => \c1|LessThan5~17_cout\,
	cout => \c1|LessThan5~19_cout\);

-- Location: LCCOMB_X32_Y12_N28
\c1|LessThan5~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan5~20_combout\ = (\c1|Add2~14_combout\ & ((!\c1|hpos\(10)) # (!\c1|LessThan5~19_cout\))) # (!\c1|Add2~14_combout\ & (!\c1|LessThan5~19_cout\ & !\c1|hpos\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|Add2~14_combout\,
	datad => \c1|hpos\(10),
	cin => \c1|LessThan5~19_cout\,
	combout => \c1|LessThan5~20_combout\);

-- Location: LCCOMB_X32_Y14_N6
\c1|hpos[3]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|hpos[3]~17_combout\ = (\c1|hpos\(3) & (!\c1|hpos[2]~16\)) # (!\c1|hpos\(3) & ((\c1|hpos[2]~16\) # (GND)))
-- \c1|hpos[3]~18\ = CARRY((!\c1|hpos[2]~16\) # (!\c1|hpos\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(3),
	datad => VCC,
	cin => \c1|hpos[2]~16\,
	combout => \c1|hpos[3]~17_combout\,
	cout => \c1|hpos[3]~18\);

-- Location: LCCOMB_X38_Y14_N2
\c1|Add8~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add8~3_combout\ = (\c1|sq_y1\(1) & ((\key~combout\(3) & (!\c1|Add8~2\)) # (!\key~combout\(3) & (\c1|Add8~2\ & VCC)))) # (!\c1|sq_y1\(1) & ((\key~combout\(3) & ((\c1|Add8~2\) # (GND))) # (!\key~combout\(3) & (!\c1|Add8~2\))))
-- \c1|Add8~4\ = CARRY((\c1|sq_y1\(1) & (\key~combout\(3) & !\c1|Add8~2\)) # (!\c1|sq_y1\(1) & ((\key~combout\(3)) # (!\c1|Add8~2\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(1),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add8~2\,
	combout => \c1|Add8~3_combout\,
	cout => \c1|Add8~4\);

-- Location: LCCOMB_X38_Y14_N4
\c1|Add8~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add8~5_combout\ = ((\c1|sq_y1\(2) $ (\key~combout\(3) $ (!\c1|Add8~4\)))) # (GND)
-- \c1|Add8~6\ = CARRY((\c1|sq_y1\(2) & ((\key~combout\(3)) # (!\c1|Add8~4\))) # (!\c1|sq_y1\(2) & (\key~combout\(3) & !\c1|Add8~4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(2),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add8~4\,
	combout => \c1|Add8~5_combout\,
	cout => \c1|Add8~6\);

-- Location: LCCOMB_X38_Y14_N6
\c1|Add8~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add8~7_combout\ = (\c1|sq_y1\(3) & ((\key~combout\(3) & ((\c1|Add8~6\) # (GND))) # (!\key~combout\(3) & (!\c1|Add8~6\)))) # (!\c1|sq_y1\(3) & ((\key~combout\(3) & (!\c1|Add8~6\)) # (!\key~combout\(3) & (\c1|Add8~6\ & VCC))))
-- \c1|Add8~8\ = CARRY((\c1|sq_y1\(3) & ((\key~combout\(3)) # (!\c1|Add8~6\))) # (!\c1|sq_y1\(3) & (\key~combout\(3) & !\c1|Add8~6\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(3),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add8~6\,
	combout => \c1|Add8~7_combout\,
	cout => \c1|Add8~8\);

-- Location: LCCOMB_X38_Y14_N18
\c1|Add8~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add8~19_combout\ = (\c1|sq_y1\(9) & ((\key~combout\(3) & ((\c1|Add8~18\) # (GND))) # (!\key~combout\(3) & (!\c1|Add8~18\)))) # (!\c1|sq_y1\(9) & ((\key~combout\(3) & (!\c1|Add8~18\)) # (!\key~combout\(3) & (\c1|Add8~18\ & VCC))))
-- \c1|Add8~20\ = CARRY((\c1|sq_y1\(9) & ((\key~combout\(3)) # (!\c1|Add8~18\))) # (!\c1|sq_y1\(9) & (\key~combout\(3) & !\c1|Add8~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(9),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add8~18\,
	combout => \c1|Add8~19_combout\,
	cout => \c1|Add8~20\);

-- Location: LCCOMB_X34_Y13_N4
\c1|Add6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add6~3_combout\ = (\c1|sq_x1\(1) & ((\key~combout\(1) & (!\c1|Add6~2\)) # (!\key~combout\(1) & (\c1|Add6~2\ & VCC)))) # (!\c1|sq_x1\(1) & ((\key~combout\(1) & ((\c1|Add6~2\) # (GND))) # (!\key~combout\(1) & (!\c1|Add6~2\))))
-- \c1|Add6~4\ = CARRY((\c1|sq_x1\(1) & (\key~combout\(1) & !\c1|Add6~2\)) # (!\c1|sq_x1\(1) & ((\key~combout\(1)) # (!\c1|Add6~2\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(1),
	datab => \key~combout\(1),
	datad => VCC,
	cin => \c1|Add6~2\,
	combout => \c1|Add6~3_combout\,
	cout => \c1|Add6~4\);

-- Location: LCCOMB_X34_Y13_N10
\c1|Add6~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add6~9_combout\ = ((\c1|sq_x1\(4) $ (\key~combout\(1) $ (!\c1|Add6~8\)))) # (GND)
-- \c1|Add6~10\ = CARRY((\c1|sq_x1\(4) & (!\key~combout\(1) & !\c1|Add6~8\)) # (!\c1|sq_x1\(4) & ((!\c1|Add6~8\) # (!\key~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(4),
	datab => \key~combout\(1),
	datad => VCC,
	cin => \c1|Add6~8\,
	combout => \c1|Add6~9_combout\,
	cout => \c1|Add6~10\);

-- Location: LCCOMB_X34_Y13_N12
\c1|Add6~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add6~11_combout\ = (\c1|sq_x1\(5) & ((\key~combout\(1) & (!\c1|Add6~10\)) # (!\key~combout\(1) & (\c1|Add6~10\ & VCC)))) # (!\c1|sq_x1\(5) & ((\key~combout\(1) & ((\c1|Add6~10\) # (GND))) # (!\key~combout\(1) & (!\c1|Add6~10\))))
-- \c1|Add6~12\ = CARRY((\c1|sq_x1\(5) & (\key~combout\(1) & !\c1|Add6~10\)) # (!\c1|sq_x1\(5) & ((\key~combout\(1)) # (!\c1|Add6~10\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(5),
	datab => \key~combout\(1),
	datad => VCC,
	cin => \c1|Add6~10\,
	combout => \c1|Add6~11_combout\,
	cout => \c1|Add6~12\);

-- Location: LCCOMB_X34_Y13_N18
\c1|Add6~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add6~17_combout\ = ((\c1|sq_x1\(8) $ (\key~combout\(1) $ (\c1|Add6~16\)))) # (GND)
-- \c1|Add6~18\ = CARRY((\c1|sq_x1\(8) & ((!\c1|Add6~16\) # (!\key~combout\(1)))) # (!\c1|sq_x1\(8) & (!\key~combout\(1) & !\c1|Add6~16\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(8),
	datab => \key~combout\(1),
	datad => VCC,
	cin => \c1|Add6~16\,
	combout => \c1|Add6~17_combout\,
	cout => \c1|Add6~18\);

-- Location: LCCOMB_X34_Y13_N20
\c1|Add6~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add6~19_combout\ = (\c1|sq_x1\(9) & ((\key~combout\(1) & ((\c1|Add6~18\) # (GND))) # (!\key~combout\(1) & (!\c1|Add6~18\)))) # (!\c1|sq_x1\(9) & ((\key~combout\(1) & (!\c1|Add6~18\)) # (!\key~combout\(1) & (\c1|Add6~18\ & VCC))))
-- \c1|Add6~20\ = CARRY((\c1|sq_x1\(9) & ((\key~combout\(1)) # (!\c1|Add6~18\))) # (!\c1|sq_x1\(9) & (\key~combout\(1) & !\c1|Add6~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(9),
	datab => \key~combout\(1),
	datad => VCC,
	cin => \c1|Add6~18\,
	combout => \c1|Add6~19_combout\,
	cout => \c1|Add6~20\);

-- Location: LCCOMB_X32_Y15_N12
\c1|Add12~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add12~3_combout\ = (\c1|sq_y2\(1) & ((\key~combout\(3) & (!\c1|Add12~2\)) # (!\key~combout\(3) & (\c1|Add12~2\ & VCC)))) # (!\c1|sq_y2\(1) & ((\key~combout\(3) & ((\c1|Add12~2\) # (GND))) # (!\key~combout\(3) & (!\c1|Add12~2\))))
-- \c1|Add12~4\ = CARRY((\c1|sq_y2\(1) & (\key~combout\(3) & !\c1|Add12~2\)) # (!\c1|sq_y2\(1) & ((\key~combout\(3)) # (!\c1|Add12~2\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(1),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add12~2\,
	combout => \c1|Add12~3_combout\,
	cout => \c1|Add12~4\);

-- Location: LCCOMB_X32_Y15_N16
\c1|Add12~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add12~7_combout\ = (\c1|sq_y2\(3) & ((\key~combout\(3) & (!\c1|Add12~6\)) # (!\key~combout\(3) & (\c1|Add12~6\ & VCC)))) # (!\c1|sq_y2\(3) & ((\key~combout\(3) & ((\c1|Add12~6\) # (GND))) # (!\key~combout\(3) & (!\c1|Add12~6\))))
-- \c1|Add12~8\ = CARRY((\c1|sq_y2\(3) & (\key~combout\(3) & !\c1|Add12~6\)) # (!\c1|sq_y2\(3) & ((\key~combout\(3)) # (!\c1|Add12~6\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(3),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add12~6\,
	combout => \c1|Add12~7_combout\,
	cout => \c1|Add12~8\);

-- Location: LCCOMB_X32_Y15_N22
\c1|Add12~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add12~13_combout\ = ((\c1|sq_y2\(6) $ (\key~combout\(3) $ (!\c1|Add12~12\)))) # (GND)
-- \c1|Add12~14\ = CARRY((\c1|sq_y2\(6) & (!\key~combout\(3) & !\c1|Add12~12\)) # (!\c1|sq_y2\(6) & ((!\c1|Add12~12\) # (!\key~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(6),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add12~12\,
	combout => \c1|Add12~13_combout\,
	cout => \c1|Add12~14\);

-- Location: LCCOMB_X32_Y15_N24
\c1|Add12~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add12~15_combout\ = (\c1|sq_y2\(7) & ((\key~combout\(3) & ((\c1|Add12~14\) # (GND))) # (!\key~combout\(3) & (!\c1|Add12~14\)))) # (!\c1|sq_y2\(7) & ((\key~combout\(3) & (!\c1|Add12~14\)) # (!\key~combout\(3) & (\c1|Add12~14\ & VCC))))
-- \c1|Add12~16\ = CARRY((\c1|sq_y2\(7) & ((\key~combout\(3)) # (!\c1|Add12~14\))) # (!\c1|sq_y2\(7) & (\key~combout\(3) & !\c1|Add12~14\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(7),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add12~14\,
	combout => \c1|Add12~15_combout\,
	cout => \c1|Add12~16\);

-- Location: LCCOMB_X32_Y15_N28
\c1|Add12~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add12~19_combout\ = (\c1|sq_y2\(9) & ((\key~combout\(3) & (!\c1|Add12~18\)) # (!\key~combout\(3) & (\c1|Add12~18\ & VCC)))) # (!\c1|sq_y2\(9) & ((\key~combout\(3) & ((\c1|Add12~18\) # (GND))) # (!\key~combout\(3) & (!\c1|Add12~18\))))
-- \c1|Add12~20\ = CARRY((\c1|sq_y2\(9) & (\key~combout\(3) & !\c1|Add12~18\)) # (!\c1|sq_y2\(9) & ((\key~combout\(3)) # (!\c1|Add12~18\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(9),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add12~18\,
	combout => \c1|Add12~19_combout\,
	cout => \c1|Add12~20\);

-- Location: LCCOMB_X32_Y15_N30
\c1|Add12~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add12~21_combout\ = \key~combout\(3) $ (\c1|Add12~20\ $ (\c1|sq_y2\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \key~combout\(3),
	datad => \c1|sq_y2\(10),
	cin => \c1|Add12~20\,
	combout => \c1|Add12~21_combout\);

-- Location: LCCOMB_X31_Y12_N2
\c1|process_0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|process_0~0_combout\ = (\c1|hpos\(9)) # ((\c1|hpos\(10)) # (\c1|hpos\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(9),
	datac => \c1|hpos\(10),
	datad => \c1|hpos\(8),
	combout => \c1|process_0~0_combout\);

-- Location: LCFF_X38_Y14_N31
\c1|sq_y1[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_y1[9]~2_combout\,
	ena => \c1|sq_y1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y1\(9));

-- Location: LCFF_X37_Y14_N3
\c1|sq_y1[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_y1[3]~5_combout\,
	ena => \c1|sq_y1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y1\(3));

-- Location: LCFF_X38_Y14_N5
\c1|sq_y1[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add8~5_combout\,
	ena => \c1|sq_y1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y1\(2));

-- Location: LCFF_X38_Y14_N3
\c1|sq_y1[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add8~3_combout\,
	ena => \c1|sq_y1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y1\(1));

-- Location: LCFF_X34_Y13_N25
\c1|sq_x1[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_x1[9]~2_combout\,
	ena => \c1|sq_x1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x1\(9));

-- Location: LCFF_X34_Y13_N19
\c1|sq_x1[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add6~17_combout\,
	ena => \c1|sq_x1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x1\(8));

-- Location: LCFF_X34_Y13_N13
\c1|sq_x1[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add6~11_combout\,
	ena => \c1|sq_x1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x1\(5));

-- Location: LCFF_X33_Y13_N1
\c1|sq_x1[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_x1[4]~4_combout\,
	ena => \c1|sq_x1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x1\(4));

-- Location: LCFF_X34_Y13_N5
\c1|sq_x1[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add6~3_combout\,
	ena => \c1|sq_x1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x1\(1));

-- Location: LCCOMB_X33_Y14_N20
\c1|draw1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|draw1~0_combout\ = (\c1|Add1~16_combout\ & ((\c1|Add0~16_combout\) # ((\c1|LessThan1~20_combout\)))) # (!\c1|Add1~16_combout\ & (\c1|LessThan3~20_combout\ & ((\c1|Add0~16_combout\) # (\c1|LessThan1~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|Add1~16_combout\,
	datab => \c1|Add0~16_combout\,
	datac => \c1|LessThan1~20_combout\,
	datad => \c1|LessThan3~20_combout\,
	combout => \c1|draw1~0_combout\);

-- Location: LCFF_X32_Y15_N31
\c1|sq_y2[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add12~21_combout\,
	ena => \c1|sq_y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y2\(10));

-- Location: LCFF_X33_Y15_N11
\c1|sq_y2[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_y2[7]~2_combout\,
	ena => \c1|sq_y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y2\(7));

-- Location: LCFF_X33_Y15_N13
\c1|sq_y2[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_y2[6]~3_combout\,
	ena => \c1|sq_y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y2\(6));

-- Location: LCFF_X32_Y15_N17
\c1|sq_y2[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add12~7_combout\,
	ena => \c1|sq_y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y2\(3));

-- Location: LCFF_X32_Y15_N13
\c1|sq_y2[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add12~3_combout\,
	ena => \c1|sq_y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y2\(1));

-- Location: LCCOMB_X34_Y14_N24
\c1|LessThan16~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan16~0_combout\ = ((!\c1|vpos\(4) & (!\c1|vpos\(2) & !\c1|vpos\(1)))) # (!\c1|vpos\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(5),
	datab => \c1|vpos\(4),
	datac => \c1|vpos\(2),
	datad => \c1|vpos\(1),
	combout => \c1|LessThan16~0_combout\);

-- Location: LCCOMB_X38_Y14_N30
\c1|sq_y1[9]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_y1[9]~2_combout\ = !\c1|Add8~19_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \c1|Add8~19_combout\,
	combout => \c1|sq_y1[9]~2_combout\);

-- Location: LCCOMB_X37_Y14_N2
\c1|sq_y1[3]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_y1[3]~5_combout\ = !\c1|Add8~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \c1|Add8~7_combout\,
	combout => \c1|sq_y1[3]~5_combout\);

-- Location: LCCOMB_X34_Y13_N24
\c1|sq_x1[9]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_x1[9]~2_combout\ = !\c1|Add6~19_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|Add6~19_combout\,
	combout => \c1|sq_x1[9]~2_combout\);

-- Location: LCCOMB_X33_Y13_N0
\c1|sq_x1[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_x1[4]~4_combout\ = !\c1|Add6~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|Add6~9_combout\,
	combout => \c1|sq_x1[4]~4_combout\);

-- Location: LCCOMB_X33_Y15_N10
\c1|sq_y2[7]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_y2[7]~2_combout\ = !\c1|Add12~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \c1|Add12~15_combout\,
	combout => \c1|sq_y2[7]~2_combout\);

-- Location: LCCOMB_X33_Y15_N12
\c1|sq_y2[6]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_y2[6]~3_combout\ = !\c1|Add12~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \c1|Add12~13_combout\,
	combout => \c1|sq_y2[6]~3_combout\);

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clock_24[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clock_24(0),
	combout => \clock_24~combout\(0));

-- Location: PLL_3
\c2|altpll_0|sd1|pll\ : cycloneii_pll
-- pragma translate_off
GENERIC MAP (
	bandwidth => 0,
	bandwidth_type => "low",
	c0_high => 3,
	c0_initial => 1,
	c0_low => 3,
	c0_mode => "even",
	c0_ph => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	charge_pump_current => 80,
	clk0_counter => "c0",
	clk0_divide_by => 2,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 9,
	clk0_phase_shift => "0",
	clk1_duty_cycle => 50,
	clk1_phase_shift => "0",
	clk2_duty_cycle => 50,
	clk2_phase_shift => "0",
	compensate_clock => "clk0",
	gate_lock_counter => 0,
	gate_lock_signal => "no",
	inclk0_input_frequency => 41666,
	inclk1_input_frequency => 41666,
	invalid_lock_multiplier => 5,
	loop_filter_c => 3,
	loop_filter_r => " 2.500000",
	m => 27,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 100000,
	pfd_min => 2484,
	pll_compensation_delay => 4185,
	self_reset_on_gated_loss_lock => "off",
	sim_gate_lock_device_behavior => "off",
	simulation_type => "timing",
	valid_lock_multiplier => 1,
	vco_center => 1333,
	vco_max => 2000,
	vco_min => 1000)
-- pragma translate_on
PORT MAP (
	areset => GND,
	inclk => \c2|altpll_0|sd1|pll_INCLK_bus\,
	clk => \c2|altpll_0|sd1|pll_CLK_bus\);

-- Location: CLKCTRL_G11
\c2|altpll_0|sd1|_clk0~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \c2|altpll_0|sd1|_clk0~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\);

-- Location: LCCOMB_X32_Y14_N0
\c1|hpos[0]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|hpos[0]~11_combout\ = \c1|hpos\(0) $ (VCC)
-- \c1|hpos[0]~12\ = CARRY(\c1|hpos\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \c1|hpos\(0),
	datad => VCC,
	combout => \c1|hpos[0]~11_combout\,
	cout => \c1|hpos[0]~12\);

-- Location: LCCOMB_X32_Y14_N8
\c1|hpos[4]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|hpos[4]~19_combout\ = (\c1|hpos\(4) & (\c1|hpos[3]~18\ $ (GND))) # (!\c1|hpos\(4) & (!\c1|hpos[3]~18\ & VCC))
-- \c1|hpos[4]~20\ = CARRY((\c1|hpos\(4) & !\c1|hpos[3]~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|hpos\(4),
	datad => VCC,
	cin => \c1|hpos[3]~18\,
	combout => \c1|hpos[4]~19_combout\,
	cout => \c1|hpos[4]~20\);

-- Location: LCCOMB_X32_Y14_N10
\c1|hpos[5]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|hpos[5]~21_combout\ = (\c1|hpos\(5) & (!\c1|hpos[4]~20\)) # (!\c1|hpos\(5) & ((\c1|hpos[4]~20\) # (GND)))
-- \c1|hpos[5]~22\ = CARRY((!\c1|hpos[4]~20\) # (!\c1|hpos\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(5),
	datad => VCC,
	cin => \c1|hpos[4]~20\,
	combout => \c1|hpos[5]~21_combout\,
	cout => \c1|hpos[5]~22\);

-- Location: LCCOMB_X32_Y14_N12
\c1|hpos[6]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|hpos[6]~23_combout\ = (\c1|hpos\(6) & (\c1|hpos[5]~22\ $ (GND))) # (!\c1|hpos\(6) & (!\c1|hpos[5]~22\ & VCC))
-- \c1|hpos[6]~24\ = CARRY((\c1|hpos\(6) & !\c1|hpos[5]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(6),
	datad => VCC,
	cin => \c1|hpos[5]~22\,
	combout => \c1|hpos[6]~23_combout\,
	cout => \c1|hpos[6]~24\);

-- Location: LCCOMB_X32_Y14_N14
\c1|hpos[7]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|hpos[7]~25_combout\ = (\c1|hpos\(7) & (!\c1|hpos[6]~24\)) # (!\c1|hpos\(7) & ((\c1|hpos[6]~24\) # (GND)))
-- \c1|hpos[7]~26\ = CARRY((!\c1|hpos[6]~24\) # (!\c1|hpos\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|hpos\(7),
	datad => VCC,
	cin => \c1|hpos[6]~24\,
	combout => \c1|hpos[7]~25_combout\,
	cout => \c1|hpos[7]~26\);

-- Location: LCFF_X32_Y14_N15
\c1|hpos[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|hpos[7]~25_combout\,
	sclr => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|hpos\(7));

-- Location: LCCOMB_X32_Y14_N16
\c1|hpos[8]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|hpos[8]~27_combout\ = (\c1|hpos\(8) & (\c1|hpos[7]~26\ $ (GND))) # (!\c1|hpos\(8) & (!\c1|hpos[7]~26\ & VCC))
-- \c1|hpos[8]~28\ = CARRY((\c1|hpos\(8) & !\c1|hpos[7]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|hpos\(8),
	datad => VCC,
	cin => \c1|hpos[7]~26\,
	combout => \c1|hpos[8]~27_combout\,
	cout => \c1|hpos[8]~28\);

-- Location: LCFF_X32_Y14_N17
\c1|hpos[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|hpos[8]~27_combout\,
	sclr => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|hpos\(8));

-- Location: LCCOMB_X32_Y14_N18
\c1|hpos[9]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|hpos[9]~29_combout\ = (\c1|hpos\(9) & (!\c1|hpos[8]~28\)) # (!\c1|hpos\(9) & ((\c1|hpos[8]~28\) # (GND)))
-- \c1|hpos[9]~30\ = CARRY((!\c1|hpos[8]~28\) # (!\c1|hpos\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|hpos\(9),
	datad => VCC,
	cin => \c1|hpos[8]~28\,
	combout => \c1|hpos[9]~29_combout\,
	cout => \c1|hpos[9]~30\);

-- Location: LCFF_X32_Y14_N19
\c1|hpos[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|hpos[9]~29_combout\,
	sclr => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|hpos\(9));

-- Location: LCCOMB_X32_Y14_N20
\c1|hpos[10]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|hpos[10]~31_combout\ = \c1|hpos[9]~30\ $ (!\c1|hpos\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \c1|hpos\(10),
	cin => \c1|hpos[9]~30\,
	combout => \c1|hpos[10]~31_combout\);

-- Location: LCFF_X32_Y14_N21
\c1|hpos[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|hpos[10]~31_combout\,
	sclr => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|hpos\(10));

-- Location: LCCOMB_X32_Y14_N28
\c1|LessThan8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan8~0_combout\ = (!\c1|hpos\(9)) # (!\c1|hpos\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|hpos\(10),
	datad => \c1|hpos\(9),
	combout => \c1|LessThan8~0_combout\);

-- Location: LCCOMB_X32_Y14_N30
\c1|LessThan8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan8~1_combout\ = (!\c1|LessThan8~0_combout\ & ((\c1|hpos\(8)) # ((!\c1|LessThan15~0_combout\ & \c1|hpos\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|LessThan15~0_combout\,
	datab => \c1|LessThan8~0_combout\,
	datac => \c1|hpos\(7),
	datad => \c1|hpos\(8),
	combout => \c1|LessThan8~1_combout\);

-- Location: LCFF_X32_Y14_N1
\c1|hpos[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|hpos[0]~11_combout\,
	sclr => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|hpos\(0));

-- Location: LCCOMB_X32_Y14_N2
\c1|hpos[1]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|hpos[1]~13_combout\ = (\c1|hpos\(1) & (!\c1|hpos[0]~12\)) # (!\c1|hpos\(1) & ((\c1|hpos[0]~12\) # (GND)))
-- \c1|hpos[1]~14\ = CARRY((!\c1|hpos[0]~12\) # (!\c1|hpos\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|hpos\(1),
	datad => VCC,
	cin => \c1|hpos[0]~12\,
	combout => \c1|hpos[1]~13_combout\,
	cout => \c1|hpos[1]~14\);

-- Location: LCFF_X32_Y14_N3
\c1|hpos[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|hpos[1]~13_combout\,
	sclr => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|hpos\(1));

-- Location: LCCOMB_X32_Y14_N4
\c1|hpos[2]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|hpos[2]~15_combout\ = (\c1|hpos\(2) & (\c1|hpos[1]~14\ $ (GND))) # (!\c1|hpos\(2) & (!\c1|hpos[1]~14\ & VCC))
-- \c1|hpos[2]~16\ = CARRY((\c1|hpos\(2) & !\c1|hpos[1]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|hpos\(2),
	datad => VCC,
	cin => \c1|hpos[1]~14\,
	combout => \c1|hpos[2]~15_combout\,
	cout => \c1|hpos[2]~16\);

-- Location: LCFF_X32_Y14_N5
\c1|hpos[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|hpos[2]~15_combout\,
	sclr => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|hpos\(2));

-- Location: LCFF_X32_Y14_N9
\c1|hpos[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|hpos[4]~19_combout\,
	sclr => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|hpos\(4));

-- Location: LCFF_X32_Y14_N11
\c1|hpos[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|hpos[5]~21_combout\,
	sclr => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|hpos\(5));

-- Location: LCCOMB_X32_Y12_N0
\c1|process_0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|process_0~2_combout\ = (\c1|hpos\(5) & ((\c1|hpos\(7)) # ((!\c1|process_0~1_combout\ & \c1|hpos\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|process_0~1_combout\,
	datab => \c1|hpos\(4),
	datac => \c1|hpos\(7),
	datad => \c1|hpos\(5),
	combout => \c1|process_0~2_combout\);

-- Location: LCFF_X32_Y14_N13
\c1|hpos[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|hpos[6]~23_combout\,
	sclr => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|hpos\(6));

-- Location: LCCOMB_X31_Y12_N8
\c1|process_0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|process_0~3_combout\ = (\c1|process_0~0_combout\) # (\c1|hpos\(7) $ (((!\c1|process_0~2_combout\ & !\c1|hpos\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|process_0~0_combout\,
	datab => \c1|process_0~2_combout\,
	datac => \c1|hpos\(6),
	datad => \c1|hpos\(7),
	combout => \c1|process_0~3_combout\);

-- Location: LCFF_X31_Y12_N9
\c1|hsync\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|process_0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|hsync~regout\);

-- Location: LCCOMB_X34_Y14_N0
\c1|vpos[0]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|vpos[0]~11_combout\ = \c1|vpos\(0) $ (VCC)
-- \c1|vpos[0]~12\ = CARRY(\c1|vpos\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \c1|vpos\(0),
	datad => VCC,
	combout => \c1|vpos[0]~11_combout\,
	cout => \c1|vpos[0]~12\);

-- Location: LCCOMB_X34_Y14_N4
\c1|vpos[2]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|vpos[2]~15_combout\ = (\c1|vpos\(2) & (\c1|vpos[1]~14\ $ (GND))) # (!\c1|vpos\(2) & (!\c1|vpos[1]~14\ & VCC))
-- \c1|vpos[2]~16\ = CARRY((\c1|vpos\(2) & !\c1|vpos[1]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|vpos\(2),
	datad => VCC,
	cin => \c1|vpos[1]~14\,
	combout => \c1|vpos[2]~15_combout\,
	cout => \c1|vpos[2]~16\);

-- Location: LCCOMB_X34_Y14_N6
\c1|vpos[3]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|vpos[3]~17_combout\ = (\c1|vpos\(3) & (!\c1|vpos[2]~16\)) # (!\c1|vpos\(3) & ((\c1|vpos[2]~16\) # (GND)))
-- \c1|vpos[3]~18\ = CARRY((!\c1|vpos[2]~16\) # (!\c1|vpos\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(3),
	datad => VCC,
	cin => \c1|vpos[2]~16\,
	combout => \c1|vpos[3]~17_combout\,
	cout => \c1|vpos[3]~18\);

-- Location: LCCOMB_X34_Y14_N8
\c1|vpos[4]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|vpos[4]~19_combout\ = (\c1|vpos\(4) & (\c1|vpos[3]~18\ $ (GND))) # (!\c1|vpos\(4) & (!\c1|vpos[3]~18\ & VCC))
-- \c1|vpos[4]~20\ = CARRY((\c1|vpos\(4) & !\c1|vpos[3]~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|vpos\(4),
	datad => VCC,
	cin => \c1|vpos[3]~18\,
	combout => \c1|vpos[4]~19_combout\,
	cout => \c1|vpos[4]~20\);

-- Location: LCFF_X34_Y14_N9
\c1|vpos[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|vpos[4]~19_combout\,
	sclr => \c1|LessThan9~0_combout\,
	ena => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|vpos\(4));

-- Location: LCCOMB_X34_Y14_N10
\c1|vpos[5]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|vpos[5]~21_combout\ = (\c1|vpos\(5) & (!\c1|vpos[4]~20\)) # (!\c1|vpos\(5) & ((\c1|vpos[4]~20\) # (GND)))
-- \c1|vpos[5]~22\ = CARRY((!\c1|vpos[4]~20\) # (!\c1|vpos\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(5),
	datad => VCC,
	cin => \c1|vpos[4]~20\,
	combout => \c1|vpos[5]~21_combout\,
	cout => \c1|vpos[5]~22\);

-- Location: LCCOMB_X34_Y14_N12
\c1|vpos[6]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|vpos[6]~23_combout\ = (\c1|vpos\(6) & (\c1|vpos[5]~22\ $ (GND))) # (!\c1|vpos\(6) & (!\c1|vpos[5]~22\ & VCC))
-- \c1|vpos[6]~24\ = CARRY((\c1|vpos\(6) & !\c1|vpos[5]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(6),
	datad => VCC,
	cin => \c1|vpos[5]~22\,
	combout => \c1|vpos[6]~23_combout\,
	cout => \c1|vpos[6]~24\);

-- Location: LCCOMB_X34_Y14_N14
\c1|vpos[7]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|vpos[7]~25_combout\ = (\c1|vpos\(7) & (!\c1|vpos[6]~24\)) # (!\c1|vpos\(7) & ((\c1|vpos[6]~24\) # (GND)))
-- \c1|vpos[7]~26\ = CARRY((!\c1|vpos[6]~24\) # (!\c1|vpos\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|vpos\(7),
	datad => VCC,
	cin => \c1|vpos[6]~24\,
	combout => \c1|vpos[7]~25_combout\,
	cout => \c1|vpos[7]~26\);

-- Location: LCFF_X34_Y14_N15
\c1|vpos[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|vpos[7]~25_combout\,
	sclr => \c1|LessThan9~0_combout\,
	ena => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|vpos\(7));

-- Location: LCCOMB_X34_Y14_N16
\c1|vpos[8]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|vpos[8]~27_combout\ = (\c1|vpos\(8) & (\c1|vpos[7]~26\ $ (GND))) # (!\c1|vpos\(8) & (!\c1|vpos[7]~26\ & VCC))
-- \c1|vpos[8]~28\ = CARRY((\c1|vpos\(8) & !\c1|vpos[7]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(8),
	datad => VCC,
	cin => \c1|vpos[7]~26\,
	combout => \c1|vpos[8]~27_combout\,
	cout => \c1|vpos[8]~28\);

-- Location: LCCOMB_X34_Y14_N18
\c1|vpos[9]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|vpos[9]~29_combout\ = (\c1|vpos\(9) & (!\c1|vpos[8]~28\)) # (!\c1|vpos\(9) & ((\c1|vpos[8]~28\) # (GND)))
-- \c1|vpos[9]~30\ = CARRY((!\c1|vpos[8]~28\) # (!\c1|vpos\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|vpos\(9),
	datad => VCC,
	cin => \c1|vpos[8]~28\,
	combout => \c1|vpos[9]~29_combout\,
	cout => \c1|vpos[9]~30\);

-- Location: LCFF_X34_Y14_N19
\c1|vpos[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|vpos[9]~29_combout\,
	sclr => \c1|LessThan9~0_combout\,
	ena => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|vpos\(9));

-- Location: LCCOMB_X34_Y14_N20
\c1|vpos[10]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|vpos[10]~31_combout\ = \c1|vpos\(10) $ (!\c1|vpos[9]~30\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(10),
	cin => \c1|vpos[9]~30\,
	combout => \c1|vpos[10]~31_combout\);

-- Location: LCFF_X34_Y14_N21
\c1|vpos[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|vpos[10]~31_combout\,
	sclr => \c1|LessThan9~0_combout\,
	ena => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|vpos\(10));

-- Location: LCFF_X34_Y14_N17
\c1|vpos[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|vpos[8]~27_combout\,
	sclr => \c1|LessThan9~0_combout\,
	ena => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|vpos\(8));

-- Location: LCCOMB_X34_Y14_N30
\c1|process_0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|process_0~4_combout\ = (!\c1|vpos\(6) & (!\c1|vpos\(7) & (!\c1|vpos\(8) & !\c1|vpos\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(6),
	datab => \c1|vpos\(7),
	datac => \c1|vpos\(8),
	datad => \c1|vpos\(9),
	combout => \c1|process_0~4_combout\);

-- Location: LCFF_X34_Y14_N7
\c1|vpos[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|vpos[3]~17_combout\,
	sclr => \c1|LessThan9~0_combout\,
	ena => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|vpos\(3));

-- Location: LCCOMB_X34_Y14_N26
\c1|LessThan16~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan16~1_combout\ = (\c1|process_0~4_combout\ & ((\c1|LessThan16~0_combout\) # ((!\c1|vpos\(4) & !\c1|vpos\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|LessThan16~0_combout\,
	datab => \c1|process_0~4_combout\,
	datac => \c1|vpos\(4),
	datad => \c1|vpos\(3),
	combout => \c1|LessThan16~1_combout\);

-- Location: LCCOMB_X34_Y14_N28
\c1|LessThan9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan9~0_combout\ = (\c1|vpos\(10) & !\c1|LessThan16~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|vpos\(10),
	datad => \c1|LessThan16~1_combout\,
	combout => \c1|LessThan9~0_combout\);

-- Location: LCFF_X34_Y14_N1
\c1|vpos[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|vpos[0]~11_combout\,
	sclr => \c1|LessThan9~0_combout\,
	ena => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|vpos\(0));

-- Location: LCCOMB_X34_Y14_N2
\c1|vpos[1]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|vpos[1]~13_combout\ = (\c1|vpos\(1) & (!\c1|vpos[0]~12\)) # (!\c1|vpos\(1) & ((\c1|vpos[0]~12\) # (GND)))
-- \c1|vpos[1]~14\ = CARRY((!\c1|vpos[0]~12\) # (!\c1|vpos\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|vpos\(1),
	datad => VCC,
	cin => \c1|vpos[0]~12\,
	combout => \c1|vpos[1]~13_combout\,
	cout => \c1|vpos[1]~14\);

-- Location: LCFF_X34_Y14_N3
\c1|vpos[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|vpos[1]~13_combout\,
	sclr => \c1|LessThan9~0_combout\,
	ena => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|vpos\(1));

-- Location: LCFF_X34_Y14_N5
\c1|vpos[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|vpos[2]~15_combout\,
	sclr => \c1|LessThan9~0_combout\,
	ena => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|vpos\(2));

-- Location: LCFF_X34_Y14_N11
\c1|vpos[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|vpos[5]~21_combout\,
	sclr => \c1|LessThan9~0_combout\,
	ena => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|vpos\(5));

-- Location: LCCOMB_X36_Y14_N2
\c1|LessThan12~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan12~1_combout\ = (!\c1|vpos\(4) & (!\c1|vpos\(2) & (!\c1|vpos\(5) & !\c1|vpos\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(4),
	datab => \c1|vpos\(2),
	datac => \c1|vpos\(5),
	datad => \c1|vpos\(3),
	combout => \c1|LessThan12~1_combout\);

-- Location: LCCOMB_X36_Y14_N26
\c1|LessThan12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan12~0_combout\ = (!\c1|vpos\(0) & !\c1|vpos\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|vpos\(0),
	datad => \c1|vpos\(1),
	combout => \c1|LessThan12~0_combout\);

-- Location: LCCOMB_X36_Y14_N0
\c1|process_0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|process_0~5_combout\ = (\c1|vpos\(10)) # (((\c1|LessThan12~0_combout\) # (!\c1|process_0~4_combout\)) # (!\c1|LessThan12~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(10),
	datab => \c1|LessThan12~1_combout\,
	datac => \c1|process_0~4_combout\,
	datad => \c1|LessThan12~0_combout\,
	combout => \c1|process_0~5_combout\);

-- Location: LCFF_X36_Y14_N1
\c1|vsync\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|process_0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|vsync~regout\);

-- Location: LCCOMB_X32_Y14_N22
\c1|process_0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|process_0~1_combout\ = (!\c1|hpos\(3) & (!\c1|hpos\(0) & (!\c1|hpos\(2) & !\c1|hpos\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(3),
	datab => \c1|hpos\(0),
	datac => \c1|hpos\(2),
	datad => \c1|hpos\(1),
	combout => \c1|process_0~1_combout\);

-- Location: LCCOMB_X32_Y14_N26
\c1|process_0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|process_0~6_combout\ = (!\c1|hpos\(6) & (\c1|process_0~1_combout\ & (!\c1|hpos\(4) & !\c1|hpos\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(6),
	datab => \c1|process_0~1_combout\,
	datac => \c1|hpos\(4),
	datad => \c1|hpos\(5),
	combout => \c1|process_0~6_combout\);

-- Location: LCCOMB_X32_Y14_N24
\c1|LessThan15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan15~0_combout\ = (!\c1|hpos\(6) & (!\c1|hpos\(5) & ((!\c1|hpos\(4)) # (!\c1|hpos\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(3),
	datab => \c1|hpos\(6),
	datac => \c1|hpos\(4),
	datad => \c1|hpos\(5),
	combout => \c1|LessThan15~0_combout\);

-- Location: LCCOMB_X33_Y14_N6
\c1|process_0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|process_0~7_combout\ = (\c1|hpos\(7) & (\c1|hpos\(8) & ((!\c1|LessThan15~0_combout\)))) # (!\c1|hpos\(7) & (!\c1|hpos\(8) & (\c1|process_0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(7),
	datab => \c1|hpos\(8),
	datac => \c1|process_0~6_combout\,
	datad => \c1|LessThan15~0_combout\,
	combout => \c1|process_0~7_combout\);

-- Location: LCCOMB_X33_Y14_N8
\c1|process_0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|process_0~8_combout\ = (\c1|hpos\(9)) # ((\c1|hpos\(10)) # (\c1|process_0~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \c1|hpos\(9),
	datac => \c1|hpos\(10),
	datad => \c1|process_0~7_combout\,
	combout => \c1|process_0~8_combout\);

-- Location: LCCOMB_X36_Y14_N28
\c1|LessThan12~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan12~2_combout\ = (!\c1|vpos\(1) & (!\c1|vpos\(0) & \c1|LessThan12~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(1),
	datac => \c1|vpos\(0),
	datad => \c1|LessThan12~1_combout\,
	combout => \c1|LessThan12~2_combout\);

-- Location: LCCOMB_X33_Y14_N18
\c1|b~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|b~2_combout\ = (\c1|process_0~8_combout\ & (((\c1|vpos\(10)) # (\c1|LessThan12~2_combout\)) # (!\c1|LessThan16~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|LessThan16~1_combout\,
	datab => \c1|vpos\(10),
	datac => \c1|process_0~8_combout\,
	datad => \c1|LessThan12~2_combout\,
	combout => \c1|b~2_combout\);

-- Location: PIN_R21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\key[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_key(1),
	combout => \key~combout\(1));

-- Location: LCCOMB_X34_Y13_N2
\c1|Add6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add6~1_combout\ = \c1|sq_x1\(0) $ (VCC)
-- \c1|Add6~2\ = CARRY(\c1|sq_x1\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x1\(0),
	datad => VCC,
	combout => \c1|Add6~1_combout\,
	cout => \c1|Add6~2\);

-- Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\key[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_key(0),
	combout => \key~combout\(0));

-- Location: LCCOMB_X34_Y13_N26
\c1|sq_x1[10]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_x1[10]~0_combout\ = (!\key~combout\(1)) # (!\key~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \key~combout\(0),
	datad => \key~combout\(1),
	combout => \c1|sq_x1[10]~0_combout\);

-- Location: PIN_L22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sw[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sw(0),
	combout => \sw~combout\(0));

-- Location: LCCOMB_X34_Y13_N28
\c1|sq_x1[10]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_x1[10]~1_combout\ = (\c1|LessThan8~1_combout\ & (\c1|sq_x1[10]~0_combout\ & (\c1|LessThan9~0_combout\ & \sw~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|LessThan8~1_combout\,
	datab => \c1|sq_x1[10]~0_combout\,
	datac => \c1|LessThan9~0_combout\,
	datad => \sw~combout\(0),
	combout => \c1|sq_x1[10]~1_combout\);

-- Location: LCFF_X34_Y13_N3
\c1|sq_x1[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add6~1_combout\,
	ena => \c1|sq_x1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x1\(0));

-- Location: LCCOMB_X34_Y13_N6
\c1|Add6~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add6~5_combout\ = ((\c1|sq_x1\(2) $ (\key~combout\(1) $ (!\c1|Add6~4\)))) # (GND)
-- \c1|Add6~6\ = CARRY((\c1|sq_x1\(2) & ((\key~combout\(1)) # (!\c1|Add6~4\))) # (!\c1|sq_x1\(2) & (\key~combout\(1) & !\c1|Add6~4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(2),
	datab => \key~combout\(1),
	datad => VCC,
	cin => \c1|Add6~4\,
	combout => \c1|Add6~5_combout\,
	cout => \c1|Add6~6\);

-- Location: LCCOMB_X34_Y13_N8
\c1|Add6~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add6~7_combout\ = (\c1|sq_x1\(3) & ((\key~combout\(1) & ((\c1|Add6~6\) # (GND))) # (!\key~combout\(1) & (!\c1|Add6~6\)))) # (!\c1|sq_x1\(3) & ((\key~combout\(1) & (!\c1|Add6~6\)) # (!\key~combout\(1) & (\c1|Add6~6\ & VCC))))
-- \c1|Add6~8\ = CARRY((\c1|sq_x1\(3) & ((\key~combout\(1)) # (!\c1|Add6~6\))) # (!\c1|sq_x1\(3) & (\key~combout\(1) & !\c1|Add6~6\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(3),
	datab => \key~combout\(1),
	datad => VCC,
	cin => \c1|Add6~6\,
	combout => \c1|Add6~7_combout\,
	cout => \c1|Add6~8\);

-- Location: LCCOMB_X34_Y13_N14
\c1|Add6~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add6~13_combout\ = ((\c1|sq_x1\(6) $ (\key~combout\(1) $ (!\c1|Add6~12\)))) # (GND)
-- \c1|Add6~14\ = CARRY((\c1|sq_x1\(6) & (!\key~combout\(1) & !\c1|Add6~12\)) # (!\c1|sq_x1\(6) & ((!\c1|Add6~12\) # (!\key~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(6),
	datab => \key~combout\(1),
	datad => VCC,
	cin => \c1|Add6~12\,
	combout => \c1|Add6~13_combout\,
	cout => \c1|Add6~14\);

-- Location: LCCOMB_X34_Y13_N16
\c1|Add6~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add6~15_combout\ = (\c1|sq_x1\(7) & ((\key~combout\(1) & (!\c1|Add6~14\)) # (!\key~combout\(1) & (\c1|Add6~14\ & VCC)))) # (!\c1|sq_x1\(7) & ((\key~combout\(1) & ((\c1|Add6~14\) # (GND))) # (!\key~combout\(1) & (!\c1|Add6~14\))))
-- \c1|Add6~16\ = CARRY((\c1|sq_x1\(7) & (\key~combout\(1) & !\c1|Add6~14\)) # (!\c1|sq_x1\(7) & ((\key~combout\(1)) # (!\c1|Add6~14\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(7),
	datab => \key~combout\(1),
	datad => VCC,
	cin => \c1|Add6~14\,
	combout => \c1|Add6~15_combout\,
	cout => \c1|Add6~16\);

-- Location: LCCOMB_X34_Y13_N22
\c1|Add6~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add6~21_combout\ = \c1|sq_x1\(10) $ (\c1|Add6~20\ $ (\key~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x1\(10),
	datad => \key~combout\(1),
	cin => \c1|Add6~20\,
	combout => \c1|Add6~21_combout\);

-- Location: LCFF_X34_Y13_N23
\c1|sq_x1[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add6~21_combout\,
	ena => \c1|sq_x1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x1\(10));

-- Location: LCFF_X34_Y13_N17
\c1|sq_x1[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add6~15_combout\,
	ena => \c1|sq_x1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x1\(7));

-- Location: LCCOMB_X34_Y13_N0
\c1|sq_x1[6]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_x1[6]~3_combout\ = !\c1|Add6~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|Add6~13_combout\,
	combout => \c1|sq_x1[6]~3_combout\);

-- Location: LCFF_X34_Y13_N1
\c1|sq_x1[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_x1[6]~3_combout\,
	ena => \c1|sq_x1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x1\(6));

-- Location: LCCOMB_X33_Y13_N2
\c1|sq_x1[3]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_x1[3]~5_combout\ = !\c1|Add6~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|Add6~7_combout\,
	combout => \c1|sq_x1[3]~5_combout\);

-- Location: LCFF_X33_Y13_N3
\c1|sq_x1[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_x1[3]~5_combout\,
	ena => \c1|sq_x1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x1\(3));

-- Location: LCFF_X34_Y13_N7
\c1|sq_x1[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add6~5_combout\,
	ena => \c1|sq_x1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x1\(2));

-- Location: LCCOMB_X31_Y13_N4
\c1|LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan0~1_cout\ = CARRY((\c1|hpos\(0) & !\c1|sq_x1\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(0),
	datab => \c1|sq_x1\(0),
	datad => VCC,
	cout => \c1|LessThan0~1_cout\);

-- Location: LCCOMB_X31_Y13_N6
\c1|LessThan0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan0~3_cout\ = CARRY((\c1|sq_x1\(1) & ((!\c1|LessThan0~1_cout\) # (!\c1|hpos\(1)))) # (!\c1|sq_x1\(1) & (!\c1|hpos\(1) & !\c1|LessThan0~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(1),
	datab => \c1|hpos\(1),
	datad => VCC,
	cin => \c1|LessThan0~1_cout\,
	cout => \c1|LessThan0~3_cout\);

-- Location: LCCOMB_X31_Y13_N8
\c1|LessThan0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan0~5_cout\ = CARRY((\c1|hpos\(2) & ((!\c1|LessThan0~3_cout\) # (!\c1|sq_x1\(2)))) # (!\c1|hpos\(2) & (!\c1|sq_x1\(2) & !\c1|LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(2),
	datab => \c1|sq_x1\(2),
	datad => VCC,
	cin => \c1|LessThan0~3_cout\,
	cout => \c1|LessThan0~5_cout\);

-- Location: LCCOMB_X31_Y13_N10
\c1|LessThan0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan0~7_cout\ = CARRY((\c1|hpos\(3) & (!\c1|sq_x1\(3) & !\c1|LessThan0~5_cout\)) # (!\c1|hpos\(3) & ((!\c1|LessThan0~5_cout\) # (!\c1|sq_x1\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(3),
	datab => \c1|sq_x1\(3),
	datad => VCC,
	cin => \c1|LessThan0~5_cout\,
	cout => \c1|LessThan0~7_cout\);

-- Location: LCCOMB_X31_Y13_N12
\c1|LessThan0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan0~9_cout\ = CARRY((\c1|sq_x1\(4) & ((\c1|hpos\(4)) # (!\c1|LessThan0~7_cout\))) # (!\c1|sq_x1\(4) & (\c1|hpos\(4) & !\c1|LessThan0~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(4),
	datab => \c1|hpos\(4),
	datad => VCC,
	cin => \c1|LessThan0~7_cout\,
	cout => \c1|LessThan0~9_cout\);

-- Location: LCCOMB_X31_Y13_N14
\c1|LessThan0~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan0~11_cout\ = CARRY((\c1|sq_x1\(5) & ((!\c1|LessThan0~9_cout\) # (!\c1|hpos\(5)))) # (!\c1|sq_x1\(5) & (!\c1|hpos\(5) & !\c1|LessThan0~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(5),
	datab => \c1|hpos\(5),
	datad => VCC,
	cin => \c1|LessThan0~9_cout\,
	cout => \c1|LessThan0~11_cout\);

-- Location: LCCOMB_X31_Y13_N16
\c1|LessThan0~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan0~13_cout\ = CARRY((\c1|hpos\(6) & ((\c1|sq_x1\(6)) # (!\c1|LessThan0~11_cout\))) # (!\c1|hpos\(6) & (\c1|sq_x1\(6) & !\c1|LessThan0~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(6),
	datab => \c1|sq_x1\(6),
	datad => VCC,
	cin => \c1|LessThan0~11_cout\,
	cout => \c1|LessThan0~13_cout\);

-- Location: LCCOMB_X31_Y13_N18
\c1|LessThan0~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan0~15_cout\ = CARRY((\c1|hpos\(7) & (\c1|sq_x1\(7) & !\c1|LessThan0~13_cout\)) # (!\c1|hpos\(7) & ((\c1|sq_x1\(7)) # (!\c1|LessThan0~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(7),
	datab => \c1|sq_x1\(7),
	datad => VCC,
	cin => \c1|LessThan0~13_cout\,
	cout => \c1|LessThan0~15_cout\);

-- Location: LCCOMB_X31_Y13_N20
\c1|LessThan0~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan0~17_cout\ = CARRY((\c1|sq_x1\(8) & (\c1|hpos\(8) & !\c1|LessThan0~15_cout\)) # (!\c1|sq_x1\(8) & ((\c1|hpos\(8)) # (!\c1|LessThan0~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(8),
	datab => \c1|hpos\(8),
	datad => VCC,
	cin => \c1|LessThan0~15_cout\,
	cout => \c1|LessThan0~17_cout\);

-- Location: LCCOMB_X31_Y13_N22
\c1|LessThan0~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan0~19_cout\ = CARRY((\c1|sq_x1\(9) & (!\c1|hpos\(9) & !\c1|LessThan0~17_cout\)) # (!\c1|sq_x1\(9) & ((!\c1|LessThan0~17_cout\) # (!\c1|hpos\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x1\(9),
	datab => \c1|hpos\(9),
	datad => VCC,
	cin => \c1|LessThan0~17_cout\,
	cout => \c1|LessThan0~19_cout\);

-- Location: LCCOMB_X31_Y13_N24
\c1|LessThan0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan0~20_combout\ = (\c1|hpos\(10) & ((!\c1|sq_x1\(10)) # (!\c1|LessThan0~19_cout\))) # (!\c1|hpos\(10) & (!\c1|LessThan0~19_cout\ & !\c1|sq_x1\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|hpos\(10),
	datad => \c1|sq_x1\(10),
	cin => \c1|LessThan0~19_cout\,
	combout => \c1|LessThan0~20_combout\);

-- Location: PIN_T21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\key[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_key(3),
	combout => \key~combout\(3));

-- Location: LCCOMB_X38_Y14_N0
\c1|Add8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add8~1_combout\ = \c1|sq_y1\(0) $ (VCC)
-- \c1|Add8~2\ = CARRY(\c1|sq_y1\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_y1\(0),
	datad => VCC,
	combout => \c1|Add8~1_combout\,
	cout => \c1|Add8~2\);

-- Location: PIN_T22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\key[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_key(2),
	combout => \key~combout\(2));

-- Location: LCCOMB_X38_Y14_N26
\c1|sq_y1[10]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_y1[10]~0_combout\ = (!\key~combout\(2)) # (!\key~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \key~combout\(3),
	datad => \key~combout\(2),
	combout => \c1|sq_y1[10]~0_combout\);

-- Location: LCCOMB_X38_Y14_N28
\c1|sq_y1[10]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_y1[10]~1_combout\ = (\sw~combout\(0) & (\c1|LessThan9~0_combout\ & (\c1|LessThan8~1_combout\ & \c1|sq_y1[10]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(0),
	datab => \c1|LessThan9~0_combout\,
	datac => \c1|LessThan8~1_combout\,
	datad => \c1|sq_y1[10]~0_combout\,
	combout => \c1|sq_y1[10]~1_combout\);

-- Location: LCFF_X38_Y14_N1
\c1|sq_y1[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add8~1_combout\,
	ena => \c1|sq_y1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y1\(0));

-- Location: LCCOMB_X38_Y14_N8
\c1|Add8~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add8~9_combout\ = ((\c1|sq_y1\(4) $ (\key~combout\(3) $ (!\c1|Add8~8\)))) # (GND)
-- \c1|Add8~10\ = CARRY((\c1|sq_y1\(4) & (!\key~combout\(3) & !\c1|Add8~8\)) # (!\c1|sq_y1\(4) & ((!\c1|Add8~8\) # (!\key~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(4),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add8~8\,
	combout => \c1|Add8~9_combout\,
	cout => \c1|Add8~10\);

-- Location: LCCOMB_X38_Y14_N10
\c1|Add8~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add8~11_combout\ = (\c1|sq_y1\(5) & ((\key~combout\(3) & (!\c1|Add8~10\)) # (!\key~combout\(3) & (\c1|Add8~10\ & VCC)))) # (!\c1|sq_y1\(5) & ((\key~combout\(3) & ((\c1|Add8~10\) # (GND))) # (!\key~combout\(3) & (!\c1|Add8~10\))))
-- \c1|Add8~12\ = CARRY((\c1|sq_y1\(5) & (\key~combout\(3) & !\c1|Add8~10\)) # (!\c1|sq_y1\(5) & ((\key~combout\(3)) # (!\c1|Add8~10\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(5),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add8~10\,
	combout => \c1|Add8~11_combout\,
	cout => \c1|Add8~12\);

-- Location: LCCOMB_X38_Y14_N12
\c1|Add8~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add8~13_combout\ = ((\c1|sq_y1\(6) $ (\key~combout\(3) $ (!\c1|Add8~12\)))) # (GND)
-- \c1|Add8~14\ = CARRY((\c1|sq_y1\(6) & (!\key~combout\(3) & !\c1|Add8~12\)) # (!\c1|sq_y1\(6) & ((!\c1|Add8~12\) # (!\key~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(6),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add8~12\,
	combout => \c1|Add8~13_combout\,
	cout => \c1|Add8~14\);

-- Location: LCCOMB_X38_Y14_N14
\c1|Add8~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add8~15_combout\ = (\c1|sq_y1\(7) & ((\key~combout\(3) & (!\c1|Add8~14\)) # (!\key~combout\(3) & (\c1|Add8~14\ & VCC)))) # (!\c1|sq_y1\(7) & ((\key~combout\(3) & ((\c1|Add8~14\) # (GND))) # (!\key~combout\(3) & (!\c1|Add8~14\))))
-- \c1|Add8~16\ = CARRY((\c1|sq_y1\(7) & (\key~combout\(3) & !\c1|Add8~14\)) # (!\c1|sq_y1\(7) & ((\key~combout\(3)) # (!\c1|Add8~14\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(7),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add8~14\,
	combout => \c1|Add8~15_combout\,
	cout => \c1|Add8~16\);

-- Location: LCCOMB_X38_Y14_N16
\c1|Add8~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add8~17_combout\ = ((\c1|sq_y1\(8) $ (\key~combout\(3) $ (\c1|Add8~16\)))) # (GND)
-- \c1|Add8~18\ = CARRY((\c1|sq_y1\(8) & ((!\c1|Add8~16\) # (!\key~combout\(3)))) # (!\c1|sq_y1\(8) & (!\key~combout\(3) & !\c1|Add8~16\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(8),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add8~16\,
	combout => \c1|Add8~17_combout\,
	cout => \c1|Add8~18\);

-- Location: LCCOMB_X38_Y14_N20
\c1|Add8~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add8~21_combout\ = \c1|sq_y1\(10) $ (\key~combout\(3) $ (\c1|Add8~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(10),
	datab => \key~combout\(3),
	cin => \c1|Add8~20\,
	combout => \c1|Add8~21_combout\);

-- Location: LCFF_X38_Y14_N21
\c1|sq_y1[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add8~21_combout\,
	ena => \c1|sq_y1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y1\(10));

-- Location: LCFF_X38_Y14_N17
\c1|sq_y1[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add8~17_combout\,
	ena => \c1|sq_y1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y1\(8));

-- Location: LCFF_X38_Y14_N15
\c1|sq_y1[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add8~15_combout\,
	ena => \c1|sq_y1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y1\(7));

-- Location: LCCOMB_X38_Y14_N24
\c1|sq_y1[6]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_y1[6]~3_combout\ = !\c1|Add8~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \c1|Add8~13_combout\,
	combout => \c1|sq_y1[6]~3_combout\);

-- Location: LCFF_X38_Y14_N25
\c1|sq_y1[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_y1[6]~3_combout\,
	ena => \c1|sq_y1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y1\(6));

-- Location: LCFF_X38_Y14_N11
\c1|sq_y1[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add8~11_combout\,
	ena => \c1|sq_y1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y1\(5));

-- Location: LCCOMB_X37_Y14_N0
\c1|sq_y1[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_y1[4]~4_combout\ = !\c1|Add8~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|Add8~9_combout\,
	combout => \c1|sq_y1[4]~4_combout\);

-- Location: LCFF_X37_Y14_N1
\c1|sq_y1[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_y1[4]~4_combout\,
	ena => \c1|sq_y1[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y1\(4));

-- Location: LCCOMB_X35_Y14_N0
\c1|LessThan2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan2~1_cout\ = CARRY((!\c1|sq_y1\(0) & \c1|vpos\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(0),
	datab => \c1|vpos\(0),
	datad => VCC,
	cout => \c1|LessThan2~1_cout\);

-- Location: LCCOMB_X35_Y14_N2
\c1|LessThan2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan2~3_cout\ = CARRY((\c1|sq_y1\(1) & ((!\c1|LessThan2~1_cout\) # (!\c1|vpos\(1)))) # (!\c1|sq_y1\(1) & (!\c1|vpos\(1) & !\c1|LessThan2~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(1),
	datab => \c1|vpos\(1),
	datad => VCC,
	cin => \c1|LessThan2~1_cout\,
	cout => \c1|LessThan2~3_cout\);

-- Location: LCCOMB_X35_Y14_N4
\c1|LessThan2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan2~5_cout\ = CARRY((\c1|sq_y1\(2) & (\c1|vpos\(2) & !\c1|LessThan2~3_cout\)) # (!\c1|sq_y1\(2) & ((\c1|vpos\(2)) # (!\c1|LessThan2~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(2),
	datab => \c1|vpos\(2),
	datad => VCC,
	cin => \c1|LessThan2~3_cout\,
	cout => \c1|LessThan2~5_cout\);

-- Location: LCCOMB_X35_Y14_N6
\c1|LessThan2~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan2~7_cout\ = CARRY((\c1|sq_y1\(3) & (!\c1|vpos\(3) & !\c1|LessThan2~5_cout\)) # (!\c1|sq_y1\(3) & ((!\c1|LessThan2~5_cout\) # (!\c1|vpos\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(3),
	datab => \c1|vpos\(3),
	datad => VCC,
	cin => \c1|LessThan2~5_cout\,
	cout => \c1|LessThan2~7_cout\);

-- Location: LCCOMB_X35_Y14_N8
\c1|LessThan2~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan2~9_cout\ = CARRY((\c1|vpos\(4) & ((\c1|sq_y1\(4)) # (!\c1|LessThan2~7_cout\))) # (!\c1|vpos\(4) & (\c1|sq_y1\(4) & !\c1|LessThan2~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(4),
	datab => \c1|sq_y1\(4),
	datad => VCC,
	cin => \c1|LessThan2~7_cout\,
	cout => \c1|LessThan2~9_cout\);

-- Location: LCCOMB_X35_Y14_N10
\c1|LessThan2~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan2~11_cout\ = CARRY((\c1|vpos\(5) & (\c1|sq_y1\(5) & !\c1|LessThan2~9_cout\)) # (!\c1|vpos\(5) & ((\c1|sq_y1\(5)) # (!\c1|LessThan2~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(5),
	datab => \c1|sq_y1\(5),
	datad => VCC,
	cin => \c1|LessThan2~9_cout\,
	cout => \c1|LessThan2~11_cout\);

-- Location: LCCOMB_X35_Y14_N12
\c1|LessThan2~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan2~13_cout\ = CARRY((\c1|vpos\(6) & ((\c1|sq_y1\(6)) # (!\c1|LessThan2~11_cout\))) # (!\c1|vpos\(6) & (\c1|sq_y1\(6) & !\c1|LessThan2~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(6),
	datab => \c1|sq_y1\(6),
	datad => VCC,
	cin => \c1|LessThan2~11_cout\,
	cout => \c1|LessThan2~13_cout\);

-- Location: LCCOMB_X35_Y14_N14
\c1|LessThan2~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan2~15_cout\ = CARRY((\c1|vpos\(7) & (\c1|sq_y1\(7) & !\c1|LessThan2~13_cout\)) # (!\c1|vpos\(7) & ((\c1|sq_y1\(7)) # (!\c1|LessThan2~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(7),
	datab => \c1|sq_y1\(7),
	datad => VCC,
	cin => \c1|LessThan2~13_cout\,
	cout => \c1|LessThan2~15_cout\);

-- Location: LCCOMB_X35_Y14_N16
\c1|LessThan2~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan2~17_cout\ = CARRY((\c1|vpos\(8) & ((!\c1|LessThan2~15_cout\) # (!\c1|sq_y1\(8)))) # (!\c1|vpos\(8) & (!\c1|sq_y1\(8) & !\c1|LessThan2~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(8),
	datab => \c1|sq_y1\(8),
	datad => VCC,
	cin => \c1|LessThan2~15_cout\,
	cout => \c1|LessThan2~17_cout\);

-- Location: LCCOMB_X35_Y14_N18
\c1|LessThan2~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan2~19_cout\ = CARRY((\c1|sq_y1\(9) & (!\c1|vpos\(9) & !\c1|LessThan2~17_cout\)) # (!\c1|sq_y1\(9) & ((!\c1|LessThan2~17_cout\) # (!\c1|vpos\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1\(9),
	datab => \c1|vpos\(9),
	datad => VCC,
	cin => \c1|LessThan2~17_cout\,
	cout => \c1|LessThan2~19_cout\);

-- Location: LCCOMB_X35_Y14_N20
\c1|LessThan2~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan2~20_combout\ = (\c1|vpos\(10) & ((!\c1|sq_y1\(10)) # (!\c1|LessThan2~19_cout\))) # (!\c1|vpos\(10) & (!\c1|LessThan2~19_cout\ & !\c1|sq_y1\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(10),
	datad => \c1|sq_y1\(10),
	cin => \c1|LessThan2~19_cout\,
	combout => \c1|LessThan2~20_combout\);

-- Location: LCCOMB_X33_Y14_N26
\c1|draw1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|draw1~1_combout\ = (\c1|LessThan0~20_combout\ & \c1|LessThan2~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|LessThan0~20_combout\,
	datad => \c1|LessThan2~20_combout\,
	combout => \c1|draw1~1_combout\);

-- Location: LCCOMB_X34_Y12_N2
\c1|Add10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add10~1_combout\ = \c1|sq_x2\(0) $ (VCC)
-- \c1|Add10~2\ = CARRY(\c1|sq_x2\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x2\(0),
	datad => VCC,
	combout => \c1|Add10~1_combout\,
	cout => \c1|Add10~2\);

-- Location: LCCOMB_X34_Y13_N30
\c1|sq_x2[10]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_x2[10]~0_combout\ = (\sw~combout\(1) & (\c1|sq_x1[10]~0_combout\ & (\c1|LessThan9~0_combout\ & \c1|LessThan8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(1),
	datab => \c1|sq_x1[10]~0_combout\,
	datac => \c1|LessThan9~0_combout\,
	datad => \c1|LessThan8~1_combout\,
	combout => \c1|sq_x2[10]~0_combout\);

-- Location: LCFF_X34_Y12_N3
\c1|sq_x2[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add10~1_combout\,
	ena => \c1|sq_x2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x2\(0));

-- Location: LCCOMB_X34_Y12_N4
\c1|Add10~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add10~3_combout\ = (\key~combout\(1) & ((\c1|sq_x2\(1) & (!\c1|Add10~2\)) # (!\c1|sq_x2\(1) & ((\c1|Add10~2\) # (GND))))) # (!\key~combout\(1) & ((\c1|sq_x2\(1) & (\c1|Add10~2\ & VCC)) # (!\c1|sq_x2\(1) & (!\c1|Add10~2\))))
-- \c1|Add10~4\ = CARRY((\key~combout\(1) & ((!\c1|Add10~2\) # (!\c1|sq_x2\(1)))) # (!\key~combout\(1) & (!\c1|sq_x2\(1) & !\c1|Add10~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \key~combout\(1),
	datab => \c1|sq_x2\(1),
	datad => VCC,
	cin => \c1|Add10~2\,
	combout => \c1|Add10~3_combout\,
	cout => \c1|Add10~4\);

-- Location: LCFF_X34_Y12_N5
\c1|sq_x2[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add10~3_combout\,
	ena => \c1|sq_x2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x2\(1));

-- Location: LCCOMB_X34_Y12_N6
\c1|Add10~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add10~5_combout\ = ((\key~combout\(1) $ (\c1|sq_x2\(2) $ (\c1|Add10~4\)))) # (GND)
-- \c1|Add10~6\ = CARRY((\key~combout\(1) & ((!\c1|Add10~4\) # (!\c1|sq_x2\(2)))) # (!\key~combout\(1) & (!\c1|sq_x2\(2) & !\c1|Add10~4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \key~combout\(1),
	datab => \c1|sq_x2\(2),
	datad => VCC,
	cin => \c1|Add10~4\,
	combout => \c1|Add10~5_combout\,
	cout => \c1|Add10~6\);

-- Location: LCCOMB_X33_Y12_N10
\c1|sq_x2[2]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_x2[2]~6_combout\ = !\c1|Add10~5_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \c1|Add10~5_combout\,
	combout => \c1|sq_x2[2]~6_combout\);

-- Location: LCFF_X33_Y12_N11
\c1|sq_x2[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_x2[2]~6_combout\,
	ena => \c1|sq_x2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x2\(2));

-- Location: LCCOMB_X34_Y12_N8
\c1|Add10~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add10~7_combout\ = (\key~combout\(1) & ((\c1|sq_x2\(3) & (!\c1|Add10~6\)) # (!\c1|sq_x2\(3) & ((\c1|Add10~6\) # (GND))))) # (!\key~combout\(1) & ((\c1|sq_x2\(3) & (\c1|Add10~6\ & VCC)) # (!\c1|sq_x2\(3) & (!\c1|Add10~6\))))
-- \c1|Add10~8\ = CARRY((\key~combout\(1) & ((!\c1|Add10~6\) # (!\c1|sq_x2\(3)))) # (!\key~combout\(1) & (!\c1|sq_x2\(3) & !\c1|Add10~6\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \key~combout\(1),
	datab => \c1|sq_x2\(3),
	datad => VCC,
	cin => \c1|Add10~6\,
	combout => \c1|Add10~7_combout\,
	cout => \c1|Add10~8\);

-- Location: LCFF_X34_Y12_N9
\c1|sq_x2[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add10~7_combout\,
	ena => \c1|sq_x2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x2\(3));

-- Location: LCCOMB_X34_Y12_N10
\c1|Add10~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add10~9_combout\ = ((\key~combout\(1) $ (\c1|sq_x2\(4) $ (!\c1|Add10~8\)))) # (GND)
-- \c1|Add10~10\ = CARRY((\key~combout\(1) & (!\c1|sq_x2\(4) & !\c1|Add10~8\)) # (!\key~combout\(1) & ((!\c1|Add10~8\) # (!\c1|sq_x2\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \key~combout\(1),
	datab => \c1|sq_x2\(4),
	datad => VCC,
	cin => \c1|Add10~8\,
	combout => \c1|Add10~9_combout\,
	cout => \c1|Add10~10\);

-- Location: LCCOMB_X33_Y12_N0
\c1|sq_x2[4]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_x2[4]~5_combout\ = !\c1|Add10~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|Add10~9_combout\,
	combout => \c1|sq_x2[4]~5_combout\);

-- Location: LCFF_X33_Y12_N1
\c1|sq_x2[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_x2[4]~5_combout\,
	ena => \c1|sq_x2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x2\(4));

-- Location: LCCOMB_X34_Y12_N12
\c1|Add10~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add10~11_combout\ = (\key~combout\(1) & ((\c1|sq_x2\(5) & ((\c1|Add10~10\) # (GND))) # (!\c1|sq_x2\(5) & (!\c1|Add10~10\)))) # (!\key~combout\(1) & ((\c1|sq_x2\(5) & (!\c1|Add10~10\)) # (!\c1|sq_x2\(5) & (\c1|Add10~10\ & VCC))))
-- \c1|Add10~12\ = CARRY((\key~combout\(1) & ((\c1|sq_x2\(5)) # (!\c1|Add10~10\))) # (!\key~combout\(1) & (\c1|sq_x2\(5) & !\c1|Add10~10\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \key~combout\(1),
	datab => \c1|sq_x2\(5),
	datad => VCC,
	cin => \c1|Add10~10\,
	combout => \c1|Add10~11_combout\,
	cout => \c1|Add10~12\);

-- Location: LCCOMB_X33_Y12_N30
\c1|sq_x2[5]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_x2[5]~4_combout\ = !\c1|Add10~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|Add10~11_combout\,
	combout => \c1|sq_x2[5]~4_combout\);

-- Location: LCFF_X33_Y12_N31
\c1|sq_x2[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_x2[5]~4_combout\,
	ena => \c1|sq_x2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x2\(5));

-- Location: LCCOMB_X34_Y12_N14
\c1|Add10~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add10~13_combout\ = ((\key~combout\(1) $ (\c1|sq_x2\(6) $ (!\c1|Add10~12\)))) # (GND)
-- \c1|Add10~14\ = CARRY((\key~combout\(1) & (!\c1|sq_x2\(6) & !\c1|Add10~12\)) # (!\key~combout\(1) & ((!\c1|Add10~12\) # (!\c1|sq_x2\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \key~combout\(1),
	datab => \c1|sq_x2\(6),
	datad => VCC,
	cin => \c1|Add10~12\,
	combout => \c1|Add10~13_combout\,
	cout => \c1|Add10~14\);

-- Location: LCCOMB_X33_Y12_N4
\c1|sq_x2[6]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_x2[6]~3_combout\ = !\c1|Add10~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|Add10~13_combout\,
	combout => \c1|sq_x2[6]~3_combout\);

-- Location: LCFF_X33_Y12_N5
\c1|sq_x2[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_x2[6]~3_combout\,
	ena => \c1|sq_x2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x2\(6));

-- Location: LCCOMB_X34_Y12_N16
\c1|Add10~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add10~15_combout\ = (\key~combout\(1) & ((\c1|sq_x2\(7) & ((\c1|Add10~14\) # (GND))) # (!\c1|sq_x2\(7) & (!\c1|Add10~14\)))) # (!\key~combout\(1) & ((\c1|sq_x2\(7) & (!\c1|Add10~14\)) # (!\c1|sq_x2\(7) & (\c1|Add10~14\ & VCC))))
-- \c1|Add10~16\ = CARRY((\key~combout\(1) & ((\c1|sq_x2\(7)) # (!\c1|Add10~14\))) # (!\key~combout\(1) & (\c1|sq_x2\(7) & !\c1|Add10~14\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \key~combout\(1),
	datab => \c1|sq_x2\(7),
	datad => VCC,
	cin => \c1|Add10~14\,
	combout => \c1|Add10~15_combout\,
	cout => \c1|Add10~16\);

-- Location: LCCOMB_X33_Y12_N2
\c1|sq_x2[7]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_x2[7]~2_combout\ = !\c1|Add10~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|Add10~15_combout\,
	combout => \c1|sq_x2[7]~2_combout\);

-- Location: LCFF_X33_Y12_N3
\c1|sq_x2[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_x2[7]~2_combout\,
	ena => \c1|sq_x2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x2\(7));

-- Location: LCCOMB_X34_Y12_N18
\c1|Add10~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add10~17_combout\ = ((\key~combout\(1) $ (\c1|sq_x2\(8) $ (!\c1|Add10~16\)))) # (GND)
-- \c1|Add10~18\ = CARRY((\key~combout\(1) & (!\c1|sq_x2\(8) & !\c1|Add10~16\)) # (!\key~combout\(1) & ((!\c1|Add10~16\) # (!\c1|sq_x2\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \key~combout\(1),
	datab => \c1|sq_x2\(8),
	datad => VCC,
	cin => \c1|Add10~16\,
	combout => \c1|Add10~17_combout\,
	cout => \c1|Add10~18\);

-- Location: LCCOMB_X33_Y12_N8
\c1|sq_x2[8]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_x2[8]~1_combout\ = !\c1|Add10~17_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \c1|Add10~17_combout\,
	combout => \c1|sq_x2[8]~1_combout\);

-- Location: LCFF_X33_Y12_N9
\c1|sq_x2[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_x2[8]~1_combout\,
	ena => \c1|sq_x2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x2\(8));

-- Location: LCCOMB_X34_Y12_N20
\c1|Add10~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add10~19_combout\ = (\key~combout\(1) & ((\c1|sq_x2\(9) & (!\c1|Add10~18\)) # (!\c1|sq_x2\(9) & ((\c1|Add10~18\) # (GND))))) # (!\key~combout\(1) & ((\c1|sq_x2\(9) & (\c1|Add10~18\ & VCC)) # (!\c1|sq_x2\(9) & (!\c1|Add10~18\))))
-- \c1|Add10~20\ = CARRY((\key~combout\(1) & ((!\c1|Add10~18\) # (!\c1|sq_x2\(9)))) # (!\key~combout\(1) & (!\c1|sq_x2\(9) & !\c1|Add10~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \key~combout\(1),
	datab => \c1|sq_x2\(9),
	datad => VCC,
	cin => \c1|Add10~18\,
	combout => \c1|Add10~19_combout\,
	cout => \c1|Add10~20\);

-- Location: LCFF_X34_Y12_N21
\c1|sq_x2[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add10~19_combout\,
	ena => \c1|sq_x2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x2\(9));

-- Location: LCCOMB_X31_Y12_N10
\c1|LessThan4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan4~1_cout\ = CARRY((\c1|hpos\(0) & !\c1|sq_x2\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(0),
	datab => \c1|sq_x2\(0),
	datad => VCC,
	cout => \c1|LessThan4~1_cout\);

-- Location: LCCOMB_X31_Y12_N12
\c1|LessThan4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan4~3_cout\ = CARRY((\c1|sq_x2\(1) & ((!\c1|LessThan4~1_cout\) # (!\c1|hpos\(1)))) # (!\c1|sq_x2\(1) & (!\c1|hpos\(1) & !\c1|LessThan4~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x2\(1),
	datab => \c1|hpos\(1),
	datad => VCC,
	cin => \c1|LessThan4~1_cout\,
	cout => \c1|LessThan4~3_cout\);

-- Location: LCCOMB_X31_Y12_N14
\c1|LessThan4~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan4~5_cout\ = CARRY((\c1|hpos\(2) & ((\c1|sq_x2\(2)) # (!\c1|LessThan4~3_cout\))) # (!\c1|hpos\(2) & (\c1|sq_x2\(2) & !\c1|LessThan4~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(2),
	datab => \c1|sq_x2\(2),
	datad => VCC,
	cin => \c1|LessThan4~3_cout\,
	cout => \c1|LessThan4~5_cout\);

-- Location: LCCOMB_X31_Y12_N16
\c1|LessThan4~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan4~7_cout\ = CARRY((\c1|hpos\(3) & (\c1|sq_x2\(3) & !\c1|LessThan4~5_cout\)) # (!\c1|hpos\(3) & ((\c1|sq_x2\(3)) # (!\c1|LessThan4~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(3),
	datab => \c1|sq_x2\(3),
	datad => VCC,
	cin => \c1|LessThan4~5_cout\,
	cout => \c1|LessThan4~7_cout\);

-- Location: LCCOMB_X31_Y12_N18
\c1|LessThan4~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan4~9_cout\ = CARRY((\c1|sq_x2\(4) & ((\c1|hpos\(4)) # (!\c1|LessThan4~7_cout\))) # (!\c1|sq_x2\(4) & (\c1|hpos\(4) & !\c1|LessThan4~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x2\(4),
	datab => \c1|hpos\(4),
	datad => VCC,
	cin => \c1|LessThan4~7_cout\,
	cout => \c1|LessThan4~9_cout\);

-- Location: LCCOMB_X31_Y12_N20
\c1|LessThan4~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan4~11_cout\ = CARRY((\c1|hpos\(5) & (!\c1|sq_x2\(5) & !\c1|LessThan4~9_cout\)) # (!\c1|hpos\(5) & ((!\c1|LessThan4~9_cout\) # (!\c1|sq_x2\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(5),
	datab => \c1|sq_x2\(5),
	datad => VCC,
	cin => \c1|LessThan4~9_cout\,
	cout => \c1|LessThan4~11_cout\);

-- Location: LCCOMB_X31_Y12_N22
\c1|LessThan4~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan4~13_cout\ = CARRY((\c1|sq_x2\(6) & ((\c1|hpos\(6)) # (!\c1|LessThan4~11_cout\))) # (!\c1|sq_x2\(6) & (\c1|hpos\(6) & !\c1|LessThan4~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x2\(6),
	datab => \c1|hpos\(6),
	datad => VCC,
	cin => \c1|LessThan4~11_cout\,
	cout => \c1|LessThan4~13_cout\);

-- Location: LCCOMB_X31_Y12_N24
\c1|LessThan4~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan4~15_cout\ = CARRY((\c1|sq_x2\(7) & (!\c1|hpos\(7) & !\c1|LessThan4~13_cout\)) # (!\c1|sq_x2\(7) & ((!\c1|LessThan4~13_cout\) # (!\c1|hpos\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x2\(7),
	datab => \c1|hpos\(7),
	datad => VCC,
	cin => \c1|LessThan4~13_cout\,
	cout => \c1|LessThan4~15_cout\);

-- Location: LCCOMB_X31_Y12_N26
\c1|LessThan4~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan4~17_cout\ = CARRY((\c1|sq_x2\(8) & ((\c1|hpos\(8)) # (!\c1|LessThan4~15_cout\))) # (!\c1|sq_x2\(8) & (\c1|hpos\(8) & !\c1|LessThan4~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x2\(8),
	datab => \c1|hpos\(8),
	datad => VCC,
	cin => \c1|LessThan4~15_cout\,
	cout => \c1|LessThan4~17_cout\);

-- Location: LCCOMB_X31_Y12_N28
\c1|LessThan4~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan4~19_cout\ = CARRY((\c1|hpos\(9) & (\c1|sq_x2\(9) & !\c1|LessThan4~17_cout\)) # (!\c1|hpos\(9) & ((\c1|sq_x2\(9)) # (!\c1|LessThan4~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|hpos\(9),
	datab => \c1|sq_x2\(9),
	datad => VCC,
	cin => \c1|LessThan4~17_cout\,
	cout => \c1|LessThan4~19_cout\);

-- Location: LCCOMB_X31_Y12_N30
\c1|LessThan4~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan4~20_combout\ = (\c1|sq_x2\(10) & (\c1|hpos\(10) & !\c1|LessThan4~19_cout\)) # (!\c1|sq_x2\(10) & ((\c1|hpos\(10)) # (!\c1|LessThan4~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_x2\(10),
	datab => \c1|hpos\(10),
	cin => \c1|LessThan4~19_cout\,
	combout => \c1|LessThan4~20_combout\);

-- Location: LCFF_X34_Y14_N13
\c1|vpos[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|vpos[6]~23_combout\,
	sclr => \c1|LessThan9~0_combout\,
	ena => \c1|LessThan8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|vpos\(6));

-- Location: LCCOMB_X32_Y15_N10
\c1|Add12~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add12~1_combout\ = \c1|sq_y2\(0) $ (VCC)
-- \c1|Add12~2\ = CARRY(\c1|sq_y2\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(0),
	datad => VCC,
	combout => \c1|Add12~1_combout\,
	cout => \c1|Add12~2\);

-- Location: LCCOMB_X32_Y15_N14
\c1|Add12~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add12~5_combout\ = ((\c1|sq_y2\(2) $ (\key~combout\(3) $ (\c1|Add12~4\)))) # (GND)
-- \c1|Add12~6\ = CARRY((\c1|sq_y2\(2) & (\key~combout\(3) & !\c1|Add12~4\)) # (!\c1|sq_y2\(2) & ((\key~combout\(3)) # (!\c1|Add12~4\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(2),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add12~4\,
	combout => \c1|Add12~5_combout\,
	cout => \c1|Add12~6\);

-- Location: LCCOMB_X32_Y15_N18
\c1|Add12~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add12~9_combout\ = ((\c1|sq_y2\(4) $ (\key~combout\(3) $ (!\c1|Add12~8\)))) # (GND)
-- \c1|Add12~10\ = CARRY((\c1|sq_y2\(4) & (!\key~combout\(3) & !\c1|Add12~8\)) # (!\c1|sq_y2\(4) & ((!\c1|Add12~8\) # (!\key~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(4),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add12~8\,
	combout => \c1|Add12~9_combout\,
	cout => \c1|Add12~10\);

-- Location: LCCOMB_X32_Y15_N20
\c1|Add12~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add12~11_combout\ = (\c1|sq_y2\(5) & ((\key~combout\(3) & ((\c1|Add12~10\) # (GND))) # (!\key~combout\(3) & (!\c1|Add12~10\)))) # (!\c1|sq_y2\(5) & ((\key~combout\(3) & (!\c1|Add12~10\)) # (!\key~combout\(3) & (\c1|Add12~10\ & VCC))))
-- \c1|Add12~12\ = CARRY((\c1|sq_y2\(5) & ((\key~combout\(3)) # (!\c1|Add12~10\))) # (!\c1|sq_y2\(5) & (\key~combout\(3) & !\c1|Add12~10\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(5),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add12~10\,
	combout => \c1|Add12~11_combout\,
	cout => \c1|Add12~12\);

-- Location: LCCOMB_X33_Y15_N6
\c1|sq_y2[5]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_y2[5]~4_combout\ = !\c1|Add12~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|Add12~11_combout\,
	combout => \c1|sq_y2[5]~4_combout\);

-- Location: PIN_L21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sw[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sw(1),
	combout => \sw~combout\(1));

-- Location: LCCOMB_X34_Y14_N22
\c1|sq_y2[10]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_y2[10]~0_combout\ = (\c1|sq_y1[10]~0_combout\ & (\c1|LessThan9~0_combout\ & (\c1|LessThan8~1_combout\ & \sw~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y1[10]~0_combout\,
	datab => \c1|LessThan9~0_combout\,
	datac => \c1|LessThan8~1_combout\,
	datad => \sw~combout\(1),
	combout => \c1|sq_y2[10]~0_combout\);

-- Location: LCFF_X33_Y15_N7
\c1|sq_y2[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_y2[5]~4_combout\,
	ena => \c1|sq_y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y2\(5));

-- Location: LCCOMB_X33_Y15_N8
\c1|sq_y2[4]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_y2[4]~5_combout\ = !\c1|Add12~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \c1|Add12~9_combout\,
	combout => \c1|sq_y2[4]~5_combout\);

-- Location: LCFF_X33_Y15_N9
\c1|sq_y2[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_y2[4]~5_combout\,
	ena => \c1|sq_y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y2\(4));

-- Location: LCCOMB_X33_Y15_N2
\c1|sq_y2[2]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_y2[2]~6_combout\ = !\c1|Add12~5_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \c1|Add12~5_combout\,
	combout => \c1|sq_y2[2]~6_combout\);

-- Location: LCFF_X33_Y15_N3
\c1|sq_y2[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_y2[2]~6_combout\,
	ena => \c1|sq_y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y2\(2));

-- Location: LCFF_X32_Y15_N11
\c1|sq_y2[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add12~1_combout\,
	ena => \c1|sq_y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y2\(0));

-- Location: LCCOMB_X35_Y15_N0
\c1|LessThan6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan6~1_cout\ = CARRY((\c1|vpos\(0) & !\c1|sq_y2\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(0),
	datab => \c1|sq_y2\(0),
	datad => VCC,
	cout => \c1|LessThan6~1_cout\);

-- Location: LCCOMB_X35_Y15_N2
\c1|LessThan6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan6~3_cout\ = CARRY((\c1|sq_y2\(1) & ((!\c1|LessThan6~1_cout\) # (!\c1|vpos\(1)))) # (!\c1|sq_y2\(1) & (!\c1|vpos\(1) & !\c1|LessThan6~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(1),
	datab => \c1|vpos\(1),
	datad => VCC,
	cin => \c1|LessThan6~1_cout\,
	cout => \c1|LessThan6~3_cout\);

-- Location: LCCOMB_X35_Y15_N4
\c1|LessThan6~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan6~5_cout\ = CARRY((\c1|vpos\(2) & ((\c1|sq_y2\(2)) # (!\c1|LessThan6~3_cout\))) # (!\c1|vpos\(2) & (\c1|sq_y2\(2) & !\c1|LessThan6~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(2),
	datab => \c1|sq_y2\(2),
	datad => VCC,
	cin => \c1|LessThan6~3_cout\,
	cout => \c1|LessThan6~5_cout\);

-- Location: LCCOMB_X35_Y15_N6
\c1|LessThan6~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan6~7_cout\ = CARRY((\c1|sq_y2\(3) & ((!\c1|LessThan6~5_cout\) # (!\c1|vpos\(3)))) # (!\c1|sq_y2\(3) & (!\c1|vpos\(3) & !\c1|LessThan6~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(3),
	datab => \c1|vpos\(3),
	datad => VCC,
	cin => \c1|LessThan6~5_cout\,
	cout => \c1|LessThan6~7_cout\);

-- Location: LCCOMB_X35_Y15_N8
\c1|LessThan6~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan6~9_cout\ = CARRY((\c1|vpos\(4) & ((\c1|sq_y2\(4)) # (!\c1|LessThan6~7_cout\))) # (!\c1|vpos\(4) & (\c1|sq_y2\(4) & !\c1|LessThan6~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(4),
	datab => \c1|sq_y2\(4),
	datad => VCC,
	cin => \c1|LessThan6~7_cout\,
	cout => \c1|LessThan6~9_cout\);

-- Location: LCCOMB_X35_Y15_N10
\c1|LessThan6~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan6~11_cout\ = CARRY((\c1|vpos\(5) & (!\c1|sq_y2\(5) & !\c1|LessThan6~9_cout\)) # (!\c1|vpos\(5) & ((!\c1|LessThan6~9_cout\) # (!\c1|sq_y2\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(5),
	datab => \c1|sq_y2\(5),
	datad => VCC,
	cin => \c1|LessThan6~9_cout\,
	cout => \c1|LessThan6~11_cout\);

-- Location: LCCOMB_X35_Y15_N12
\c1|LessThan6~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan6~13_cout\ = CARRY((\c1|sq_y2\(6) & ((\c1|vpos\(6)) # (!\c1|LessThan6~11_cout\))) # (!\c1|sq_y2\(6) & (\c1|vpos\(6) & !\c1|LessThan6~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(6),
	datab => \c1|vpos\(6),
	datad => VCC,
	cin => \c1|LessThan6~11_cout\,
	cout => \c1|LessThan6~13_cout\);

-- Location: LCCOMB_X35_Y15_N14
\c1|LessThan6~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan6~15_cout\ = CARRY((\c1|sq_y2\(7) & (!\c1|vpos\(7) & !\c1|LessThan6~13_cout\)) # (!\c1|sq_y2\(7) & ((!\c1|LessThan6~13_cout\) # (!\c1|vpos\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(7),
	datab => \c1|vpos\(7),
	datad => VCC,
	cin => \c1|LessThan6~13_cout\,
	cout => \c1|LessThan6~15_cout\);

-- Location: LCCOMB_X35_Y15_N16
\c1|LessThan6~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan6~17_cout\ = CARRY((\c1|sq_y2\(8) & ((\c1|vpos\(8)) # (!\c1|LessThan6~15_cout\))) # (!\c1|sq_y2\(8) & (\c1|vpos\(8) & !\c1|LessThan6~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(8),
	datab => \c1|vpos\(8),
	datad => VCC,
	cin => \c1|LessThan6~15_cout\,
	cout => \c1|LessThan6~17_cout\);

-- Location: LCCOMB_X35_Y15_N18
\c1|LessThan6~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan6~19_cout\ = CARRY((\c1|sq_y2\(9) & ((!\c1|LessThan6~17_cout\) # (!\c1|vpos\(9)))) # (!\c1|sq_y2\(9) & (!\c1|vpos\(9) & !\c1|LessThan6~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(9),
	datab => \c1|vpos\(9),
	datad => VCC,
	cin => \c1|LessThan6~17_cout\,
	cout => \c1|LessThan6~19_cout\);

-- Location: LCCOMB_X35_Y15_N20
\c1|LessThan6~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan6~20_combout\ = (\c1|sq_y2\(10) & (!\c1|LessThan6~19_cout\ & \c1|vpos\(10))) # (!\c1|sq_y2\(10) & ((\c1|vpos\(10)) # (!\c1|LessThan6~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(10),
	datad => \c1|vpos\(10),
	cin => \c1|LessThan6~19_cout\,
	combout => \c1|LessThan6~20_combout\);

-- Location: LCCOMB_X33_Y14_N16
\c1|draw2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|draw2~1_combout\ = (\c1|LessThan4~20_combout\ & \c1|LessThan6~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c1|LessThan4~20_combout\,
	datad => \c1|LessThan6~20_combout\,
	combout => \c1|draw2~1_combout\);

-- Location: LCCOMB_X34_Y12_N22
\c1|Add10~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add10~21_combout\ = \c1|sq_x2\(10) $ (\c1|Add10~20\ $ (\key~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_x2\(10),
	datad => \key~combout\(1),
	cin => \c1|Add10~20\,
	combout => \c1|Add10~21_combout\);

-- Location: LCFF_X34_Y12_N23
\c1|sq_x2[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add10~21_combout\,
	ena => \c1|sq_x2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_x2\(10));

-- Location: LCCOMB_X33_Y12_N28
\c1|Add2~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add2~16_combout\ = !\c1|Add2~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \c1|Add2~15\,
	combout => \c1|Add2~16_combout\);

-- Location: LCCOMB_X32_Y15_N26
\c1|Add12~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add12~17_combout\ = ((\c1|sq_y2\(8) $ (\key~combout\(3) $ (!\c1|Add12~16\)))) # (GND)
-- \c1|Add12~18\ = CARRY((\c1|sq_y2\(8) & (!\key~combout\(3) & !\c1|Add12~16\)) # (!\c1|sq_y2\(8) & ((!\c1|Add12~16\) # (!\key~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(8),
	datab => \key~combout\(3),
	datad => VCC,
	cin => \c1|Add12~16\,
	combout => \c1|Add12~17_combout\,
	cout => \c1|Add12~18\);

-- Location: LCFF_X32_Y15_N29
\c1|sq_y2[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|Add12~19_combout\,
	ena => \c1|sq_y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y2\(9));

-- Location: LCCOMB_X33_Y15_N0
\c1|sq_y2[8]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|sq_y2[8]~1_combout\ = !\c1|Add12~17_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \c1|Add12~17_combout\,
	combout => \c1|sq_y2[8]~1_combout\);

-- Location: LCFF_X33_Y15_N1
\c1|sq_y2[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|sq_y2[8]~1_combout\,
	ena => \c1|sq_y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|sq_y2\(8));

-- Location: LCCOMB_X33_Y15_N16
\c1|Add3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add3~2_combout\ = (\c1|sq_y2\(4) & ((\c1|Add3~1\) # (GND))) # (!\c1|sq_y2\(4) & (!\c1|Add3~1\))
-- \c1|Add3~3\ = CARRY((\c1|sq_y2\(4)) # (!\c1|Add3~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_y2\(4),
	datad => VCC,
	cin => \c1|Add3~1\,
	combout => \c1|Add3~2_combout\,
	cout => \c1|Add3~3\);

-- Location: LCCOMB_X33_Y15_N22
\c1|Add3~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add3~8_combout\ = (\c1|sq_y2\(7) & (!\c1|Add3~7\ & VCC)) # (!\c1|sq_y2\(7) & (\c1|Add3~7\ $ (GND)))
-- \c1|Add3~9\ = CARRY((!\c1|sq_y2\(7) & !\c1|Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(7),
	datad => VCC,
	cin => \c1|Add3~7\,
	combout => \c1|Add3~8_combout\,
	cout => \c1|Add3~9\);

-- Location: LCCOMB_X33_Y15_N24
\c1|Add3~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add3~10_combout\ = (\c1|sq_y2\(8) & ((\c1|Add3~9\) # (GND))) # (!\c1|sq_y2\(8) & (!\c1|Add3~9\))
-- \c1|Add3~11\ = CARRY((\c1|sq_y2\(8)) # (!\c1|Add3~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_y2\(8),
	datad => VCC,
	cin => \c1|Add3~9\,
	combout => \c1|Add3~10_combout\,
	cout => \c1|Add3~11\);

-- Location: LCCOMB_X33_Y15_N26
\c1|Add3~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add3~12_combout\ = (\c1|sq_y2\(9) & (\c1|Add3~11\ $ (GND))) # (!\c1|sq_y2\(9) & (!\c1|Add3~11\ & VCC))
-- \c1|Add3~13\ = CARRY((\c1|sq_y2\(9) & !\c1|Add3~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|sq_y2\(9),
	datad => VCC,
	cin => \c1|Add3~11\,
	combout => \c1|Add3~12_combout\,
	cout => \c1|Add3~13\);

-- Location: LCCOMB_X33_Y15_N28
\c1|Add3~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add3~14_combout\ = (\c1|sq_y2\(10) & (!\c1|Add3~13\)) # (!\c1|sq_y2\(10) & ((\c1|Add3~13\) # (GND)))
-- \c1|Add3~15\ = CARRY((!\c1|Add3~13\) # (!\c1|sq_y2\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(10),
	datad => VCC,
	cin => \c1|Add3~13\,
	combout => \c1|Add3~14_combout\,
	cout => \c1|Add3~15\);

-- Location: LCCOMB_X33_Y15_N30
\c1|Add3~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|Add3~16_combout\ = !\c1|Add3~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \c1|Add3~15\,
	combout => \c1|Add3~16_combout\);

-- Location: LCCOMB_X34_Y15_N2
\c1|LessThan7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan7~1_cout\ = CARRY((\c1|sq_y2\(0) & !\c1|vpos\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(0),
	datab => \c1|vpos\(0),
	datad => VCC,
	cout => \c1|LessThan7~1_cout\);

-- Location: LCCOMB_X34_Y15_N4
\c1|LessThan7~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan7~3_cout\ = CARRY((\c1|sq_y2\(1) & (\c1|vpos\(1) & !\c1|LessThan7~1_cout\)) # (!\c1|sq_y2\(1) & ((\c1|vpos\(1)) # (!\c1|LessThan7~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(1),
	datab => \c1|vpos\(1),
	datad => VCC,
	cin => \c1|LessThan7~1_cout\,
	cout => \c1|LessThan7~3_cout\);

-- Location: LCCOMB_X34_Y15_N6
\c1|LessThan7~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan7~5_cout\ = CARRY((\c1|sq_y2\(2) & ((!\c1|LessThan7~3_cout\) # (!\c1|vpos\(2)))) # (!\c1|sq_y2\(2) & (!\c1|vpos\(2) & !\c1|LessThan7~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|sq_y2\(2),
	datab => \c1|vpos\(2),
	datad => VCC,
	cin => \c1|LessThan7~3_cout\,
	cout => \c1|LessThan7~5_cout\);

-- Location: LCCOMB_X34_Y15_N8
\c1|LessThan7~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan7~7_cout\ = CARRY((\c1|Add3~0_combout\ & (\c1|vpos\(3) & !\c1|LessThan7~5_cout\)) # (!\c1|Add3~0_combout\ & ((\c1|vpos\(3)) # (!\c1|LessThan7~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|Add3~0_combout\,
	datab => \c1|vpos\(3),
	datad => VCC,
	cin => \c1|LessThan7~5_cout\,
	cout => \c1|LessThan7~7_cout\);

-- Location: LCCOMB_X34_Y15_N10
\c1|LessThan7~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan7~9_cout\ = CARRY((\c1|vpos\(4) & (\c1|Add3~2_combout\ & !\c1|LessThan7~7_cout\)) # (!\c1|vpos\(4) & ((\c1|Add3~2_combout\) # (!\c1|LessThan7~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(4),
	datab => \c1|Add3~2_combout\,
	datad => VCC,
	cin => \c1|LessThan7~7_cout\,
	cout => \c1|LessThan7~9_cout\);

-- Location: LCCOMB_X34_Y15_N12
\c1|LessThan7~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan7~11_cout\ = CARRY((\c1|Add3~4_combout\ & (\c1|vpos\(5) & !\c1|LessThan7~9_cout\)) # (!\c1|Add3~4_combout\ & ((\c1|vpos\(5)) # (!\c1|LessThan7~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|Add3~4_combout\,
	datab => \c1|vpos\(5),
	datad => VCC,
	cin => \c1|LessThan7~9_cout\,
	cout => \c1|LessThan7~11_cout\);

-- Location: LCCOMB_X34_Y15_N14
\c1|LessThan7~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan7~13_cout\ = CARRY((\c1|Add3~6_combout\ & ((!\c1|LessThan7~11_cout\) # (!\c1|vpos\(6)))) # (!\c1|Add3~6_combout\ & (!\c1|vpos\(6) & !\c1|LessThan7~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|Add3~6_combout\,
	datab => \c1|vpos\(6),
	datad => VCC,
	cin => \c1|LessThan7~11_cout\,
	cout => \c1|LessThan7~13_cout\);

-- Location: LCCOMB_X34_Y15_N16
\c1|LessThan7~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan7~15_cout\ = CARRY((\c1|vpos\(7) & ((!\c1|LessThan7~13_cout\) # (!\c1|Add3~8_combout\))) # (!\c1|vpos\(7) & (!\c1|Add3~8_combout\ & !\c1|LessThan7~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(7),
	datab => \c1|Add3~8_combout\,
	datad => VCC,
	cin => \c1|LessThan7~13_cout\,
	cout => \c1|LessThan7~15_cout\);

-- Location: LCCOMB_X34_Y15_N18
\c1|LessThan7~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan7~17_cout\ = CARRY((\c1|vpos\(8) & (\c1|Add3~10_combout\ & !\c1|LessThan7~15_cout\)) # (!\c1|vpos\(8) & ((\c1|Add3~10_combout\) # (!\c1|LessThan7~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(8),
	datab => \c1|Add3~10_combout\,
	datad => VCC,
	cin => \c1|LessThan7~15_cout\,
	cout => \c1|LessThan7~17_cout\);

-- Location: LCCOMB_X34_Y15_N20
\c1|LessThan7~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan7~19_cout\ = CARRY((\c1|vpos\(9) & ((!\c1|LessThan7~17_cout\) # (!\c1|Add3~12_combout\))) # (!\c1|vpos\(9) & (!\c1|Add3~12_combout\ & !\c1|LessThan7~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \c1|vpos\(9),
	datab => \c1|Add3~12_combout\,
	datad => VCC,
	cin => \c1|LessThan7~17_cout\,
	cout => \c1|LessThan7~19_cout\);

-- Location: LCCOMB_X34_Y15_N22
\c1|LessThan7~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|LessThan7~20_combout\ = (\c1|vpos\(10) & (!\c1|LessThan7~19_cout\ & \c1|Add3~14_combout\)) # (!\c1|vpos\(10) & ((\c1|Add3~14_combout\) # (!\c1|LessThan7~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \c1|vpos\(10),
	datad => \c1|Add3~14_combout\,
	cin => \c1|LessThan7~19_cout\,
	combout => \c1|LessThan7~20_combout\);

-- Location: LCCOMB_X33_Y14_N22
\c1|draw2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|draw2~0_combout\ = (\c1|LessThan5~20_combout\ & (((\c1|Add3~16_combout\) # (\c1|LessThan7~20_combout\)))) # (!\c1|LessThan5~20_combout\ & (\c1|Add2~16_combout\ & ((\c1|Add3~16_combout\) # (\c1|LessThan7~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|LessThan5~20_combout\,
	datab => \c1|Add2~16_combout\,
	datac => \c1|Add3~16_combout\,
	datad => \c1|LessThan7~20_combout\,
	combout => \c1|draw2~0_combout\);

-- Location: LCCOMB_X33_Y14_N12
\c1|r~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|r~0_combout\ = (\c1|draw1~0_combout\ & ((\c1|draw1~1_combout\) # ((\c1|draw2~1_combout\ & \c1|draw2~0_combout\)))) # (!\c1|draw1~0_combout\ & (((\c1|draw2~1_combout\ & \c1|draw2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|draw1~0_combout\,
	datab => \c1|draw1~1_combout\,
	datac => \c1|draw2~1_combout\,
	datad => \c1|draw2~0_combout\,
	combout => \c1|r~0_combout\);

-- Location: LCCOMB_X33_Y14_N0
\c1|r~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|r~1_combout\ = (\c1|b~2_combout\ & \c1|r~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \c1|b~2_combout\,
	datad => \c1|r~0_combout\,
	combout => \c1|r~1_combout\);

-- Location: LCFF_X33_Y14_N1
\c1|r[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|r~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|r\(0));

-- Location: LCCOMB_X33_Y14_N28
\c1|b~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|b~3_combout\ = (\c1|draw1~0_combout\ & (\c1|draw1~1_combout\ & ((!\c1|draw2~0_combout\) # (!\c1|draw2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|draw1~0_combout\,
	datab => \c1|draw1~1_combout\,
	datac => \c1|draw2~1_combout\,
	datad => \c1|draw2~0_combout\,
	combout => \c1|b~3_combout\);

-- Location: LCCOMB_X33_Y14_N30
\c1|b~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|b~5_combout\ = (!\sw~combout\(1) & (\c1|draw2~0_combout\ & (\c1|LessThan4~20_combout\ & \c1|LessThan6~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(1),
	datab => \c1|draw2~0_combout\,
	datac => \c1|LessThan4~20_combout\,
	datad => \c1|LessThan6~20_combout\,
	combout => \c1|b~5_combout\);

-- Location: LCCOMB_X33_Y14_N10
\c1|b~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \c1|b~4_combout\ = (\c1|b~2_combout\ & ((\c1|b~5_combout\) # ((\c1|b~3_combout\ & !\sw~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|b~2_combout\,
	datab => \c1|b~3_combout\,
	datac => \sw~combout\(0),
	datad => \c1|b~5_combout\,
	combout => \c1|b~4_combout\);

-- Location: LCFF_X33_Y14_N11
\c1|b[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \c2|altpll_0|sd1|_clk0~clkctrl_outclk\,
	datain => \c1|b~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \c1|b\(0));

-- Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clock_24[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clock_24(1));

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_h~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|hsync~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_h);

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_v~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|vsync~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_v);

-- Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_r[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|r\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_r(0));

-- Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_r[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|r\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_r(1));

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_r[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|r\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_r(2));

-- Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_r[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|r\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_r(3));

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_g[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|b\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_g(0));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_g[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|b\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_g(1));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_g[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|b\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_g(2));

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_g[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|b\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_g(3));

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_b[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|b\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_b(0));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_b[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|b\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_b(1));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_b[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|b\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_b(2));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vga_b[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \c1|b\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vga_b(3));
END structure;



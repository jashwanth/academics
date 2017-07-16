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

-- DATE "03/13/2013 16:56:07"

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

ENTITY 	addersubtractor2 IS
    PORT (
	A : IN std_logic_vector(15 DOWNTO 0);
	B : IN std_logic_vector(15 DOWNTO 0);
	Clock : IN std_logic;
	Reset : IN std_logic;
	Sel : IN std_logic;
	AddSub : IN std_logic;
	Z : BUFFER std_logic_vector(15 DOWNTO 0);
	Overflow : OUT std_logic
	);
END addersubtractor2;

-- Design Ports Information
-- Z[0]	=>  Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[1]	=>  Location: PIN_P5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[2]	=>  Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[3]	=>  Location: PIN_N4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[4]	=>  Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[5]	=>  Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[6]	=>  Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[7]	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[8]	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[9]	=>  Location: PIN_N6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[10]	=>  Location: PIN_U2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[11]	=>  Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[12]	=>  Location: PIN_R1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[13]	=>  Location: PIN_T1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[14]	=>  Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z[15]	=>  Location: PIN_R2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Overflow	=>  Location: PIN_W4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Clock	=>  Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Reset	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[0]	=>  Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Sel	=>  Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[0]	=>  Location: PIN_Y6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- AddSub	=>  Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[1]	=>  Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[1]	=>  Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[2]	=>  Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[2]	=>  Location: PIN_W5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[3]	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[3]	=>  Location: PIN_AB5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[4]	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[4]	=>  Location: PIN_V4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[5]	=>  Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[5]	=>  Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[6]	=>  Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[6]	=>  Location: PIN_T5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[7]	=>  Location: PIN_AA3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[7]	=>  Location: PIN_AB3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[8]	=>  Location: PIN_AA4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[8]	=>  Location: PIN_W3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[9]	=>  Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[9]	=>  Location: PIN_Y5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[10]	=>  Location: PIN_Y3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[10]	=>  Location: PIN_W2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[11]	=>  Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[11]	=>  Location: PIN_AA5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[12]	=>  Location: PIN_AB4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[12]	=>  Location: PIN_Y4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[13]	=>  Location: PIN_W1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[13]	=>  Location: PIN_M6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[14]	=>  Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[14]	=>  Location: PIN_Y1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[15]	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[15]	=>  Location: PIN_M5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF addersubtractor2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Clock : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_Sel : std_logic;
SIGNAL ww_AddSub : std_logic;
SIGNAL ww_Z : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Overflow : std_logic;
SIGNAL \Clock~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Reset~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~0_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~1_combout\ : std_logic;
SIGNAL \multiplexer|F[2]~2_combout\ : std_logic;
SIGNAL \multiplexer|F[3]~3_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~4_combout\ : std_logic;
SIGNAL \multiplexer|F[5]~5_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~6_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~7_combout\ : std_logic;
SIGNAL \multiplexer|F[8]~8_combout\ : std_logic;
SIGNAL \multiplexer|F[9]~9_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~10_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~11_combout\ : std_logic;
SIGNAL \multiplexer|F[12]~12_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~13_combout\ : std_logic;
SIGNAL \multiplexer|F[14]~14_combout\ : std_logic;
SIGNAL \Clock~combout\ : std_logic;
SIGNAL \Clock~clkctrl_outclk\ : std_logic;
SIGNAL \Reset~combout\ : std_logic;
SIGNAL \Reset~clkctrl_outclk\ : std_logic;
SIGNAL \Sel~combout\ : std_logic;
SIGNAL \SelR~feeder_combout\ : std_logic;
SIGNAL \SelR~regout\ : std_logic;
SIGNAL \multiplexer|F[0]~0_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[0]~1_cout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[1]~2_combout\ : std_logic;
SIGNAL \multiplexer|F[1]~1_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[1]~3\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~4_combout\ : std_logic;
SIGNAL \AddSub~combout\ : std_logic;
SIGNAL \AddSubR~0_combout\ : std_logic;
SIGNAL \AddSubR~regout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~2_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~5\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[3]~6_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~3_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[3]~7\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~8_combout\ : std_logic;
SIGNAL \multiplexer|F[4]~4_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~9\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[5]~10_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~5_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[5]~11\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~12_combout\ : std_logic;
SIGNAL \multiplexer|F[6]~6_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~13\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[7]~14_combout\ : std_logic;
SIGNAL \multiplexer|F[7]~7_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[7]~15\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~16_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~8_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~17\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[9]~18_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~9_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[9]~19\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~20_combout\ : std_logic;
SIGNAL \multiplexer|F[10]~10_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~21\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[11]~22_combout\ : std_logic;
SIGNAL \multiplexer|F[11]~11_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[11]~23\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~24_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~12_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~25\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[13]~26_combout\ : std_logic;
SIGNAL \multiplexer|F[13]~13_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[13]~27\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~28_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~14_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~29\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[15]~30_combout\ : std_logic;
SIGNAL \multiplexer|F[15]~15_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|_~15_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[15]~31\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[16]~32_combout\ : std_logic;
SIGNAL \nbit_addsub|lpm_add_sub_component|auto_generated|overflow~combout\ : std_logic;
SIGNAL \Overflow~reg0_regout\ : std_logic;
SIGNAL Zreg : std_logic_vector(15 DOWNTO 0);
SIGNAL Breg : std_logic_vector(15 DOWNTO 0);
SIGNAL Areg : std_logic_vector(15 DOWNTO 0);
SIGNAL \B~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \A~combout\ : std_logic_vector(15 DOWNTO 0);

BEGIN

ww_A <= A;
ww_B <= B;
ww_Clock <= Clock;
ww_Reset <= Reset;
ww_Sel <= Sel;
ww_AddSub <= AddSub;
Z <= ww_Z;
Overflow <= ww_Overflow;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Clock~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \Clock~combout\);

\Reset~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \Reset~combout\);

-- Location: LCFF_X2_Y9_N5
\Breg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(0),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(0));

-- Location: LCCOMB_X2_Y9_N4
\nbit_addsub|lpm_add_sub_component|auto_generated|_~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~0_combout\ = Breg(0) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(0),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~0_combout\);

-- Location: LCFF_X2_Y9_N17
\Breg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(1),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(1));

-- Location: LCCOMB_X2_Y9_N16
\nbit_addsub|lpm_add_sub_component|auto_generated|_~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~1_combout\ = Breg(1) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(1),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~1_combout\);

-- Location: LCFF_X1_Y9_N11
\Areg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(2),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(2));

-- Location: LCCOMB_X1_Y9_N10
\multiplexer|F[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[2]~2_combout\ = (\SelR~regout\ & ((Zreg(2)))) # (!\SelR~regout\ & (Areg(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SelR~regout\,
	datac => Areg(2),
	datad => Zreg(2),
	combout => \multiplexer|F[2]~2_combout\);

-- Location: LCFF_X1_Y9_N13
\Areg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(3),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(3));

-- Location: LCCOMB_X1_Y9_N12
\multiplexer|F[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[3]~3_combout\ = (\SelR~regout\ & (Zreg(3))) # (!\SelR~regout\ & ((Areg(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zreg(3),
	datac => Areg(3),
	datad => \SelR~regout\,
	combout => \multiplexer|F[3]~3_combout\);

-- Location: LCFF_X2_Y9_N27
\Breg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(4),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(4));

-- Location: LCCOMB_X2_Y9_N26
\nbit_addsub|lpm_add_sub_component|auto_generated|_~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~4_combout\ = Breg(4) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(4),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~4_combout\);

-- Location: LCFF_X1_Y9_N5
\Areg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(5),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(5));

-- Location: LCCOMB_X1_Y9_N4
\multiplexer|F[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[5]~5_combout\ = (\SelR~regout\ & (Zreg(5))) # (!\SelR~regout\ & ((Areg(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zreg(5),
	datac => Areg(5),
	datad => \SelR~regout\,
	combout => \multiplexer|F[5]~5_combout\);

-- Location: LCFF_X2_Y9_N7
\Breg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(6),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(6));

-- Location: LCCOMB_X2_Y9_N6
\nbit_addsub|lpm_add_sub_component|auto_generated|_~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~6_combout\ = Breg(6) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(6),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~6_combout\);

-- Location: LCFF_X1_Y8_N31
\Breg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(7),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(7));

-- Location: LCCOMB_X1_Y8_N30
\nbit_addsub|lpm_add_sub_component|auto_generated|_~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~7_combout\ = Breg(7) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(7),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~7_combout\);

-- Location: LCFF_X1_Y8_N21
\Areg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(8),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(8));

-- Location: LCCOMB_X1_Y8_N20
\multiplexer|F[8]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[8]~8_combout\ = (\SelR~regout\ & (Zreg(8))) # (!\SelR~regout\ & ((Areg(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zreg(8),
	datac => Areg(8),
	datad => \SelR~regout\,
	combout => \multiplexer|F[8]~8_combout\);

-- Location: LCFF_X1_Y8_N25
\Areg[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(9),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(9));

-- Location: LCCOMB_X1_Y8_N24
\multiplexer|F[9]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[9]~9_combout\ = (\SelR~regout\ & (Zreg(9))) # (!\SelR~regout\ & ((Areg(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zreg(9),
	datac => Areg(9),
	datad => \SelR~regout\,
	combout => \multiplexer|F[9]~9_combout\);

-- Location: LCFF_X2_Y8_N3
\Breg[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(10),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(10));

-- Location: LCCOMB_X2_Y8_N2
\nbit_addsub|lpm_add_sub_component|auto_generated|_~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~10_combout\ = Breg(10) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(10),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~10_combout\);

-- Location: LCFF_X2_Y8_N27
\Breg[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(11),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(11));

-- Location: LCCOMB_X2_Y8_N26
\nbit_addsub|lpm_add_sub_component|auto_generated|_~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~11_combout\ = Breg(11) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(11),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~11_combout\);

-- Location: LCFF_X2_Y8_N5
\Areg[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(12),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(12));

-- Location: LCCOMB_X2_Y8_N4
\multiplexer|F[12]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[12]~12_combout\ = (\SelR~regout\ & (Zreg(12))) # (!\SelR~regout\ & ((Areg(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zreg(12),
	datac => Areg(12),
	datad => \SelR~regout\,
	combout => \multiplexer|F[12]~12_combout\);

-- Location: LCFF_X2_Y8_N7
\Breg[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(13),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(13));

-- Location: LCCOMB_X2_Y8_N6
\nbit_addsub|lpm_add_sub_component|auto_generated|_~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~13_combout\ = Breg(13) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(13),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~13_combout\);

-- Location: LCFF_X2_Y8_N17
\Areg[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(14),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(14));

-- Location: LCCOMB_X2_Y8_N16
\multiplexer|F[14]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[14]~14_combout\ = (\SelR~regout\ & (Zreg(14))) # (!\SelR~regout\ & ((Areg(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zreg(14),
	datac => Areg(14),
	datad => \SelR~regout\,
	combout => \multiplexer|F[14]~14_combout\);

-- Location: PIN_Y6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[0]~I\ : cycloneii_io
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
	padio => ww_B(0),
	combout => \B~combout\(0));

-- Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[1]~I\ : cycloneii_io
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
	padio => ww_B(1),
	combout => \B~combout\(1));

-- Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[2]~I\ : cycloneii_io
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
	padio => ww_A(2),
	combout => \A~combout\(2));

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[3]~I\ : cycloneii_io
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
	padio => ww_A(3),
	combout => \A~combout\(3));

-- Location: PIN_V4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[4]~I\ : cycloneii_io
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
	padio => ww_B(4),
	combout => \B~combout\(4));

-- Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[5]~I\ : cycloneii_io
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
	padio => ww_A(5),
	combout => \A~combout\(5));

-- Location: PIN_T5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[6]~I\ : cycloneii_io
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
	padio => ww_B(6),
	combout => \B~combout\(6));

-- Location: PIN_AB3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[7]~I\ : cycloneii_io
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
	padio => ww_B(7),
	combout => \B~combout\(7));

-- Location: PIN_AA4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[8]~I\ : cycloneii_io
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
	padio => ww_A(8),
	combout => \A~combout\(8));

-- Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[9]~I\ : cycloneii_io
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
	padio => ww_A(9),
	combout => \A~combout\(9));

-- Location: PIN_W2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[10]~I\ : cycloneii_io
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
	padio => ww_B(10),
	combout => \B~combout\(10));

-- Location: PIN_AA5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[11]~I\ : cycloneii_io
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
	padio => ww_B(11),
	combout => \B~combout\(11));

-- Location: PIN_AB4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[12]~I\ : cycloneii_io
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
	padio => ww_A(12),
	combout => \A~combout\(12));

-- Location: PIN_M6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[13]~I\ : cycloneii_io
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
	padio => ww_B(13),
	combout => \B~combout\(13));

-- Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[14]~I\ : cycloneii_io
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
	padio => ww_A(14),
	combout => \A~combout\(14));

-- Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Clock~I\ : cycloneii_io
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
	padio => ww_Clock,
	combout => \Clock~combout\);

-- Location: CLKCTRL_G3
\Clock~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clock~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clock~clkctrl_outclk\);

-- Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[0]~I\ : cycloneii_io
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
	padio => ww_A(0),
	combout => \A~combout\(0));

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Reset~I\ : cycloneii_io
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
	padio => ww_Reset,
	combout => \Reset~combout\);

-- Location: CLKCTRL_G1
\Reset~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Reset~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Reset~clkctrl_outclk\);

-- Location: LCFF_X1_Y9_N1
\Areg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(0),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(0));

-- Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Sel~I\ : cycloneii_io
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
	padio => ww_Sel,
	combout => \Sel~combout\);

-- Location: LCCOMB_X1_Y9_N6
\SelR~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \SelR~feeder_combout\ = \Sel~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Sel~combout\,
	combout => \SelR~feeder_combout\);

-- Location: LCFF_X1_Y9_N7
SelR : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \SelR~feeder_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \SelR~regout\);

-- Location: LCCOMB_X1_Y9_N0
\multiplexer|F[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[0]~0_combout\ = (\SelR~regout\ & (Zreg(0))) # (!\SelR~regout\ & ((Areg(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zreg(0),
	datac => Areg(0),
	datad => \SelR~regout\,
	combout => \multiplexer|F[0]~0_combout\);

-- Location: LCCOMB_X1_Y9_N16
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[0]~1_cout\ = CARRY(!\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AddSubR~regout\,
	datad => VCC,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[0]~1_cout\);

-- Location: LCCOMB_X1_Y9_N18
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[1]~2_combout\ = (\nbit_addsub|lpm_add_sub_component|auto_generated|_~0_combout\ & ((\multiplexer|F[0]~0_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[0]~1_cout\)) # 
-- (!\multiplexer|F[0]~0_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[0]~1_cout\) # (GND))))) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~0_combout\ & ((\multiplexer|F[0]~0_combout\ & 
-- (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[0]~1_cout\ & VCC)) # (!\multiplexer|F[0]~0_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[0]~1_cout\))))
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[1]~3\ = CARRY((\nbit_addsub|lpm_add_sub_component|auto_generated|_~0_combout\ & ((!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[0]~1_cout\) # (!\multiplexer|F[0]~0_combout\))) # 
-- (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~0_combout\ & (!\multiplexer|F[0]~0_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[0]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \nbit_addsub|lpm_add_sub_component|auto_generated|_~0_combout\,
	datab => \multiplexer|F[0]~0_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[0]~1_cout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[1]~2_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[1]~3\);

-- Location: LCFF_X1_Y9_N19
\Zreg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[1]~2_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(0));

-- Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[1]~I\ : cycloneii_io
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
	padio => ww_A(1),
	combout => \A~combout\(1));

-- Location: LCFF_X1_Y9_N9
\Areg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(1),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(1));

-- Location: LCCOMB_X1_Y9_N8
\multiplexer|F[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[1]~1_combout\ = (\SelR~regout\ & (Zreg(1))) # (!\SelR~regout\ & ((Areg(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zreg(1),
	datac => Areg(1),
	datad => \SelR~regout\,
	combout => \multiplexer|F[1]~1_combout\);

-- Location: LCCOMB_X1_Y9_N20
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~4_combout\ = ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~1_combout\ $ (\multiplexer|F[1]~1_combout\ $ (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[1]~3\)))) # (GND)
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~5\ = CARRY((\nbit_addsub|lpm_add_sub_component|auto_generated|_~1_combout\ & (\multiplexer|F[1]~1_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[1]~3\)) # 
-- (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~1_combout\ & ((\multiplexer|F[1]~1_combout\) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[1]~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \nbit_addsub|lpm_add_sub_component|auto_generated|_~1_combout\,
	datab => \multiplexer|F[1]~1_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[1]~3\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~4_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~5\);

-- Location: LCFF_X1_Y9_N21
\Zreg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~4_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(1));

-- Location: PIN_W5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[2]~I\ : cycloneii_io
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
	padio => ww_B(2),
	combout => \B~combout\(2));

-- Location: LCFF_X2_Y9_N31
\Breg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(2),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(2));

-- Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\AddSub~I\ : cycloneii_io
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
	padio => ww_AddSub,
	combout => \AddSub~combout\);

-- Location: LCCOMB_X2_Y9_N22
\AddSubR~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \AddSubR~0_combout\ = !\AddSub~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \AddSub~combout\,
	combout => \AddSubR~0_combout\);

-- Location: LCFF_X2_Y9_N23
AddSubR : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \AddSubR~0_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \AddSubR~regout\);

-- Location: LCCOMB_X2_Y9_N30
\nbit_addsub|lpm_add_sub_component|auto_generated|_~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~2_combout\ = Breg(2) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(2),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~2_combout\);

-- Location: LCCOMB_X1_Y9_N22
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[3]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[3]~6_combout\ = (\multiplexer|F[2]~2_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~2_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~5\)) # 
-- (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~2_combout\ & (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~5\ & VCC)))) # (!\multiplexer|F[2]~2_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~2_combout\ & 
-- ((\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~5\) # (GND))) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~2_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~5\))))
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[3]~7\ = CARRY((\multiplexer|F[2]~2_combout\ & (\nbit_addsub|lpm_add_sub_component|auto_generated|_~2_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~5\)) # 
-- (!\multiplexer|F[2]~2_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~2_combout\) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \multiplexer|F[2]~2_combout\,
	datab => \nbit_addsub|lpm_add_sub_component|auto_generated|_~2_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[2]~5\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[3]~6_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[3]~7\);

-- Location: LCFF_X1_Y9_N23
\Zreg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[3]~6_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(2));

-- Location: PIN_AB5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[3]~I\ : cycloneii_io
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
	padio => ww_B(3),
	combout => \B~combout\(3));

-- Location: LCFF_X2_Y9_N25
\Breg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(3),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(3));

-- Location: LCCOMB_X2_Y9_N24
\nbit_addsub|lpm_add_sub_component|auto_generated|_~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~3_combout\ = Breg(3) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(3),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~3_combout\);

-- Location: LCCOMB_X1_Y9_N24
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~8_combout\ = ((\multiplexer|F[3]~3_combout\ $ (\nbit_addsub|lpm_add_sub_component|auto_generated|_~3_combout\ $ (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[3]~7\)))) # (GND)
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~9\ = CARRY((\multiplexer|F[3]~3_combout\ & ((!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[3]~7\) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~3_combout\))) # 
-- (!\multiplexer|F[3]~3_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~3_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \multiplexer|F[3]~3_combout\,
	datab => \nbit_addsub|lpm_add_sub_component|auto_generated|_~3_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[3]~7\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~8_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~9\);

-- Location: LCFF_X1_Y9_N25
\Zreg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~8_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(3));

-- Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[4]~I\ : cycloneii_io
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
	padio => ww_A(4),
	combout => \A~combout\(4));

-- Location: LCFF_X1_Y9_N3
\Areg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(4),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(4));

-- Location: LCCOMB_X1_Y9_N2
\multiplexer|F[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[4]~4_combout\ = (\SelR~regout\ & (Zreg(4))) # (!\SelR~regout\ & ((Areg(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zreg(4),
	datac => Areg(4),
	datad => \SelR~regout\,
	combout => \multiplexer|F[4]~4_combout\);

-- Location: LCCOMB_X1_Y9_N26
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[5]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[5]~10_combout\ = (\nbit_addsub|lpm_add_sub_component|auto_generated|_~4_combout\ & ((\multiplexer|F[4]~4_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~9\)) # 
-- (!\multiplexer|F[4]~4_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~9\) # (GND))))) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~4_combout\ & ((\multiplexer|F[4]~4_combout\ & 
-- (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~9\ & VCC)) # (!\multiplexer|F[4]~4_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~9\))))
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[5]~11\ = CARRY((\nbit_addsub|lpm_add_sub_component|auto_generated|_~4_combout\ & ((!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~9\) # (!\multiplexer|F[4]~4_combout\))) # 
-- (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~4_combout\ & (!\multiplexer|F[4]~4_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \nbit_addsub|lpm_add_sub_component|auto_generated|_~4_combout\,
	datab => \multiplexer|F[4]~4_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[4]~9\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[5]~10_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[5]~11\);

-- Location: LCFF_X1_Y9_N27
\Zreg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[5]~10_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(4));

-- Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[5]~I\ : cycloneii_io
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
	padio => ww_B(5),
	combout => \B~combout\(5));

-- Location: LCFF_X2_Y9_N21
\Breg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(5),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(5));

-- Location: LCCOMB_X2_Y9_N20
\nbit_addsub|lpm_add_sub_component|auto_generated|_~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~5_combout\ = Breg(5) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(5),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~5_combout\);

-- Location: LCCOMB_X1_Y9_N28
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~12_combout\ = ((\multiplexer|F[5]~5_combout\ $ (\nbit_addsub|lpm_add_sub_component|auto_generated|_~5_combout\ $ (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[5]~11\)))) # 
-- (GND)
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~13\ = CARRY((\multiplexer|F[5]~5_combout\ & ((!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[5]~11\) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~5_combout\))) # 
-- (!\multiplexer|F[5]~5_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~5_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \multiplexer|F[5]~5_combout\,
	datab => \nbit_addsub|lpm_add_sub_component|auto_generated|_~5_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[5]~11\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~12_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~13\);

-- Location: LCFF_X1_Y9_N29
\Zreg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~12_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(5));

-- Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[6]~I\ : cycloneii_io
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
	padio => ww_A(6),
	combout => \A~combout\(6));

-- Location: LCFF_X1_Y9_N15
\Areg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(6),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(6));

-- Location: LCCOMB_X1_Y9_N14
\multiplexer|F[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[6]~6_combout\ = (\SelR~regout\ & (Zreg(6))) # (!\SelR~regout\ & ((Areg(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zreg(6),
	datac => Areg(6),
	datad => \SelR~regout\,
	combout => \multiplexer|F[6]~6_combout\);

-- Location: LCCOMB_X1_Y9_N30
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[7]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[7]~14_combout\ = (\nbit_addsub|lpm_add_sub_component|auto_generated|_~6_combout\ & ((\multiplexer|F[6]~6_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~13\)) # 
-- (!\multiplexer|F[6]~6_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~13\) # (GND))))) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~6_combout\ & ((\multiplexer|F[6]~6_combout\ & 
-- (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~13\ & VCC)) # (!\multiplexer|F[6]~6_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~13\))))
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[7]~15\ = CARRY((\nbit_addsub|lpm_add_sub_component|auto_generated|_~6_combout\ & ((!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~13\) # (!\multiplexer|F[6]~6_combout\))) # 
-- (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~6_combout\ & (!\multiplexer|F[6]~6_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \nbit_addsub|lpm_add_sub_component|auto_generated|_~6_combout\,
	datab => \multiplexer|F[6]~6_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[6]~13\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[7]~14_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[7]~15\);

-- Location: LCFF_X1_Y9_N31
\Zreg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[7]~14_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(6));

-- Location: PIN_AA3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[7]~I\ : cycloneii_io
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
	padio => ww_A(7),
	combout => \A~combout\(7));

-- Location: LCFF_X1_Y8_N29
\Areg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(7),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(7));

-- Location: LCCOMB_X1_Y8_N28
\multiplexer|F[7]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[7]~7_combout\ = (\SelR~regout\ & (Zreg(7))) # (!\SelR~regout\ & ((Areg(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zreg(7),
	datac => Areg(7),
	datad => \SelR~regout\,
	combout => \multiplexer|F[7]~7_combout\);

-- Location: LCCOMB_X1_Y8_N0
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~16_combout\ = ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~7_combout\ $ (\multiplexer|F[7]~7_combout\ $ (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[7]~15\)))) # 
-- (GND)
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~17\ = CARRY((\nbit_addsub|lpm_add_sub_component|auto_generated|_~7_combout\ & (\multiplexer|F[7]~7_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[7]~15\)) # 
-- (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~7_combout\ & ((\multiplexer|F[7]~7_combout\) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[7]~15\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \nbit_addsub|lpm_add_sub_component|auto_generated|_~7_combout\,
	datab => \multiplexer|F[7]~7_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[7]~15\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~16_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~17\);

-- Location: LCFF_X1_Y8_N1
\Zreg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~16_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(7));

-- Location: PIN_W3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[8]~I\ : cycloneii_io
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
	padio => ww_B(8),
	combout => \B~combout\(8));

-- Location: LCFF_X1_Y8_N19
\Breg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(8),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(8));

-- Location: LCCOMB_X1_Y8_N18
\nbit_addsub|lpm_add_sub_component|auto_generated|_~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~8_combout\ = Breg(8) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(8),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~8_combout\);

-- Location: LCCOMB_X1_Y8_N2
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[9]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[9]~18_combout\ = (\multiplexer|F[8]~8_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~8_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~17\)) # 
-- (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~8_combout\ & (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~17\ & VCC)))) # (!\multiplexer|F[8]~8_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~8_combout\ & 
-- ((\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~17\) # (GND))) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~8_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~17\))))
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[9]~19\ = CARRY((\multiplexer|F[8]~8_combout\ & (\nbit_addsub|lpm_add_sub_component|auto_generated|_~8_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~17\)) # 
-- (!\multiplexer|F[8]~8_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~8_combout\) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \multiplexer|F[8]~8_combout\,
	datab => \nbit_addsub|lpm_add_sub_component|auto_generated|_~8_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[8]~17\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[9]~18_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[9]~19\);

-- Location: LCFF_X1_Y8_N3
\Zreg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[9]~18_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(8));

-- Location: PIN_Y5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[9]~I\ : cycloneii_io
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
	padio => ww_B(9),
	combout => \B~combout\(9));

-- Location: LCFF_X2_Y8_N29
\Breg[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(9),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(9));

-- Location: LCCOMB_X2_Y8_N28
\nbit_addsub|lpm_add_sub_component|auto_generated|_~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~9_combout\ = Breg(9) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(9),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~9_combout\);

-- Location: LCCOMB_X1_Y8_N4
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~20_combout\ = ((\multiplexer|F[9]~9_combout\ $ (\nbit_addsub|lpm_add_sub_component|auto_generated|_~9_combout\ $ (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[9]~19\)))) # 
-- (GND)
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~21\ = CARRY((\multiplexer|F[9]~9_combout\ & ((!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[9]~19\) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~9_combout\))) # 
-- (!\multiplexer|F[9]~9_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~9_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[9]~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \multiplexer|F[9]~9_combout\,
	datab => \nbit_addsub|lpm_add_sub_component|auto_generated|_~9_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[9]~19\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~20_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~21\);

-- Location: LCFF_X1_Y8_N5
\Zreg[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~20_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(9));

-- Location: PIN_Y3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[10]~I\ : cycloneii_io
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
	padio => ww_A(10),
	combout => \A~combout\(10));

-- Location: LCFF_X1_Y8_N23
\Areg[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(10),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(10));

-- Location: LCCOMB_X1_Y8_N22
\multiplexer|F[10]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[10]~10_combout\ = (\SelR~regout\ & (Zreg(10))) # (!\SelR~regout\ & ((Areg(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zreg(10),
	datac => Areg(10),
	datad => \SelR~regout\,
	combout => \multiplexer|F[10]~10_combout\);

-- Location: LCCOMB_X1_Y8_N6
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[11]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[11]~22_combout\ = (\nbit_addsub|lpm_add_sub_component|auto_generated|_~10_combout\ & ((\multiplexer|F[10]~10_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~21\)) # 
-- (!\multiplexer|F[10]~10_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~21\) # (GND))))) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~10_combout\ & ((\multiplexer|F[10]~10_combout\ & 
-- (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~21\ & VCC)) # (!\multiplexer|F[10]~10_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~21\))))
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[11]~23\ = CARRY((\nbit_addsub|lpm_add_sub_component|auto_generated|_~10_combout\ & ((!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~21\) # (!\multiplexer|F[10]~10_combout\))) 
-- # (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~10_combout\ & (!\multiplexer|F[10]~10_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \nbit_addsub|lpm_add_sub_component|auto_generated|_~10_combout\,
	datab => \multiplexer|F[10]~10_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[10]~21\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[11]~22_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[11]~23\);

-- Location: LCFF_X1_Y8_N7
\Zreg[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[11]~22_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(10));

-- Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[11]~I\ : cycloneii_io
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
	padio => ww_A(11),
	combout => \A~combout\(11));

-- Location: LCFF_X2_Y8_N13
\Areg[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(11),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(11));

-- Location: LCCOMB_X2_Y8_N12
\multiplexer|F[11]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[11]~11_combout\ = (\SelR~regout\ & (Zreg(11))) # (!\SelR~regout\ & ((Areg(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zreg(11),
	datac => Areg(11),
	datad => \SelR~regout\,
	combout => \multiplexer|F[11]~11_combout\);

-- Location: LCCOMB_X1_Y8_N8
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~24_combout\ = ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~11_combout\ $ (\multiplexer|F[11]~11_combout\ $ (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[11]~23\)))) 
-- # (GND)
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~25\ = CARRY((\nbit_addsub|lpm_add_sub_component|auto_generated|_~11_combout\ & (\multiplexer|F[11]~11_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[11]~23\)) # 
-- (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~11_combout\ & ((\multiplexer|F[11]~11_combout\) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[11]~23\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \nbit_addsub|lpm_add_sub_component|auto_generated|_~11_combout\,
	datab => \multiplexer|F[11]~11_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[11]~23\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~24_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~25\);

-- Location: LCFF_X1_Y8_N9
\Zreg[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~24_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(11));

-- Location: PIN_Y4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[12]~I\ : cycloneii_io
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
	padio => ww_B(12),
	combout => \B~combout\(12));

-- Location: LCFF_X2_Y8_N11
\Breg[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(12),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(12));

-- Location: LCCOMB_X2_Y8_N10
\nbit_addsub|lpm_add_sub_component|auto_generated|_~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~12_combout\ = Breg(12) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(12),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~12_combout\);

-- Location: LCCOMB_X1_Y8_N10
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[13]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[13]~26_combout\ = (\multiplexer|F[12]~12_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~12_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~25\)) # 
-- (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~12_combout\ & (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~25\ & VCC)))) # (!\multiplexer|F[12]~12_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~12_combout\ & 
-- ((\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~25\) # (GND))) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~12_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~25\))))
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[13]~27\ = CARRY((\multiplexer|F[12]~12_combout\ & (\nbit_addsub|lpm_add_sub_component|auto_generated|_~12_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~25\)) # 
-- (!\multiplexer|F[12]~12_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~12_combout\) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~25\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \multiplexer|F[12]~12_combout\,
	datab => \nbit_addsub|lpm_add_sub_component|auto_generated|_~12_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[12]~25\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[13]~26_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[13]~27\);

-- Location: LCFF_X1_Y8_N11
\Zreg[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[13]~26_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(12));

-- Location: PIN_W1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[13]~I\ : cycloneii_io
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
	padio => ww_A(13),
	combout => \A~combout\(13));

-- Location: LCFF_X2_Y8_N25
\Areg[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(13),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(13));

-- Location: LCCOMB_X2_Y8_N24
\multiplexer|F[13]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[13]~13_combout\ = (\SelR~regout\ & (Zreg(13))) # (!\SelR~regout\ & ((Areg(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zreg(13),
	datac => Areg(13),
	datad => \SelR~regout\,
	combout => \multiplexer|F[13]~13_combout\);

-- Location: LCCOMB_X1_Y8_N12
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~28_combout\ = ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~13_combout\ $ (\multiplexer|F[13]~13_combout\ $ (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[13]~27\)))) 
-- # (GND)
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~29\ = CARRY((\nbit_addsub|lpm_add_sub_component|auto_generated|_~13_combout\ & (\multiplexer|F[13]~13_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[13]~27\)) # 
-- (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~13_combout\ & ((\multiplexer|F[13]~13_combout\) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[13]~27\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \nbit_addsub|lpm_add_sub_component|auto_generated|_~13_combout\,
	datab => \multiplexer|F[13]~13_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[13]~27\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~28_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~29\);

-- Location: LCFF_X1_Y8_N13
\Zreg[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~28_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(13));

-- Location: PIN_Y1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[14]~I\ : cycloneii_io
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
	padio => ww_B(14),
	combout => \B~combout\(14));

-- Location: LCFF_X2_Y8_N15
\Breg[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(14),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(14));

-- Location: LCCOMB_X2_Y8_N14
\nbit_addsub|lpm_add_sub_component|auto_generated|_~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~14_combout\ = Breg(14) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(14),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~14_combout\);

-- Location: LCCOMB_X1_Y8_N14
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[15]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[15]~30_combout\ = (\multiplexer|F[14]~14_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~14_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~29\)) # 
-- (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~14_combout\ & (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~29\ & VCC)))) # (!\multiplexer|F[14]~14_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~14_combout\ & 
-- ((\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~29\) # (GND))) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|_~14_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~29\))))
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[15]~31\ = CARRY((\multiplexer|F[14]~14_combout\ & (\nbit_addsub|lpm_add_sub_component|auto_generated|_~14_combout\ & !\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~29\)) # 
-- (!\multiplexer|F[14]~14_combout\ & ((\nbit_addsub|lpm_add_sub_component|auto_generated|_~14_combout\) # (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~29\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \multiplexer|F[14]~14_combout\,
	datab => \nbit_addsub|lpm_add_sub_component|auto_generated|_~14_combout\,
	datad => VCC,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[14]~29\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[15]~30_combout\,
	cout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[15]~31\);

-- Location: LCFF_X1_Y8_N15
\Zreg[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[15]~30_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(14));

-- Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[15]~I\ : cycloneii_io
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
	padio => ww_A(15),
	combout => \A~combout\(15));

-- Location: LCFF_X2_Y8_N9
\Areg[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \A~combout\(15),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Areg(15));

-- Location: LCCOMB_X2_Y8_N8
\multiplexer|F[15]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \multiplexer|F[15]~15_combout\ = (\SelR~regout\ & (Zreg(15))) # (!\SelR~regout\ & ((Areg(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zreg(15),
	datac => Areg(15),
	datad => \SelR~regout\,
	combout => \multiplexer|F[15]~15_combout\);

-- Location: PIN_M5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[15]~I\ : cycloneii_io
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
	padio => ww_B(15),
	combout => \B~combout\(15));

-- Location: LCFF_X2_Y8_N31
\Breg[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	sdata => \B~combout\(15),
	aclr => \Reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Breg(15));

-- Location: LCCOMB_X2_Y8_N30
\nbit_addsub|lpm_add_sub_component|auto_generated|_~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|_~15_combout\ = Breg(15) $ (\AddSubR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Breg(15),
	datad => \AddSubR~regout\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|_~15_combout\);

-- Location: LCCOMB_X1_Y8_N16
\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[16]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[16]~32_combout\ = \multiplexer|F[15]~15_combout\ $ (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[15]~31\ $ (\nbit_addsub|lpm_add_sub_component|auto_generated|_~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \multiplexer|F[15]~15_combout\,
	datad => \nbit_addsub|lpm_add_sub_component|auto_generated|_~15_combout\,
	cin => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[15]~31\,
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[16]~32_combout\);

-- Location: LCFF_X1_Y8_N17
\Zreg[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[16]~32_combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Zreg(15));

-- Location: LCCOMB_X1_Y8_N26
\nbit_addsub|lpm_add_sub_component|auto_generated|overflow\ : cycloneii_lcell_comb
-- Equation(s):
-- \nbit_addsub|lpm_add_sub_component|auto_generated|overflow~combout\ = (\multiplexer|F[15]~15_combout\ & (!\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[16]~32_combout\ & (\AddSubR~regout\ $ (!Breg(15))))) # (!\multiplexer|F[15]~15_combout\ 
-- & (\nbit_addsub|lpm_add_sub_component|auto_generated|result_int[16]~32_combout\ & (\AddSubR~regout\ $ (Breg(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100000100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AddSubR~regout\,
	datab => \multiplexer|F[15]~15_combout\,
	datac => \nbit_addsub|lpm_add_sub_component|auto_generated|result_int[16]~32_combout\,
	datad => Breg(15),
	combout => \nbit_addsub|lpm_add_sub_component|auto_generated|overflow~combout\);

-- Location: LCFF_X1_Y8_N27
\Overflow~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \nbit_addsub|lpm_add_sub_component|auto_generated|overflow~combout\,
	aclr => \Reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Overflow~reg0_regout\);

-- Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[0]~I\ : cycloneii_io
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
	datain => Zreg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(0));

-- Location: PIN_P5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[1]~I\ : cycloneii_io
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
	datain => Zreg(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(1));

-- Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[2]~I\ : cycloneii_io
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
	datain => Zreg(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(2));

-- Location: PIN_N4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[3]~I\ : cycloneii_io
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
	datain => Zreg(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(3));

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[4]~I\ : cycloneii_io
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
	datain => Zreg(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(4));

-- Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[5]~I\ : cycloneii_io
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
	datain => Zreg(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(5));

-- Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[6]~I\ : cycloneii_io
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
	datain => Zreg(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(6));

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[7]~I\ : cycloneii_io
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
	datain => Zreg(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(7));

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[8]~I\ : cycloneii_io
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
	datain => Zreg(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(8));

-- Location: PIN_N6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[9]~I\ : cycloneii_io
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
	datain => Zreg(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(9));

-- Location: PIN_U2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[10]~I\ : cycloneii_io
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
	datain => Zreg(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(10));

-- Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[11]~I\ : cycloneii_io
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
	datain => Zreg(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(11));

-- Location: PIN_R1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[12]~I\ : cycloneii_io
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
	datain => Zreg(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(12));

-- Location: PIN_T1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[13]~I\ : cycloneii_io
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
	datain => Zreg(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(13));

-- Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[14]~I\ : cycloneii_io
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
	datain => Zreg(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(14));

-- Location: PIN_R2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z[15]~I\ : cycloneii_io
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
	datain => Zreg(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z(15));

-- Location: PIN_W4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Overflow~I\ : cycloneii_io
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
	datain => \Overflow~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Overflow);
END structure;



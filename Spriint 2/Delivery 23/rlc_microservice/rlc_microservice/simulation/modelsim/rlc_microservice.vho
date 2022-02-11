-- Copyright (C) 1991-2013 Altera Corporation
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
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "02/09/2022 16:14:10"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
LIBRARY STD;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.STANDARD.ALL;

ENTITY 	rlc_microservice IS
    PORT (
	enable : IN std_logic;
	areset : IN std_logic;
	start : IN std_logic;
	clk : IN std_logic;
	reset_o : BUFFER STD.STANDARD.bit;
	load_o : BUFFER STD.STANDARD.bit;
	count_o : BUFFER STD.STANDARD.bit;
	error : BUFFER STD.STANDARD.bit;
	state : BUFFER STD.STANDARD.integer range 7 DOWNTO 0
	);
END rlc_microservice;

-- Design Ports Information
-- reset_o	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- load_o	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- count_o	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- error	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[0]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[1]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[2]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- areset	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF rlc_microservice IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_areset : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset_o : std_logic;
SIGNAL ww_load_o : std_logic;
SIGNAL ww_count_o : std_logic;
SIGNAL ww_error : std_logic;
SIGNAL ww_state : std_logic_vector(2 DOWNTO 0);
SIGNAL \enable~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \reset_o~output_o\ : std_logic;
SIGNAL \load_o~output_o\ : std_logic;
SIGNAL \count_o~output_o\ : std_logic;
SIGNAL \error~output_o\ : std_logic;
SIGNAL \state[0]~output_o\ : std_logic;
SIGNAL \state[1]~output_o\ : std_logic;
SIGNAL \state[2]~output_o\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \enable~inputclkctrl_outclk\ : std_logic;
SIGNAL \areset~input_o\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \current.wait4start_s~0_combout\ : std_logic;
SIGNAL \check_error~0_combout\ : std_logic;
SIGNAL \current.wait4start_s~q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \current.starting_s~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \current.reset_s~q\ : std_logic;
SIGNAL \nx_out~0_combout\ : std_logic;
SIGNAL \reset_o$latch~combout\ : std_logic;
SIGNAL \current.count_s~q\ : std_logic;
SIGNAL \nx_state~7_combout\ : std_logic;
SIGNAL \current.load_s~q\ : std_logic;
SIGNAL \nx_out~1_combout\ : std_logic;
SIGNAL \load_o$latch~combout\ : std_logic;
SIGNAL \nx_out~2_combout\ : std_logic;
SIGNAL \count_o$latch~combout\ : std_logic;
SIGNAL \WideOr6~combout\ : std_logic;
SIGNAL \state~0_combout\ : std_logic;
SIGNAL \ALT_INV_check_error~0_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr6~combout\ : std_logic;

BEGIN

ww_enable <= enable;
ww_areset <= areset;
ww_start <= start;
ww_clk <= clk;
reset_o <= IEEE.STD_LOGIC_1164.TO_BIT(ww_reset_o);
load_o <= IEEE.STD_LOGIC_1164.TO_BIT(ww_load_o);
count_o <= IEEE.STD_LOGIC_1164.TO_BIT(ww_count_o);
error <= IEEE.STD_LOGIC_1164.TO_BIT(ww_error);
state <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_state));
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\enable~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \enable~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_check_error~0_combout\ <= NOT \check_error~0_combout\;
\ALT_INV_WideOr6~combout\ <= NOT \WideOr6~combout\;

-- Location: IOIBUF_X16_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G17
\clk~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOOBUF_X8_Y0_N9
\reset_o~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reset_o$latch~combout\,
	devoe => ww_devoe,
	o => \reset_o~output_o\);

-- Location: IOOBUF_X12_Y0_N2
\load_o~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \load_o$latch~combout\,
	devoe => ww_devoe,
	o => \load_o~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\count_o~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \count_o$latch~combout\,
	devoe => ww_devoe,
	o => \count_o~output_o\);

-- Location: IOOBUF_X31_Y31_N9
\error~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \error~output_o\);

-- Location: IOOBUF_X12_Y0_N9
\state[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr6~combout\,
	devoe => ww_devoe,
	o => \state[0]~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\state[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state~0_combout\,
	devoe => ww_devoe,
	o => \state[1]~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\state[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \current.count_s~q\,
	devoe => ww_devoe,
	o => \state[2]~output_o\);

-- Location: IOIBUF_X16_Y0_N22
\enable~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

-- Location: CLKCTRL_G19
\enable~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \enable~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \enable~inputclkctrl_outclk\);

-- Location: IOIBUF_X20_Y0_N8
\areset~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_areset,
	o => \areset~input_o\);

-- Location: IOIBUF_X20_Y0_N1
\start~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: LCCOMB_X16_Y1_N30
\current.wait4start_s~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \current.wait4start_s~0_combout\ = (\current.wait4start_s~q\) # ((\start~input_o\ & \enable~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \start~input_o\,
	datac => \enable~input_o\,
	datad => \current.wait4start_s~q\,
	combout => \current.wait4start_s~0_combout\);

-- Location: LCCOMB_X16_Y1_N12
\check_error~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \check_error~0_combout\ = (\areset~input_o\ & \enable~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \areset~input_o\,
	datac => \enable~input_o\,
	combout => \check_error~0_combout\);

-- Location: FF_X16_Y1_N29
\current.wait4start_s\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \current.wait4start_s~0_combout\,
	clrn => \ALT_INV_check_error~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current.wait4start_s~q\);

-- Location: LCCOMB_X16_Y1_N26
\Selector1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\start~input_o\ & ((\current.starting_s~q\) # (!\current.wait4start_s~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \start~input_o\,
	datac => \current.starting_s~q\,
	datad => \current.wait4start_s~q\,
	combout => \Selector1~0_combout\);

-- Location: FF_X16_Y1_N27
\current.starting_s\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector1~0_combout\,
	clrn => \ALT_INV_check_error~0_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current.starting_s~q\);

-- Location: LCCOMB_X16_Y1_N16
\Selector2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (!\start~input_o\ & \current.starting_s~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \start~input_o\,
	datad => \current.starting_s~q\,
	combout => \Selector2~0_combout\);

-- Location: FF_X16_Y1_N17
\current.reset_s\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector2~0_combout\,
	clrn => \ALT_INV_check_error~0_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current.reset_s~q\);

-- Location: LCCOMB_X16_Y1_N24
\nx_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \nx_out~0_combout\ = (!\areset~input_o\ & \current.reset_s~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \areset~input_o\,
	datad => \current.reset_s~q\,
	combout => \nx_out~0_combout\);

-- Location: LCCOMB_X16_Y1_N4
\reset_o$latch\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reset_o$latch~combout\ = (GLOBAL(\enable~inputclkctrl_outclk\) & ((\nx_out~0_combout\))) # (!GLOBAL(\enable~inputclkctrl_outclk\) & (\reset_o$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset_o$latch~combout\,
	datac => \enable~inputclkctrl_outclk\,
	datad => \nx_out~0_combout\,
	combout => \reset_o$latch~combout\);

-- Location: FF_X16_Y1_N19
\current.count_s\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \current.load_s~q\,
	clrn => \ALT_INV_check_error~0_combout\,
	sload => VCC,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current.count_s~q\);

-- Location: LCCOMB_X16_Y1_N2
\nx_state~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \nx_state~7_combout\ = (\current.count_s~q\) # (\current.reset_s~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current.count_s~q\,
	datad => \current.reset_s~q\,
	combout => \nx_state~7_combout\);

-- Location: FF_X16_Y1_N3
\current.load_s\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \nx_state~7_combout\,
	clrn => \ALT_INV_check_error~0_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current.load_s~q\);

-- Location: LCCOMB_X16_Y1_N6
\nx_out~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \nx_out~1_combout\ = (!\areset~input_o\ & \current.load_s~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \areset~input_o\,
	datad => \current.load_s~q\,
	combout => \nx_out~1_combout\);

-- Location: LCCOMB_X16_Y1_N22
\load_o$latch\ : cycloneiv_lcell_comb
-- Equation(s):
-- \load_o$latch~combout\ = (GLOBAL(\enable~inputclkctrl_outclk\) & ((\nx_out~1_combout\))) # (!GLOBAL(\enable~inputclkctrl_outclk\) & (\load_o$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \load_o$latch~combout\,
	datac => \enable~inputclkctrl_outclk\,
	datad => \nx_out~1_combout\,
	combout => \load_o$latch~combout\);

-- Location: LCCOMB_X16_Y1_N20
\nx_out~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \nx_out~2_combout\ = (!\areset~input_o\ & \current.count_s~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \areset~input_o\,
	datad => \current.count_s~q\,
	combout => \nx_out~2_combout\);

-- Location: LCCOMB_X16_Y1_N8
\count_o$latch\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count_o$latch~combout\ = (GLOBAL(\enable~inputclkctrl_outclk\) & ((\nx_out~2_combout\))) # (!GLOBAL(\enable~inputclkctrl_outclk\) & (\count_o$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count_o$latch~combout\,
	datac => \enable~inputclkctrl_outclk\,
	datad => \nx_out~2_combout\,
	combout => \count_o$latch~combout\);

-- Location: LCCOMB_X16_Y1_N28
WideOr6 : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr6~combout\ = (\current.count_s~q\) # ((\current.reset_s~q\) # (!\current.wait4start_s~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current.count_s~q\,
	datac => \current.wait4start_s~q\,
	datad => \current.reset_s~q\,
	combout => \WideOr6~combout\);

-- Location: LCCOMB_X16_Y1_N18
\state~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~0_combout\ = (\current.load_s~q\) # (\current.reset_s~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current.load_s~q\,
	datad => \current.reset_s~q\,
	combout => \state~0_combout\);

ww_reset_o <= \reset_o~output_o\;

ww_load_o <= \load_o~output_o\;

ww_count_o <= \count_o~output_o\;

ww_error <= \error~output_o\;

ww_state(0) <= \state[0]~output_o\;

ww_state(1) <= \state[1]~output_o\;

ww_state(2) <= \state[2]~output_o\;
END structure;



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

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Mon Feb 07 21:44:33 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Block2 IS 
	PORT
	(
		Enable :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		windows :  IN  STD_LOGIC;
		store :  IN  STD_LOGIC;
		rst_on :  IN  STD_LOGIC;
		Led_Red :  OUT  STD_LOGIC;
		Led_Blue :  OUT  STD_LOGIC;
		Led_Green :  OUT  STD_LOGIC
	);
END Block2;

ARCHITECTURE bdf_type OF Block2 IS 

COMPONENT logic_da_h0
	PORT(gt : IN STD_LOGIC;
		 lt : IN STD_LOGIC;
		 q : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT dsf_upcounter
	PORT(enable : IN STD_LOGIC;
		 areset : IN STD_LOGIC;
		 count_en : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dsf_datareg
	PORT(enable : IN STD_LOGIC;
		 areset : IN STD_LOGIC;
		 load_en : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_constant0
	PORT(		 result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dsf_compare
	PORT(enable : IN STD_LOGIC;
		 gtin : IN STD_LOGIC;
		 ltin : IN STD_LOGIC;
		 eqin : IN STD_LOGIC;
		 dataa : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 gtout : OUT STD_LOGIC;
		 ltout : OUT STD_LOGIC;
		 eqout : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 
Led_Red <= SYNTHESIZED_WIRE_0;
Led_Green <= SYNTHESIZED_WIRE_1;



b2v_inst : logic_da_h0
PORT MAP(gt => SYNTHESIZED_WIRE_0,
		 lt => SYNTHESIZED_WIRE_1,
		 q => Led_Blue);


b2v_inst0 : dsf_upcounter
PORT MAP(enable => Enable,
		 areset => reset,
		 count_en => windows,
		 clk => clk,
		 q => SYNTHESIZED_WIRE_2);


b2v_inst1 : dsf_datareg
PORT MAP(enable => Enable,
		 areset => rst_on,
		 load_en => store,
		 clk => clk,
		 data => SYNTHESIZED_WIRE_2,
		 q => SYNTHESIZED_WIRE_15);


b2v_inst10 : lpm_constant0
PORT MAP(		 result => SYNTHESIZED_WIRE_12);


b2v_inst11 : lpm_constant0
PORT MAP(		 result => SYNTHESIZED_WIRE_7);


b2v_inst2 : dsf_compare
PORT MAP(enable => Enable,
		 gtin => SYNTHESIZED_WIRE_13,
		 ltin => SYNTHESIZED_WIRE_13,
		 eqin => SYNTHESIZED_WIRE_14,
		 dataa => SYNTHESIZED_WIRE_15,
		 datab => SYNTHESIZED_WIRE_7,
		 gtout => SYNTHESIZED_WIRE_0);


b2v_inst3 : dsf_compare
PORT MAP(enable => clk,
		 gtin => SYNTHESIZED_WIRE_13,
		 ltin => SYNTHESIZED_WIRE_13,
		 eqin => SYNTHESIZED_WIRE_14,
		 dataa => SYNTHESIZED_WIRE_15,
		 datab => SYNTHESIZED_WIRE_12,
		 ltout => SYNTHESIZED_WIRE_1);


b2v_inst5 : lpm_constant0
PORT MAP(		 result(0) => SYNTHESIZED_WIRE_14);


b2v_inst6 : lpm_constant0
PORT MAP(		 result(0) => SYNTHESIZED_WIRE_13);


END bdf_type;
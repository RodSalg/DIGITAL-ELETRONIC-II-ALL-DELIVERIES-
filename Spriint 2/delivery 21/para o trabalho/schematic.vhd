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
-- CREATED		"Tue Feb 08 04:16:59 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY schematic IS 
	PORT
	(
		enable :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		windows :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		rst_on :  IN  STD_LOGIC;
		store :  IN  STD_LOGIC;
		led_red :  OUT  STD_LOGIC;
		led_green :  OUT  STD_LOGIC;
		led_blue :  OUT  STD_LOGIC
	);
END schematic;

ARCHITECTURE bdf_type OF schematic IS 

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

COMPONENT lpm_constant0
	PORT(		 result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lgc_h0
	PORT(gt : IN STD_LOGIC;
		 lt : IN STD_LOGIC;
		 lgc_out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT lpm_constant1
	PORT(		 result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_constant2
	PORT(		 result : OUT STD_LOGIC_VECTOR(0 TO 0)
	);
END COMPONENT;

COMPONENT lpm_constant3
	PORT(		 result : OUT STD_LOGIC_VECTOR(0 TO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;


BEGIN 
led_red <= SYNTHESIZED_WIRE_2;
led_green <= SYNTHESIZED_WIRE_1;



b2v_inst : dsf_upcounter
PORT MAP(enable => enable,
		 areset => reset,
		 count_en => windows,
		 clk => clk,
		 q => SYNTHESIZED_WIRE_0);


b2v_inst1 : dsf_datareg
PORT MAP(enable => enable,
		 areset => rst_on,
		 load_en => store,
		 clk => clk,
		 data => SYNTHESIZED_WIRE_0,
		 q => SYNTHESIZED_WIRE_17);


SYNTHESIZED_WIRE_18 <= SYNTHESIZED_WIRE_1 OR SYNTHESIZED_WIRE_2;


b2v_inst2 : dsf_compare
PORT MAP(enable => enable,
		 gtin => SYNTHESIZED_WIRE_15,
		 ltin => SYNTHESIZED_WIRE_15,
		 eqin => SYNTHESIZED_WIRE_16,
		 dataa => SYNTHESIZED_WIRE_17,
		 datab => SYNTHESIZED_WIRE_7,
		 gtout => SYNTHESIZED_WIRE_2);


b2v_inst3 : dsf_compare
PORT MAP(enable => clk,
		 gtin => SYNTHESIZED_WIRE_15,
		 ltin => SYNTHESIZED_WIRE_15,
		 eqin => SYNTHESIZED_WIRE_16,
		 dataa => SYNTHESIZED_WIRE_17,
		 datab => SYNTHESIZED_WIRE_12,
		 ltout => SYNTHESIZED_WIRE_1);


b2v_inst4 : lpm_constant0
PORT MAP(		 result => SYNTHESIZED_WIRE_7);


b2v_inst5 : lgc_h0
PORT MAP(gt => SYNTHESIZED_WIRE_18,
		 lt => SYNTHESIZED_WIRE_18,
		 lgc_out => led_blue);


b2v_inst6 : lpm_constant1
PORT MAP(		 result => SYNTHESIZED_WIRE_12);


b2v_inst7 : lpm_constant2
PORT MAP(		 result(0) => SYNTHESIZED_WIRE_15);


b2v_inst9 : lpm_constant3
PORT MAP(		 result(0) => SYNTHESIZED_WIRE_16);


END bdf_type;
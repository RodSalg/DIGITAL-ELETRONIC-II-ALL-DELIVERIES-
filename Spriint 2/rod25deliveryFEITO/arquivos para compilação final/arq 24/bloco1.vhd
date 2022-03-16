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
-- CREATED		"Sat Feb 12 01:12:33 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY bloco1 IS 
	PORT
	(
		enable :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		start :  IN  STD_LOGIC;
		pos_neg :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		pulse :  OUT  STD_LOGIC;
		count :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END bloco1;

ARCHITECTURE bdf_type OF bloco1 IS 

COMPONENT dsf_timer
	PORT(enable : IN STD_LOGIC;
		 areset : IN STD_LOGIC;
		 trigger : IN STD_LOGIC;
		 pos_neg : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 q : OUT STD_LOGIC;
		 count : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_constant4
	PORT(		 result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



b2v_inst : dsf_timer
PORT MAP(enable => enable,
		 areset => reset,
		 trigger => start,
		 pos_neg => pos_neg,
		 clk => clk,
		 data => SYNTHESIZED_WIRE_0,
		 q => pulse,
		 count => count);


b2v_inst0 : lpm_constant4
PORT MAP(		 result => SYNTHESIZED_WIRE_0);


END bdf_type;
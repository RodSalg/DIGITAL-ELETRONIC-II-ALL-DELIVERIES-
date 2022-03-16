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
-- CREATED		"Tue Feb 15 23:12:31 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY radar_eletronico IS 
	PORT
	(
		enable :  IN  STD_LOGIC;
		rst :  IN  STD_LOGIC;
		trigger :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		pos_neg :  IN  STD_LOGIC;
		rst_1 :  IN  STD_LOGIC;
		led_red :  OUT  STD_LOGIC;
		led_blue :  OUT  STD_LOGIC;
		led_green :  OUT  STD_LOGIC;
		q_regt :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		q_state :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		saida_count :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END radar_eletronico;

ARCHITECTURE bdf_type OF radar_eletronico IS 

COMPONENT schematic
	PORT(enable : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 windows : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 rst_on : IN STD_LOGIC;
		 store : IN STD_LOGIC;
		 led_red : OUT STD_LOGIC;
		 led_green : OUT STD_LOGIC;
		 led_blue : OUT STD_LOGIC;
		 out_reg : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

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

COMPONENT lpm_constant0
	PORT(		 result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT rlc_microservice
	PORT(enable : IN STD_LOGIC;
		 areset : IN STD_LOGIC;
		 pulse : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 reset_o : OUT STD_LOGIC;
		 store_o : OUT STD_LOGIC;
		 windows_o : OUT STD_LOGIC;
		 state : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;


BEGIN 



b2v_inst : schematic
PORT MAP(enable => enable,
		 reset => SYNTHESIZED_WIRE_0,
		 windows => SYNTHESIZED_WIRE_1,
		 clk => clk,
		 rst_on => rst_1,
		 store => SYNTHESIZED_WIRE_2,
		 led_red => led_red,
		 led_green => led_blue,
		 led_blue => led_green,
		 out_reg => q_regt);


b2v_inst2 : dsf_timer
PORT MAP(enable => enable,
		 areset => rst,
		 trigger => trigger,
		 pos_neg => pos_neg,
		 clk => clk,
		 data => SYNTHESIZED_WIRE_3,
		 q => SYNTHESIZED_WIRE_4,
		 count => saida_count);


b2v_inst3 : lpm_constant0
PORT MAP(		 result => SYNTHESIZED_WIRE_3);


b2v_inst4 : rlc_microservice
PORT MAP(enable => enable,
		 areset => rst,
		 pulse => SYNTHESIZED_WIRE_4,
		 clk => clk,
		 reset_o => SYNTHESIZED_WIRE_0,
		 store_o => SYNTHESIZED_WIRE_2,
		 windows_o => SYNTHESIZED_WIRE_1,
		 state => q_state);


END bdf_type;
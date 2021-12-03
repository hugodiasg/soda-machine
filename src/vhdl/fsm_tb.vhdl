LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
--USE ieee.std_logic_unsigned.all;

ENTITY fsm_tb IS
	GENERIC(
		time_clock	: TIME:= 30 ps;	
		--ciclos		: INTEGER:= 10	
		tamanho		: INTEGER:= 1000;
		preco		: INTEGER:= 500	
	);	
END fsm_tb;

ARCHITECTURE arc_fsm_tb OF fsm_tb IS

	COMPONENT fsm 
		PORT(
			tot_ld,tot_clr, d	: OUT STD_LOGIC;
			tot_ls_s, c,clock	: IN STD_LOGIC
		);
	END COMPONENT fsm;

	for fsm_0: fsm use entity work.fsm;
	
	SIGNAL tot_ld,tot_clr, d,tot_ls_s, c,clock	: STD_LOGIC;
	
	BEGIN

	fsm_0: fsm port map (tot_ld,tot_clr, d, tot_ls_s, c,clock);
	
	--Simulação
	tot_ls_s<='0',	'1' after 400 ps;
	c<= '0';--, 	'1' after 200 ps;
	clock<='0',	'1' after time_clock,	'0' after 2*time_clock,	'1' after 3*time_clock,	'0' after 		4*time_clock,	'1' after 5*time_clock,	'0' after 6*time_clock,	'1' after 7*time_clock,	'0' after 8*time_clock,	'1' after 9*time_clock,	'0' after 10*time_clock,	'1' after 11*time_clock,	'0' after 12*time_clock,	'1' after 13*time_clock,	'0' after 14*time_clock,	'1' after 15*time_clock,	'0' after 16*time_clock,	'1' after 17*time_clock,	'0' after 18*time_clock,	'1' after 19*time_clock,	'0' after 20*time_clock;
	
END arc_fsm_tb;

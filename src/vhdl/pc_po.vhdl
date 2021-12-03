LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
--USE ieee.std_logic_unsigned.all;

ENTITY pc_po_tb IS
	GENERIC(
		time_clock	: TIME:= 30 ps;	
		--ciclos		: INTEGER:= 10	
		tamanho		: INTEGER:= 8;
		preco		: STD_LOGIC_VECTOR:="00000011"	
	);	
END pc_po_tb;

ARCHITECTURE pc_po_tb_arc OF pc_po IS
	
	--FSM
	COMPONENT fsm 
		PORT(
			tot_ld,tot_clr, d	: OUT STD_LOGIC;
			tot_ls_s, c,clock	: IN STD_LOGIC
		);
	END COMPONENT fsm;

	for fsm_0: fsm use entity work.fsm;
	

	--PO
	COMPONENT po 
		PORT(
			s,a			: IN STD_LOGIC_VECTOR((tamanho-1) downto 0);
			tot_ld,tot_clr,clock	: IN STD_LOGIC;
			tot_ls_s		: OUT STD_LOGIC
		);
	END COMPONENT po;

	for po_0: po use entity work.po;
	
	SIGNAL s,a					: STD_LOGIC_VECTOR((tamanho-1) downto 0);
	SIGNAL tot_ld,tot_clr,clock,tot_ls_s,c,d	: STD_LOGIC;	
	
	BEGIN

	fsm_0: fsm port map (tot_ld,tot_clr, d, tot_ls_s, c,clock);
	po_0: po port map (s,a,tot_ld,tot_clr,clock,tot_ls_s);

	--Simulação
	
	s<=preco;
	a<="00000001",		"00000011" after 100 ps;
	c<= '0', 	'1' after 100 ps;
	clock<='0',	'1' after time_clock,	'0' after 2*time_clock,	'1' after 3*time_clock,	'0' after 		4*time_clock,	'1' after 5*time_clock,	'0' after 6*time_clock,	'1' after 7*time_clock,	'0' after 8*time_clock,	'1' after 9*time_clock,	'0' after 10*time_clock,	'1' after 11*time_clock,	'0' after 12*time_clock,	'1' after 13*time_clock,	'0' after 14*time_clock,	'1' after 15*time_clock,	'0' after 16*time_clock,	'1' after 17*time_clock,	'0' after 18*time_clock,	'1' after 19*time_clock,	'0' after 20*time_clock;
END pc_po_tb_arc;

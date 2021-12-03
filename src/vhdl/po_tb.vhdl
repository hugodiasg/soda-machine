LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
--USE ieee.std_logic_unsigned.all;

ENTITY po_tb IS
	GENERIC(
		time_clock	: TIME:= 10 ps;	
		--ciclos		: INTEGER:= 10	
		tamanho		: INTEGER:= 8;
		preco		: STD_LOGIC_VECTOR:="00000011"	
	);
END po_tb;

ARCHITECTURE arc_po_tb OF po_tb IS

	COMPONENT po 
		PORT(
			s,a			: IN STD_LOGIC_VECTOR((tamanho-1) downto 0);
			tot_ld,tot_clr,clock	: IN STD_LOGIC;
			tot_ls_s		: OUT STD_LOGIC
		);
	END COMPONENT po;

	for po_0: po use entity work.po;
	
	SIGNAL s,a				: STD_LOGIC_VECTOR((tamanho-1) downto 0);
	SIGNAL tot_ld,tot_clr,clock,tot_ls_s	: STD_LOGIC;
	
	BEGIN

	po_0: po port map (s,a,tot_ld,tot_clr,clock,tot_ls_s);
	
	--Simulação
	s<=preco;
	a<="00000010";--,	preco after 100 ps;
	tot_clr<='1', '0' after 15 ps, '1' after 60 ps, '0' after 75 ps;
	tot_ld<='0',	'1' after 50 ps;
	clock<='0',	'1' after time_clock,	'0' after 2*time_clock,	'1' after 3*time_clock,	'0' after 4*time_clock,	'1' after 5*time_clock,	'0' after 6*time_clock,	'1' after 7*time_clock,	'0' after 8*time_clock,	'1' after 9*time_clock,	'0' after 10*time_clock;
	
END arc_po_tb;

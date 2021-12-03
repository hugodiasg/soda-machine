LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
--USE ieee.std_logic_STD_LOGIC_VECTOR.all;


ENTITY reg_tot_tb IS
	GENERIC(
		time_clock	: time:= 20 ps;
		tamanho		: INTEGER:= 8
	);
END reg_tot_tb;

ARCHITECTURE reg_tot_tb_arc OF reg_tot_tb IS

	COMPONENT reg_tot 
		PORT(
			tot_in			: IN STD_LOGIC_VECTOR((tamanho-1) downto 0);
			tot_out			: OUT STD_LOGIC_VECTOR((tamanho-1) downto 0);
			tot_clr,tot_ld,clock	: IN STD_LOGIC
		);
	END COMPONENT reg_tot;

	for reg_tot_0: reg_tot use entity work.reg_tot;
	
	SIGNAL tot_in,tot_out		: STD_LOGIC_VECTOR((tamanho-1) downto 0);
	SIGNAL tot_clr,tot_ld,clock	: STD_LOGIC;

	BEGIN

	reg_tot_0: reg_tot port map (tot_in, tot_out, tot_clr,tot_ld,clock);
	
	--Simulação
	
	tot_in<="00000001",	"00001000" after 50 ps;
	tot_clr<='0',	'1' after 70 ps;	
	tot_ld<='1';
	clock<='0',	'1' after time_clock,	'0' after 2*time_clock,	'1' after 3*time_clock,	'0' after 4*time_clock,	'1' after 5*time_clock,	'0' after 6*time_clock;
	
END reg_tot_tb_arc;

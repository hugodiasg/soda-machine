LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
--USE ieee.std_logic_unsigned.all;

ENTITY po IS
	GENERIC(
		tamanho		: INTEGER:= 8
	);	
	PORT(
		s,a			: IN STD_LOGIC_VECTOR((tamanho-1) downto 0);
		tot_ld,tot_clr,clock	: IN STD_LOGIC;
		tot_ls_s		: OUT STD_LOGIC
	);
END po;

ARCHITECTURE po_arc OF po IS

	COMPONENT soma_comp 
		PORT(
			s,a,tot_in	: IN STD_LOGIC_VECTOR((tamanho-1) downto 0);
			tot_out		: OUT STD_LOGIC_VECTOR((tamanho-1) downto 0);
			tot_ls_s	: OUT STD_LOGIC
		);
	END COMPONENT soma_comp;	
	
	COMPONENT reg_tot 
		PORT(
			tot_in			: IN STD_LOGIC_VECTOR((tamanho-1) downto 0);
			tot_out			: OUT STD_LOGIC_VECTOR((tamanho-1) downto 0);
			tot_clr,tot_ld,clock	: IN STD_LOGIC
		);
	END COMPONENT reg_tot;
	
	for soma_comp_0: soma_comp use entity work.soma_comp;
	for reg_tot_0: reg_tot use entity work.reg_tot;
	
	--SIGNAL s,a,tot_in, tot_out			: INTEGER RANGE 0 to tamanho;
	--SIGNAL tot_ls_s,tot_clr,tot_ld,clock		: STD_LOGIC;
	SIGNAL tot_in, tot_out			: STD_LOGIC_VECTOR((tamanho-1) downto 0);

	BEGIN

	soma_comp_0: soma_comp port map (s,a,tot_out, tot_in, tot_ls_s);
	reg_tot_0: reg_tot port map (tot_in, tot_out, tot_clr,tot_ld,clock);
	
	PROCESS (s,a,tot_ld, tot_clr)
		BEGIN
	END PROCESS;
END po_arc;

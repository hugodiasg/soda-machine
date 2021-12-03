LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
--USE ieee.std_logic_STD_LOGIC_VECTOR.all;

ENTITY soma_comp_tb IS
	GENERIC(
		tamanho		: INTEGER:= 8;
		preco		: STD_LOGIC_VECTOR:="00000011"	
	);
END soma_comp_tb;

ARCHITECTURE arc_soma_comp_tb OF soma_comp_tb IS

	COMPONENT soma_comp 
		PORT(
			s,a,tot_in	: IN STD_LOGIC_VECTOR((tamanho-1) downto 0);
			tot_out		: OUT STD_LOGIC_VECTOR((tamanho-1) downto 0);
			tot_ls_s	: OUT STD_LOGIC
		);
	END COMPONENT soma_comp;

	for soma_comp_0: soma_comp use entity work.soma_comp;
	
	SIGNAL s,a,tot_in, tot_out	: STD_LOGIC_VECTOR((tamanho-1) downto 0);
	SIGNAL tot_ls_s			: STD_LOGIC;
	
	BEGIN

	soma_comp_0: soma_comp port map (s,a,tot_in, tot_out, tot_ls_s);
	
	--Simulação
	s<=preco;
	a<="00000010",	preco after 100 ps;
	tot_in<="00000001";
	
END arc_soma_comp_tb;

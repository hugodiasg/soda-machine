LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
--USE ieee.std_logic_STD_LOGIC_VECTOR.all;

ENTITY soma_comp IS
	GENERIC(
		tamanho		: INTEGER:= 8
	);	
	PORT(
		s,a,tot_in	: IN STD_LOGIC_VECTOR((tamanho-1) downto 0);
		tot_out		: OUT STD_LOGIC_VECTOR((tamanho-1) downto 0);
		tot_ls_s	: OUT STD_LOGIC
	);
END soma_comp;

ARCHITECTURE soma_comp_arc OF soma_comp IS
	SIGNAL aux_tot_out	: STD_LOGIC_VECTOR((tamanho-1) downto 0);
	BEGIN
		somar: PROCESS(tot_in,s,a)
		BEGIN
			aux_tot_out<= std_logic_vector(unsigned(tot_in) + unsigned(a) );
		END PROCESS somar;
		
		comparar: PROCESS(aux_tot_out,tot_in)
		BEGIN
			--tot_out<=aux_tot_out;
			IF (tot_in<s) THEN
				tot_ls_s<='1';
				tot_out<=std_logic_vector(unsigned(tot_in) + unsigned(a));
			ELSE	
				tot_ls_s<='0';
				tot_out<=std_logic_vector(unsigned(tot_in) + unsigned(a));
			END IF;
		END PROCESS comparar;
END soma_comp_arc;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
--USE ieee.std_logic_STD_LOGIC_VECTOR.all;


ENTITY reg_tot IS
	GENERIC( 
		tamanho		: INTEGER:= 8
	);			
	PORT(
		tot_in			: IN STD_LOGIC_VECTOR((tamanho-1) downto 0);
		tot_out			: OUT STD_LOGIC_VECTOR((tamanho-1) downto 0);
		tot_clr,tot_ld,clock	: IN STD_LOGIC
	);
END reg_tot;

ARCHITECTURE reg_tot_arc OF reg_tot IS

	BEGIN
	
	PROCESS (tot_in,tot_clr,tot_ld,clock)
	BEGIN
		IF (tot_clr='1') THEN
			tot_out<="00000000";
		ELSIF (tot_ld='1' AND rising_edge(clock)) THEN
			tot_out<=tot_in;
		END IF;
	END PROCESS;
END reg_tot_arc;

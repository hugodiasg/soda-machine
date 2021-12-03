LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
--USE ieee.std_logic_unsigned.all;

ENTITY fsm IS
	GENERIC(
		tamanho		: INTEGER:= 1000
	);	
	PORT(
		tot_ld,tot_clr, d	: OUT STD_LOGIC;
		tot_ls_s, c,clock	: IN STD_LOGIC
	);
END fsm;

ARCHITECTURE fsm_arc OF fsm IS
	
	SIGNAL next_state,current_state,state		: STD_LOGIC_VECTOR(1 downto 0):="00";
	SIGNAL d_aux,tot_ld_aux,c_aux,tot_clr_aux	: STD_LOGIC:='0';
	-- ESTADOS: 00-> Inicio	01-> Esperar 10-> Somar 11-> Fornecer

	BEGIN
	states: PROCESS (c,tot_ls_s,clock)
		BEGIN
			IF (NOT (current_state="01" OR current_state="00") AND rising_edge(clock)) THEN
				c_aux<='0';
			ELSIF (c='1') THEN
				c_aux<='1';		
			END IF;

			CASE current_state IS
				WHEN "00" => 
					next_state<="01";
					tot_clr_aux<='0';
				WHEN "01" =>
					IF(c_aux='1' AND tot_ls_s='1') THEN
						tot_ld_aux<='1';
						next_state<="10";
					ELSIF (c_aux='1' AND tot_ls_s='0') THEN
						next_state<="11";
						d_aux<='1';
					ELSE
						next_state<="01";
					END IF;
				WHEN "10" =>
					next_state<="01";
					tot_ld_aux<='0';
				WHEN "11" =>
					next_state<="00";
					tot_clr_aux<='1';
					d_aux<='1';
				WHEN OTHERS => 
					next_state<="00";
					tot_clr_aux<='1';
			END CASE;

			
	END PROCESS states;

	att: PROCESS(c,tot_ls_s,clock)
		BEGIN
		IF (rising_edge(clock)) THEN
			current_state<=next_state;			
			state<=next_state;
			d<=d_aux;
			tot_clr<=tot_clr_aux;
			tot_ld<=tot_ld_aux;
		END IF;
		
	END PROCESS att;
END fsm_arc;

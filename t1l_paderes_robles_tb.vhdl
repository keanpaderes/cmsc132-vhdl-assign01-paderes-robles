--File Name: t1l_paderes_robles_tb.vhdl
--Program Description: Test Bench for the Farm Buzzer 
--Author: Paderes, Irvin Kean Paulus T.
-- 			 Robles, Paul Joshua H.
library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Test Bench has no ports
entity t1l_paderes_robles_tb is
	constant DELAY: time := 10 ns;
end entity t1l_paderes_robles_tb;

architecture t1l_paderes_robles_tb of t1l_paderes_robles_tb is
	-- initialize signals to connect to UUT (Unit Under Test)
	signal T_BoI, T_BoO, T_BuI, T_BuO, T_BeI, T_BeO: std_logic;
	signal T_alarm: std_logic;

	-- connect to main VHDL file
	component t1l_paderes_robles is 
		port (
			boggisIn, boggisOut, bunceIn, bunceOut, beanIn, beanOut: in std_logic;
			alarm : out std_logic
		);
	end component t1l_paderes_robles;

begin
	-- make connections to the UUT
	-- map variables or signals declared to ports of the entity
	uut: component t1l_paderes_robles port map (T_BoI, T_BoO, T_BuI, T_BuO, T_BeI, T_BeO, T_alarm);

	-- check test cases
	process
		-- initialize some variables
		variable error_count: integer := 0;
		variable input: unsigned(5 downto 0); --simulating inputs
		variable expected_or_in: std_logic;
		variable expected_or_out: std_logic;
		variable expected_alarm: std_logic;
		
	
	begin
		report "Start Test.";
		
		for count in 0 to 63 loop
			input := TO_UNSIGNED(count, 6);
			T_BoI <= input(5);
			T_BoO <= input(4);
			T_BuI <= input(3);
			T_BuO <= input(2);
			T_BeI <= input(1);
			T_BeO <= input(0);
			
			report "input = " & std_logic'image(input(5)) & std_logic'image(input(4)) 
			& std_logic'image(input(3)) & std_logic'image(input(2))
			& std_logic'image(input(1)) & std_logic'image(input(0));
			
			if(count = 0) then
				expected_or_in := '0';
				expected_or_out := '0';
				expected_alarm := '0';
			else
				if ((input(5) = '1') or (input(3) = '1') or (input(1) = '1')) then
					expected_or_in := '1';
				else expected_or_in := '0';
				end if;
				
				if ((input(4) = '1') or (input(2) = '1') or (input(0) = '1')) then
					expected_or_out := '1';
				else expected_or_out := '0';
				end if;
				
				if((expected_or_in = '1') and (expected_or_out = '1')) then
					expected_alarm := '1';
				else expected_alarm := '0';
				end if;
			end if;
			
		
			
			report "orIn = " & std_logic'image(expected_or_in) & " orOut = " & std_logic'image(expected_or_out);
			report "alarm = " & std_logic'image(expected_alarm);
			report "real alarm = " & std_logic'image(T_alarm);
			
			wait for DELAY;
			
			--assert(expected_alarm = T_alarm) 
				--report "ERROR! Expected alarm " & std_logic'image(expected_alarm) 
				--& " when Boggis: IN_BUZZER = " & std_logic'image(T_BoI) & " , OUT_BUZZER = " & std_logic'image(T_BoO) 
				--& " ; when Bunce: IN_BUZZER = " & std_logic'image(T_BuI) & " , OUT_BUZZER = " & std_logic'image(T_BuO)
				--& " ; when Bean: IN_BUZZER = " & std_logic'image(T_BeI) & " , OUT_BUZZER = " & std_logic'image(T_BeO); 				
			
			if(expected_alarm /= T_alarm) then error_count := error_count + 1;
			end if;
		end loop;
		
		wait for DELAY;
		
		-- Summary of Test Bench
		report "Done with test. There were "& integer'image(error_count) & " errors.";
		wait; -- wait forever. This will finish the simulation
	end process;
end architecture t1l_paderes_robles_tb;



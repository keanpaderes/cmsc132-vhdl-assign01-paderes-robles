--File Name: t1l-paderes-robles.vhdl
--Program Description: Behavioral Design of a Farm Buzzer 
--Author: Paderes, Irvin Kean Paulus T.
-- 			 Robles, Paul Joshua H.

--Library Statements
library IEEE;
use IEEE.std_logic_1164.all;

entity farm_buzzer is
	port (
		boggisIn, boggisOut, bunceIn, bunceOut, beanIn, beanOut: in std_logic;
		alarm : out std_logic
		);
end entity farm_buzzer;

architecture behavioral of farm_buzzer is 
begin
	process (boggisIn, boggisOut, bunceIn, bunceOut, beanIn, beanOut) is
	variable orIn: std_logic := '0';
	variable orOut: std_logic := '0'; 
	begin
		if ((boggisIn = '1') or (bunceIn = '1') or (beanIn = '1')) then
			orIn := '1';
		end if;
		if ((boggisOut = '1') or (bunceOut = '1') or (beanOut = '1')) then
			orOut := '1';
		end if;
		alarm <= orIn and orOut;
	end process;
end architecture behavioral;
--File Name: t1l_paderes_robles.vhdl
--Program Description: Behavioral Design of a Farm Buzzer 
--Author: Paderes, Irvin Kean Paulus T.
-- 			 Robles, Paul Joshua H.

--Library Statements
library IEEE;
use IEEE.std_logic_1164.all;

entity t1l_paderes_robles is
	port (
		boggisIn, boggisOut, bunceIn, bunceOut, beanIn, beanOut: in std_logic;
		alarm : out std_logic
		);
end entity t1l_paderes_robles;

architecture behavioral of t1l_paderes_robles is 
begin
	process (boggisIn, boggisOut, bunceIn, bunceOut, beanIn, beanOut) is
	variable orIn: std_logic := '0';
	variable orOut: std_logic := '0'; 
	begin
		orIn := (boggisIn or bunceIn or beanIn);
		orOut := (boggisOut or bunceOut or beanOut);
		alarm <= orIn and orOut;
	end process;
end architecture behavioral;
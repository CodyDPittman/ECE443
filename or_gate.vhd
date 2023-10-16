library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all; 

entity or_gate is
	port(A, B : in std_logic;
	Y : out std_logic);
end or_gate;

architecture structural of or_gate is
begin	
	process(A,B)
	begin
		if A = '0' and B = '0' then
			Y <= '0' after 10 ns;
		elsif A = '0' and B = '1' then
			Y <= '1' after 10 ns;
		elsif A = '1' and B = '0' then
			Y <= '1' after 10 ns;
		elsif A = '1' and B = '1' then
			Y <= '1' after 10 ns;
		end if;	
	end process;
end structural;
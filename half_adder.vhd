library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- VHDL design for a half adder using gates

entity half_adder is
	port(A, B: in std_logic;
	sum, carryout: out std_logic);
end half_adder;

architecture structural of half_adder is
begin
	sum <= A xor B after 10 ns;
	carryout <= A and B after 10 ns;	
end structural;
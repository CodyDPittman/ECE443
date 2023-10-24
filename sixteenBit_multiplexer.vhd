library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all; 

-- VHDL structural implementation of a 16 bit multiplexer with 8 inputs

entity sixteenBit_multiplexer is
	port(selectLines : in std_logic_vector (2 downto 0);
			input0, input1, input2, input3, input4, input5, input6, input7 : signed (15 downto 0);
				output : out signed(15 downto 0));
end entity;




architecture structural of sixteenBit_multiplexer is

component or_gate is
	port(A, B : in std_logic;
	Y : out std_logic);
end component;







begin
	
	


	
	
end structural;
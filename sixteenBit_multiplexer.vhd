library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all; 

-- VHDL structural implementation of a 16 bit multiplexer with 8 inputs

entity sixteenBit_multiplexer is
	port(sel : in std_logic_vector(2 downto 0); -- select lines
			I0, I1, I2, I3, I4, I5, I6, I7 : signed (15 downto 0); -- inputs
			output : out signed(15 downto 0)); --output
end entity;


architecture structural of sixteenBit_multiplexer is
begin
	
with sel select
	output <= I0 when "000",
			  I1 when "001",
			  I2 when "010",
			  I3 when "011",
			  I4 when "100",
			  I5 when "101",
			  I6 when "110",
			  I7 when "111",
			  "0000000000000000" when others;
end structural;
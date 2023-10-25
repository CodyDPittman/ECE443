library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all; 

-- VHDL structural implementation of a 16 bit multiplexer with 8 inputs

entity sixteenBit_multiplexer is
	port(sel : in std_logic_vector(2 downto 0); -- select lines
			I0, I1, I2, I3, I4, I5, I6, I7 : in signed (15 downto 0); -- inputs
			output : out signed(15 downto 0)); --output
end entity;


architecture structural of sixteenBit_multiplexer is

begin
	
	
with sel select
	output <= I0 when "000",  -- signed addition
			  I1 when "001",  -- signed multiplication
			  I2 when "010",  -- passthrough A
			  I3 when "011",  -- passthrough B
			  I4 when "100",  -- signed subtraction
			  I5 when "101",  -- dont care
			  I6 when "110",  -- dont care
			  I7 when "111",  -- dont care
			  "0000000000000000" when others;
end structural;
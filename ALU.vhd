library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all; 

 -- VHDL structural implementation of a 16-bit ALU

entity ALU is
	port(A, B : in signed(15 downto 0);
	R : out signed(15 downto 0);
	sel : in std_logic_vector(2 downto 0);
	status : out std_logic_vector(2 downto 0));
end entity;

architecture structural of ALU is

component sixteenBit_adder is
	port(A, B : in signed(15 downto 0);
			sum : out signed(15 downto 0);
				overflow : out std_logic);		
end component;	
	
component sixteenBit_multiplier is
	port(A, B : in signed (15 downto 0);
			product : out signed (31 downto 0);
			overflow : out std_logic);
end component;

component sixteenBit_multiplexer is
	port(sel : in std_logic_vector(2 downto 0); -- select lines
			I0, I1, I2, I3, I4, I5, I6, I7 : signed (15 downto 0); -- inputs
			output : out signed(15 downto 0)); --output
end component;


begin


	
	
	
end structural;
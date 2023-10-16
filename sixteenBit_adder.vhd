library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- VHDL design for a 16 bit adder usign full adders and gates
	
entity sixteenBit_adder is
	port(A, B : in std_logic_vector(15 downto 0);
			sum : out std_logic_vector(15 downto 0));		
end sixteenBit_adder;

architecture structural of sixteenBit_adder is

component full_adder is
	 port(A, B, full_adder_carryin : in std_logic;
			sum, full_adder_carryout : out std_logic);
end component;

component half_adder is
	port(A, B : in std_logic;
			sum, carryout : out std_logic);
end component;
	
component or_gate is
	port(A, B : in std_logic;
	Y : out std_logic);
end component;

begin	
	-- Implement the actaul 16-bit adder here
	
end structural;
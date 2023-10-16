library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- VHDL design for a full adder using two half-adders and gates	  
	
entity full_adder is
	port(A, B, full_adder_carryin : in std_logic;
			sum, full_adder_carryout : out std_logic);
end full_adder;

architecture structural of full_adder is  

component half_adder is
	port(A, B : in std_logic;
			sum, carryout : out std_logic);
end component;
	
component or_gate is
	port(A, B : in std_logic;
	Y : out std_logic);
end component;

signal T1, T2, T3: std_logic;

begin	
	half_adder_1: half_adder port map (A => A, B => B, sum => T1, carryout => T2);
	half_adder_2: half_adder port map (A => T1, B => full_adder_carryin, sum => sum, carryout => T3);
	or_gate1: or_gate port map (A => T3, B => T2, Y => full_adder_carryout);
end structural;
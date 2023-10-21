library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;  

  -- VHDL design for a 16-bit multiplier using full adder and gates

entity sixteenBit_multiplier is
	port(A, B : in signed (15 downto 0);		  -- A is the multiplicand, B is multiplier
			product : out signed (31 downto 0);
			overflow : out std_logic);
end sixteenBit_multiplier;

architecture structural of sixteenBit_multiplier is

component sixteenBit_adder is
	port(A, B : in signed(15 downto 0);
			sum : out signed(15 downto 0);
			overflow : out std_logic);
end component;

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
	-- Look at the least significant bit of the multiplier (B[0])
	
	-- If LSB is 1, then add mutiplicand to product (probably will use the 16-bit adder here) 
		
	-- Shift multiplicand left 1 bit
	
	-- Shift multiplier right 1 bit
	
	-- Check if done 32 times ( is repetitions < 32)?
	
	
end structural;
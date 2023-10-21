library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- VHDL design for a 16 bit adder using full adders and gates
	
entity sixteenBit_adder is
	port(A, B : in signed(15 downto 0);
			sum : out signed(15 downto 0);
				overflow : out std_logic);		
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

signal T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16: std_logic;	

  -- Implement the 16-bit adder here (requires 16 full adders)
begin	
	full_adder_0: full_adder port map(A => A(0), B => B(0), full_adder_carryin => '0' , sum => sum(0), full_adder_carryout => T1);
	full_adder_1: full_adder port map(A => A(1), B => B(1), full_adder_carryin => T1 , sum => sum(1), full_adder_carryout => T2);
	full_adder_2: full_adder port map(A => A(2), B => B(2), full_adder_carryin => T2 , sum => sum(2), full_adder_carryout => T3);
	full_adder_3: full_adder port map(A => A(3), B => B(3), full_adder_carryin => T3 , sum => sum(3), full_adder_carryout => T4);
	full_adder_4: full_adder port map(A => A(4), B => B(4), full_adder_carryin => T4 , sum => sum(4), full_adder_carryout => T5);
	full_adder_5: full_adder port map(A => A(5), B => B(5), full_adder_carryin => T5 , sum => sum(5), full_adder_carryout => T6);
	full_adder_6: full_adder port map(A => A(6), B => B(6), full_adder_carryin => T6 , sum => sum(6), full_adder_carryout => T7);
	full_adder_7: full_adder port map(A => A(7), B => B(7), full_adder_carryin => T7 , sum => sum(7), full_adder_carryout => T8);
	full_adder_8: full_adder port map(A => A(8), B => B(8), full_adder_carryin => T8 , sum => sum(8), full_adder_carryout => T9);
	full_adder_9: full_adder port map(A => A(9), B => B(9), full_adder_carryin => T9 , sum => sum(9), full_adder_carryout => T10);
	full_adder_10: full_adder port map(A => A(10), B => B(10), full_adder_carryin => T10 , sum => sum(10), full_adder_carryout => T11);
	full_adder_11: full_adder port map(A => A(11), B => B(11), full_adder_carryin => T11 , sum => sum(11), full_adder_carryout => T12);
	full_adder_12: full_adder port map(A => A(12), B => B(12), full_adder_carryin => T12 , sum => sum(12), full_adder_carryout => T13);
	full_adder_13: full_adder port map(A => A(13), B => B(13), full_adder_carryin => T13 , sum => sum(13), full_adder_carryout => T14);
	full_adder_14: full_adder port map(A => A(14), B => B(14), full_adder_carryin => T14 , sum => sum(14), full_adder_carryout => T15);
	full_adder_15: full_adder port map(A => A(15), B => B(15), full_adder_carryin => T15 , sum => sum(15), full_adder_carryout => T16);	 
	
	-- Check the last two carry outs to test for overflow: if xor is '1' then overflow happens, otherwise no
	overflow <= T15 xor T16;
	
end structural;
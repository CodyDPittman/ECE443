library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all; 

 -- VHDL structural implementation of a 16-bit ALU

entity ALU is
	port(A, B : in signed(15 downto 0);
	R : out signed(15 downto 0);
	opcode : in std_logic_vector(2 downto 0);
	status : out std_logic_vector(2 downto 0));
end entity;

architecture structural of ALU is

signal R1, T1, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12 : signed (15 downto 0); 
signal T2 : signed (31 downto 0); 

signal o : std_logic := '0';

component sixteenBit_adder is
	port(A, B : in signed(15 downto 0);
			sum : out signed(15 downto 0);
				overflow : out std_logic);		
end component;	

component sixteenBit_subtractor is
    port(A, B : in signed(15 downto 0);
         difference : out signed(15 downto 0);
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
	
	-- This ALU executes all instructions at the same time
	sixteenBit_adder0: sixteenBit_adder port map(A => A, B => B, sum => T1, overflow => o);
	sixteenBit_multiplier0: sixteenBit_multiplier port map(A => A, B => B, product => T2, overflow => o);
	sixteenBit_subtractor0: sixteenBit_subtractor port map(A => A, B => B, difference => T3, overflow => o);
	
	-- The mux chooses which result to pass to R
	process(T1, T2, T3)
	begin
	if opcode = "000" then
		R <= T1;
		R1 <= T1;
	elsif opcode = "001" then
		R <= resize(T2, 16); 
		R1 <= resize(T2, 16);
	elsif opcode = "010" then
		R <= A;
	elsif opcode = "011" then
		R <= B;
	elsif opcode = "100" then
		R <= T3;
		R1 <= T3;
	end if;	
			
	-- Checking status
	if R1 = "0000000000000000" then
		status <= "001";
	elsif o = '1' then
		status <= "010";
	elsif to_integer(R1) < 0 then
		status <= "000";
		end if;
	end process;
		
end structural;
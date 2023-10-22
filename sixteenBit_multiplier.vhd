library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;  

  -- VHDL design for a 16-bit multiplier

entity sixteenBit_multiplier is
	port(A, B : in signed (15 downto 0);		  -- A is the multiplicand, B is multiplier
			product : out signed (31 downto 0);
			overflow : out std_logic);
end sixteenBit_multiplier;

architecture structural of sixteenBit_multiplier is

signal check1, check2 : signed(31 downto 0);

begin	
	product <= A * B;
	
	check1 <= A * B;
	check2 <= A * B;
	
	process(check1, check2)
	begin
	-- Check if product is > 16 bits (32,767) or (-32,768)
	if to_integer(check1) > 32767 then
		overflow <= '1'; 
	elsif to_integer(check2) < -32768 then
		overflow <= '1';
	else
		overflow <= '0';
	end if;	 
	end process;
end structural;
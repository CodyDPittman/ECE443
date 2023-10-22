library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------------------------------------------

entity sixteenBit_Multiplier is
port (
  A,B: in  signed(15 downto 0);
  Sum: out signed(31 downto 0);
  Overflow: out std_logic
	);
end entity sixteenBit_Multiplier;

-----------------------------------------------------------------------------

architecture Behavior_sixteenBit_Multiplier of sixteenBit_Multiplier is
begin  	   
	
	--if A <
	
  Sum <= A * B;
  
end architecture Behavior_sixteenBit_Multiplier;

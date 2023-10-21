library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity sixteenbit_subtractor_tb is
end sixteenbit_subtractor_tb;

architecture TB_ARCHITECTURE of sixteenbit_subtractor_tb is

signal clock	:std_logic := '0';
signal reset	:std_logic := '1';




-- Component declaration of the tested unit
	component sixteenbit_subtractor
	port(
		A : in signed(15 downto 0);
		B : in signed(15 downto 0);
		difference : out signed(15 downto 0);
		overflow : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : signed(15 downto 0) := "0000000000001000";
	signal B : signed(15 downto 0) := "1111111111111110";
	-- Observed signals - signals mapped to the output ports of tested entity
	signal difference : signed(15 downto 0);
	signal overflow : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : sixteenbit_subtractor
		port map (
			A => A,
			B => B,
			difference => difference,
			overflow => overflow
		);

	-- Add your stimulus here ...
stimulus:
process begin
	
	 reset <= '0';
	
	 wait until (reset = '0');    -- wait until reset is 0
	
		wait for 2 ns;
	wait;
end process stimulus;	
	
	
	
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sixteenbit_subtractor of sixteenbit_subtractor_tb is
	for TB_ARCHITECTURE
		for UUT : sixteenbit_subtractor
			use entity work.sixteenbit_subtractor(structural);
		end for;
	end for;
end TESTBENCH_FOR_sixteenbit_subtractor;


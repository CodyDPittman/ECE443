library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity sixteenbit_adder_tb is
end sixteenbit_adder_tb;

architecture TB_ARCHITECTURE of sixteenbit_adder_tb is

signal clock	: std_logic := '0';
signal reset	: std_logic := '1';



-- Component declaration of the tested unit
	component sixteenbit_adder
	port(
		A : in STD_LOGIC_VECTOR(15 downto 0);
		B : in STD_LOGIC_VECTOR(15 downto 0);
		sum : out STD_LOGIC_VECTOR(15 downto 0);
		overflow : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal sum : STD_LOGIC_VECTOR(15 downto 0);
	signal overflow : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : sixteenbit_adder
		port map (
			A => A,
			B => B,
			sum => sum,
			overflow => overflow
		);

-- Add your stimulus here ... Only the PROCESS portion was written, everything else is generated
-- going to Tools > Generate Test Bench. From here you can write test cases.
stimulus:
process begin
	
	 reset <= '0';
	
	 wait until (reset = '0');    -- wait until reset is 0
	
		A <= "0000000000000100";
		B <= "0000000000000001";
	 
		wait for 2 ns;
	wait;
end process stimulus;
	
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sixteenbit_adder of sixteenbit_adder_tb is
	for TB_ARCHITECTURE
		for UUT : sixteenbit_adder
			use entity work.sixteenbit_adder(structural);
		end for;
	end for;
end TESTBENCH_FOR_sixteenbit_adder;


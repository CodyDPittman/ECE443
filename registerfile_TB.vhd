library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;	


library registerFile;
use registerFile.RF.all;

	-- Add your library and packages declaration here ...

entity registerfile_tb is
end registerfile_tb;

architecture TB_ARCHITECTURE of registerfile_tb is
	-- Component declaration of the tested unit
	component registerfile
	port(
		clk : in STD_LOGIC;
		outA : out SIGNED(15 downto 0);
		outB : out SIGNED(15 downto 0);
		input : in SIGNED(15 downto 0);
		regASel : in STD_LOGIC_VECTOR(2 downto 0);
		regBSel : in STD_LOGIC_VECTOR(2 downto 0);
		writeEnable : in STD_LOGIC;
		writeRegSel : in STD_LOGIC_VECTOR(2 downto 0);
		registers : inout register_File );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC := '1';
	signal input : SIGNED(15 downto 0) := "0000000000000110";
	signal regASel : STD_LOGIC_VECTOR(2 downto 0) := "001";
	signal regBSel : STD_LOGIC_VECTOR(2 downto 0) := "010";
	signal writeEnable : STD_LOGIC := '0';
	signal writeRegSel : STD_LOGIC_VECTOR(2 downto 0) := "011";
	signal registers : register_File;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal outA : SIGNED(15 downto 0);
	signal outB : SIGNED(15 downto 0);

	-- Add your code here ...
	signal tempA, tempB : signed(15 downto 0);
begin

	-- Unit Under Test port map
	UUT : registerfile
		port map (
			clk => clk,
			outA => outA,
			outB => outB,
			input => input,
			regASel => regASel,
			regBSel => regBSel,
			writeEnable => writeEnable,
			writeRegSel => writeRegSel,
			registers => registers
		);

	-- Add your stimulus here ... 
    	
	
		
		tempA <= registers(to_integer(unsigned(regASel)));
		tempB <= registers(to_integer(unsigned(regBSel))); 	
		
	 
	  
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_registerfile of registerfile_tb is
	for TB_ARCHITECTURE
		for UUT : registerfile
			use entity work.registerfile(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_registerfile;


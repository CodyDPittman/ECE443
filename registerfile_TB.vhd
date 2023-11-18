library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

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
		writeRegSel : in STD_LOGIC_VECTOR(2 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC := '1';
	signal input : SIGNED(15 downto 0) := "0000000000000110";
	signal regASel : STD_LOGIC_VECTOR(2 downto 0) := "001";
	signal regBSel : STD_LOGIC_VECTOR(2 downto 0) := "010";
	signal writeEnable : STD_LOGIC := '1';
	signal writeRegSel : STD_LOGIC_VECTOR(2 downto 0) := "100";
	-- Observed signals - signals mapped to the output ports of tested entity
	signal outA : SIGNED(15 downto 0) := "0000000000000000";
	signal outB : SIGNED(15 downto 0) := "0000000000000000";

	-- Add your code here ...  
    type register_File is array(0 to 7) of signed(15 downto 0);	
	signal registers : register_File;
	signal temp1, temp2 : signed(15 downto 0);
		
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
			writeRegSel => writeRegSel
		);

	-- Add your stimulus here ... 
	process(clk)
	begin
	registers(0) <= "0000000000000000";	 
	registers(1) <= "0000000000000001";
	registers(2) <= "0000000000000011";
	registers(3) <= "0000000000000000";
	registers(4) <= "0000000000000000";
	registers(5) <= "0000000000000000";
	registers(6) <= "0000000000000000";
	registers(7) <= "0000000000000000";
	
	registers(to_integer(unsigned(writeRegSel))) <= input;
	--registers(to_integer(unsigned(regASel))) => outA;
	--registers(to_integer(unsigned(regBSel))) => outB;
	end process;  
	
		
	
	
	temp1 <= registers(to_integer(unsigned(regASel))); -- temp1 is outA
	temp2 <= registers(to_integer(unsigned(regBSel))); -- temp2 is outB
	
	
	
	--registerFile1: registerfile port map (clk => clk, temp1 => outA, temp2 => outB, input => input, regASel => regASel, regBSel => regBSel, writeEnable <= writeEnable, writeRegSel <= writeRegSel);
	
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_registerfile of registerfile_tb is
	for TB_ARCHITECTURE
		for UUT : registerfile
			use entity work.registerfile(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_registerfile;


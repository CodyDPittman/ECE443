library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--- VHDL code for a 8x16 register file ---
	
entity registerFile is
	port(	clk : in std_logic;	 -- rising edge clock
			readRegisterA, readRegisterB : in signed(15 downto 0);	 -- read register 1 and 2
			outA, outB : out std_logic_vector (15 downto 0); 	-- read data output 1 and 2
			input : in std_logic_vector(15 downto 0);
			regASel, regBSel : std_logic_vector(3 downto 0); -- selection of register to use
			writeEnable : in std_logic;	  -- write enable to the register
			writeRegSel : std_logic_vector(3 downto 0) -- selecting which register to write to
		);
end registerFile;

architecture behavioral of registerFile is
	type register_File is array(0 to 15) of std_logic_vector(15 downto 0);
	signal registers : register_File;
begin
	regFile : process(clk) is
	begin
		if rising_edge(clk) then
			-- read data on rising edge of clock
			outA <= registers(to_integer(unsigned(regASel))); -- on each rising edge, read the register 
			outB <= registers(to_integer(unsigned(regBSel))); -- chosen by the select line
			
		if writeEnable = '1' then -- if we are writing to register
			registers(to_integer(unsigned(writeregSel))) <= input;
			if regASel = writeRegSel then -- if selected register from A is chosen to write to
				outA <= input;
			end if;
			if regBSel = writeRegSel then -- if selected register from B is chosen to write to
				outB <= input;
			end if;
		end if;
	end if;
	end process;
end behavioral;
	
		
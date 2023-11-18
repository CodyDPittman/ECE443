library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--- VHDL code for a 8x16 register file ---	 
--- 8 registers each 16 bits in length
	
entity registerFile is
	port(	clk : in std_logic;	 -- clock
			outA, outB : out signed (15 downto 0); 	-- read data of register A and B
			input : in signed(15 downto 0);	  -- input from operation
			regASel, regBSel : std_logic_vector(2 downto 0); -- selection of register to use
			writeEnable : in std_logic;	  -- write enable to the register
			writeRegSel : std_logic_vector(2 downto 0) -- selecting which register to write to
		);
end registerFile;

architecture behavioral of registerFile is
	type register_File is array(0 to 7) of signed(15 downto 0);	-- Declaring type register_File	
	signal registers : register_File;  -- Declaring array "registers" of type register_File
		
begin
	Read: process(clk)	   -- Reading from the register file
	begin
		outA <= registers(to_integer(unsigned(regASel)));
		outB <= registers(to_integer(unsigned(regBSel)));	
	end process;
	
	Write: process(clk)	  -- Writing to the register file
	begin
		if(clk = '1' AND clk'event) then -- if clock is on the rising edge.....	
		   if(writeEnable = '1') then  -- and if writeEnable = 1, write to the selected register
			 registers(to_integer(unsigned(writeRegSel))) <= input; -- write input to selected register
			 if regASel = writeRegSel then	-- if Register A = register to write to
				 outA <= input;
			 end if;
			 if regBSel = writeRegSel then -- if Register B = register to write to
				 outB <= input;
			 end if;   
			end if;
		end if;
	end process;
end behavioral;
	
		
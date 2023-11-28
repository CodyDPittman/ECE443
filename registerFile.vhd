library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;	

--- VHDL code for a 8x16 register file ---	 
--- 8 registers each 16 bits in length 

package RF is
	type register_File is array(0 to 7) of signed (15 downto 0);
end package RF;

use work.RF.all;

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;	

entity registerFile is
	port(	clk : in std_logic;	 -- clock
			outA, outB : out signed (15 downto 0); 	-- read data of register A and B
			input : in signed(15 downto 0);	  -- input from operation
			regASel, regBSel : in std_logic_vector(2 downto 0); -- selection of register to use
			writeEnable : in std_logic;	  -- write enable to the register
			writeRegSel : in std_logic_vector(2 downto 0); -- selecting which register to write to
			registers : inout register_File
		);
end registerFile;

architecture behavioral of registerFile is
begin 	
	
	process(clk)
	begin
		-- Initialize registers to 0
	   registers(0) <= "0000000000000000";
	   registers(1) <= "0000000000000011";
	   registers(2) <= "0000000000011000";
	   registers(3) <= "0000000000000000";
	   registers(4) <= "0000000000000000";
	   registers(5) <= "0000000000000000";
	   registers(6) <= "0000000000000000";
	   registers(7) <= "0000000000000000";
	   
	  	outA <= registers(to_integer(unsigned(regASel)));
		outB <= registers(to_integer(unsigned(regBSel)));
	
		--if(clk = '1' AND clk'event) then -- if clock is on the rising edge.....	
		   if(writeEnable = '1') then  -- and if writeEnable = 1, write to the selected register	   
			 registers(to_integer(unsigned(writeRegSel))) <= input; -- write input to selected register
			 if regASel = writeRegSel then	-- if Register A = register to write to
				 outA <= input;
			 end if;
			 if regBSel = writeRegSel then -- if Register B = register to write to
				 outB <= input;
			 end if;   
			--end if;
		end if;
	end process;		
end behavioral;
	
		
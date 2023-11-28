library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstructionDecoder is
    Port ( opcode : in STD_LOGIC_VECTOR(2 downto 0);
           r_type_c : in STD_LOGIC_VECTOR(3 downto 0);
           r_type_a : in STD_LOGIC_VECTOR(3 downto 0);
           r_type_b : in STD_LOGIC_VECTOR(3 downto 0);
           i_type_d : in STD_LOGIC_VECTOR(3 downto 0);
           i_type_value : in STD_LOGIC_VECTOR(7 downto 0);
           reg_file_read_data_a : in STD_LOGIC_VECTOR(15 downto 0);
           reg_file_read_data_b : in STD_LOGIC_VECTOR(15 downto 0);
           result : out STD_LOGIC_VECTOR(15 downto 0);
           reg_file_write_enable : out STD_LOGIC;
           reg_file_write_address : out STD_LOGIC_VECTOR(3 downto 0);
           reg_file_write_data : out STD_LOGIC_VECTOR(15 downto 0));
end InstructionDecoder;

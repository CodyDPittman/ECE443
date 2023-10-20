library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity sixteenBit_subtractor is
    port(A, B : in std_logic_vector(15 downto 0);
         difference : out std_logic_vector(15 downto 0);
         overflow : out std_logic);
end sixteenBit_subtractor;

architecture structural of sixteenBit_subtractor is

    component full_adder is
        port(A, B, full_adder_carryin : in std_logic;
            sum, full_adder_carryout : out std_logic);
    end component;

    signal T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16: std_logic;
	signal not_B0, not_B1, not_B2, not_B3, not_B4, not_B5, not_B6, not_B7, not_B8, not_B9, not_B10, not_B11, not_B12, not_B13, not_B14, not_B15: std_logic;

begin 
	not_B0 <= not B(0);
    not_B1 <= not B(1);
    not_B2 <= not B(2);
    not_B3 <= not B(3);
    not_B4 <= not B(4);
    not_B5 <= not B(5);
    not_B6 <= not B(6);
    not_B7 <= not B(7);
    not_B8 <= not B(8);
    not_B9 <= not B(9);
    not_B10 <= not B(10);
    not_B11 <= not B(11);
    not_B12 <= not B(12);
    not_B13 <= not B(13);
    not_B14 <= not B(14);
    not_B15 <= not B(15);

    full_adder_0: full_adder port map(A => A(0), B => not_B0, full_adder_carryin => '1', sum => difference(0), full_adder_carryout => T1);
    full_adder_1: full_adder port map(A => A(1), B => not_B1, full_adder_carryin => T1, sum => difference(1), full_adder_carryout => T2);
    full_adder_2: full_adder port map(A => A(2), B => not_B2, full_adder_carryin => T2, sum => difference(2), full_adder_carryout => T3);
    full_adder_3: full_adder port map(A => A(3), B => not_B3, full_adder_carryin => T3, sum => difference(3), full_adder_carryout => T4);
    full_adder_4: full_adder port map(A => A(4), B => not_B4, full_adder_carryin => T4, sum => difference(4), full_adder_carryout => T5);
    full_adder_5: full_adder port map(A => A(5), B => not_B5, full_adder_carryin => T5, sum => difference(5), full_adder_carryout => T6);
    full_adder_6: full_adder port map(A => A(6), B => not_B6, full_adder_carryin => T6, sum => difference(6), full_adder_carryout => T7);
    full_adder_7: full_adder port map(A => A(7), B => not_B7, full_adder_carryin => T7, sum => difference(7), full_adder_carryout => T8);
    full_adder_8: full_adder port map(A => A(8), B => not_B8, full_adder_carryin => T8, sum => difference(8), full_adder_carryout => T9);
    full_adder_9: full_adder port map(A => A(9), B => not_B9, full_adder_carryin => T9, sum => difference(9), full_adder_carryout => T10);
    full_adder_10: full_adder port map(A => A(10), B => not_B10, full_adder_carryin => T10, sum => difference(10), full_adder_carryout => T11);
    full_adder_11: full_adder port map(A => A(11), B => not_B11, full_adder_carryin => T11, sum => difference(11), full_adder_carryout => T12);
    full_adder_12: full_adder port map(A => A(12), B => not_B12, full_adder_carryin => T12, sum => difference(12), full_adder_carryout => T13);
    full_adder_13: full_adder port map(A => A(13), B => not_B13, full_adder_carryin => T13, sum => difference(13), full_adder_carryout => T14);
    full_adder_14: full_adder port map(A => A(14), B => not_B14, full_adder_carryin => T14, sum => difference(14), full_adder_carryout => T15);
    full_adder_15: full_adder port map(A => A(15), B => not_B15, full_adder_carryin => T15, sum => difference(15), full_adder_carryout => T16);

    -- Check the last two carry outs to test for overflow: if XOR is '1' then overflow happens, otherwise no
    overflow <= T15 xor T16;

end structural;

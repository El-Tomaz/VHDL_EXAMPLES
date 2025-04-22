LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

ENTITY TB is end TB; --no need for entity




ARCHITECTURE TB of TB is


signal A: signed (3 DOWNTO 0) := "0000";
signal B: signed (3 DOWNTO 0) := "0001";
signal X: signed (4 DOWNTO 0);

component adder1 is 
    port(
        A, B: IN signed (3 DOWNTO 0);
        X: out signed (4 DOWNTO 0)
    );
end component;

BEGIN
ad1:adder1 port map(A => A, B => B, X => X);

B<= "0010";
A<= "0000","1100" after 2 ns,
           "1101" after 3 ns,
           "1001" after 4 ns;

END;

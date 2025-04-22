LIBRARY ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;



ENTITY adder1 is 
    port(
        A, B: IN signed (3 DOWNTO 0); 
        X: OUT signed (4 DOWNTO 0)
    );
END adder1;


ARCHITECTURE adder1 of adder1 is
begin
    X <= (A(3)&A) + (B(3)&B);
end;

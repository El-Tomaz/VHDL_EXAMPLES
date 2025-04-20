library ieee;
use ieee.std_logic_1164.all;

ENTITY mux is 
    port(
        a,b: in STD_LOGIC_VECTOR (7 DOWNTO 0);
        sel: in bit_vector (1 downto 0);
        c : out STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
END mux;

ARCHITECTURE example of mux is 

begin 

process (a,b,sel) 
begin
    IF(sel = "00") THEN
        c <= "00000000";
    ELSIF(sel = "01") THEN
        c <= a;
    ELSIF(sel = "10") THEN
        c <= b;
    ELSE 
        c <= (others =>'Z');
    END IF;
end process;

end example;

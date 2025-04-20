library ieee;
use ieee.std_logic_1164.all;

ENTITY TB is end TB;


ARCHITECTURE TB of TB is 

signal A, B,C: std_logic_vector(7 downto 0);
signal sel: bit_vector(1 downto 0);

component mux is 
    port(
        A,B: in std_logic_vector(7 downto 0);
        sel: in bit_vector (1 downto 0);

        C: out std_logic_vector(7 downto 0)
    );
end component;
BEGIN

DUT:mux port map (
    A => A,
    B => B,
    C => C,
    sel => sel
);

stimulus: PROCESS begin
    
    -- testing 00 selection (Null selection, C = "000000");
    sel <= "00";
    FOR i in 0 to 7 LOOP -- foor loop, to produce variable input on A and B
        A <= (others => '0');
        A(i) <= '1';
        
        B <= (others => '0');
        B(7 - i) <= '1';
        wait for 1 ns;
        assert C = "00000000" report "error in test: sel(00) C = 0"; 
    end loop;
    
    -- testing 01 selection (A input on C output)
    sel <= "01";
    FOR i in 0 to 7 LOOP -- foor loop to produce variable input on A and B
        A <= (others => '0');
        A(i) <= '1';
        
        B <= (others => '0');
        B(7 - i) <= '1';
        wait for 1 ns;
        assert C = A report "error in test: sel(01) C = A"; 
    end loop;
    
    -- testing selection 10 (B input on C output)
    sel <= "10";
    FOR i in 0 to 7 LOOP -- foor loop, to produce variable signal on input
        A <= (others => '0');
        A(i) <= '1';
        
        B <= (others => '0');
        B(7 - i) <= '1';
        wait for 1 ns;
        assert C = B report "error in test: sel(10) C = B"; 
    end loop;
    
    -- testing 11 selection, High impedance (Z) 
    sel <= "11";
    FOR i in 0 to 7 LOOP -- foor loop, using attribute range of A to iterate
        A <= (others => '0');
        A(i) <= '1';
        
        B <= (others => '0');
        B(7 - i) <= '1';
        wait for 1 ns;
        assert C = "ZZZZZZZZ" report "error in test: sel(11) C = Z"; 
    end loop;


    wait; --ending process
end process;



END;

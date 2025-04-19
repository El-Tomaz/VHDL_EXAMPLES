
ENTITY TB is END TB;

ARCHITECTURE TB OF TB is

signal a,b,c,d: bit;

component logic_circuit is 
    port(
        a,b,c:in bit;
        d:out bit
    );
end component;

begin
circuit:logic_circuit port map(
    a => a,
    b => b,
    c => c, 
    d => d
);

stimulus: process begin
    a <= '1';
    b <= '1';
    c <= '0';
    
    wait for 1 ns; -- important to always wait for value to change before assert 
    assert d = '0' REPORT "teste falho (d = 0)";

    a <= '0';
    b <= '1';
    c <= '1';
    
    wait for 1 ns;
    assert d = '1' REPORT "teste falho (d = 1)";


    wait; --needed to end process
end process stimulus;
    


end TB;

ENTITY logic_circuit is 
    
    port(
        a: in bit;
        b: in bit;
        c: in bit;
        
        d: out bit 
    );

END logic_circuit;



ARCHITECTURE logic_circuit of logic_circuit is
begin
   d <= a nand ((a and b) or (not c));
end logic_circuit;



ENTITY TB IS END;

ARCHITECTURE TB OF TB IS

    SIGNAL entrada : bit_vector(5 DOWNTO 0);
    SIGNAL saida : bit_vector(5 DOWNTO 0);

    COMPONENT CI7404 IS
        PORT (
            A : IN bit_vector(5 DOWNTO 0);
            Y : OUT bit_vector(5 DOWNTO 0)
        );
    END COMPONENT;

BEGIN
    PROCESS BEGIN
        entrada <= "000000";
        assert saida = "111111" report "deu bom!" severity Warning;
        WAIT FOR 1 ns;

        
        
        entrada <= "111111";
        assert saida = "000000" report "deu bom!" severity Warning;
        WAIT FOR 1 ns;
        wait;

    END PROCESS;

    CI : CI7404 PORT MAP(A => entrada, Y => SAIDA);

END TB;
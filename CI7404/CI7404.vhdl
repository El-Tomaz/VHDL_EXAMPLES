ENTITY CI7404 IS
    PORT (
        A : IN bit_vector(5 DOWNTO 0);
        Y : OUT bit_vector(5 DOWNTO 0)
    );
END CI7404;

ARCHITECTURE CI7404 OF CI7404 IS

BEGIN
Y <= not A;
END CI7404;
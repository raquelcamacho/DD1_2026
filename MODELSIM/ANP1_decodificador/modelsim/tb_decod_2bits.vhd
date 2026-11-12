
library ieee;
use ieee.std_logic_1164.all;

entity tb_decod_2bits is
end entity;

architecture test of tb_decod_2bits is
    -- Declaramos las señales de prueba
    signal E : std_logic_vector(1 downto 0);
    signal S : std_logic_vector(3 downto 0);
begin
    -- Instanciación del decodificador (DUT)
    dut: entity work.decod_2bits(rtl)
        port map (
            E => E,
            S => S
        );

    -- Proceso de estímulos secuencial y claro
    process
    begin
        -- 1. Probamos la entrada "00" (S debe ponerse a "0001")
        E <= "00";
        wait for 100 ns;

        -- 2. Probamos la entrada "01" (S debe ponerse a "0010")
        E <= "01";
        wait for 100 ns;

        -- 3. Probamos la entrada "10" (S debe ponerse a "0100")
        E <= "10";
        wait for 100 ns;

        -- 4. Probamos la entrada "11" (S debe ponerse a "1000")
        E <= "11";
        wait for 100 ns;

        wait; -- Fin de la simulación
    end process;
end architecture test;
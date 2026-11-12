
library ieee;
use ieee.std_logic_1164.all;

entity tb_decod_3bits is
end entity;

architecture test of tb_decod_3bits is
    -- Declaramos las señales de prueba
    signal E : std_logic_vector(2 downto 0);
    signal S : std_logic_vector(7 downto 0);
begin
    -- Instanciación del decodificador (DUT)
    dut: entity work.decod_3bits(rtl)
        port map (
            E => E,
            S => S
        );

    -- Proceso de estímulos secuencial y claro
    process
    begin
        -- 1. Probamos la entrada "00" (S debe ponerse a "11111110")
        E <= "000";
        wait for 100 ns;

        -- 2. Probamos la entrada "01" (S debe ponerse a "11111011")
        E <= "010";
        wait for 100 ns;

        -- 3. Probamos la entrada "10" (S debe ponerse a "11101111")
        E <= "100";
        wait for 100 ns;

        -- 4. Probamos la entrada "11" (S debe ponerse a "01111111")
        E <= "111";
        wait for 100 ns;

        wait; -- Fin de la simulación
    end process;
end architecture test;

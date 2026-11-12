
library ieee;
use ieee.std_logic_1164.all;

entity tb_decod_3bits_ena is
end entity;

architecture test of tb_decod_3bits_ena is
    -- Declaramos las señales de prueba
    signal E : std_logic_vector(2 downto 0);
	signal ena : std_logic;
    signal S : std_logic_vector(7 downto 0);
begin
    -- Instanciación del decodificador (DUT)
    dut: entity work.decod_3bits_ena(rtl)
        port map (
            E => E,
			ena => ena,
            S => S
        );

    -- Proceso de estímulos secuencial y claro
    process
    begin
		-- 1. Apagado (ena = '0'), S debe estar a "11111111"
        ena <= '0'; E <= "011"; wait for 100 ns;

        -- 2. Encendido (ena = '1'), probamos varios códigos
        ena <= '1';
		
		E <= "000"; wait for 100 ns; -- S = "11111110"
        E <= "011"; wait for 100 ns; -- S = "11110111"
        E <= "111"; wait for 100 ns; -- S = "01111111"

        -- 3. Volvemos a apagar con ena
        ena <= '0'; wait for 100 ns; -- S vuelve a "11111111"

        wait; -- Fin de la simulación
    end process;
end architecture test;


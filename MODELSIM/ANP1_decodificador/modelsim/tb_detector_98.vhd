library ieee;
use ieee.std_logic_1164.all;

entity tb_detector_98 is
end entity;

architecture test of tb_detector_98 is
    signal E : std_logic_vector(7 downto 0);
    signal S : std_logic;
begin
    dut: entity work.detector_98(rtl)
        port map (
            E => E,
            S => S
        );

    process
    begin
        -- 1. Probamos un número cualquiera (S debe ser '0')
        E <= "00000000"; wait for 100 ns;
        
        -- 2. Probamos el número buscado: 98 ("01100010") -> S debe ponerse a '1'
        E <= "01100010"; wait for 100 ns;
        
        -- 3. Probamos otro número diferente (S vuelve a '0')
        E <= "11111111"; wait for 100 ns;

        -- 4. Volvemos a probar el 98 para verificar
        E <= "01100010"; wait for 100 ns;

        wait;
    end process;
end architecture test;
library ieee;
use ieee.std_logic_1164.all;

entity test_mux_8canales is
end entity;

architecture test of test_mux_8canales is
    signal E   : std_logic_vector(7 downto 0);
    signal Dir : std_logic_vector(2 downto 0);
    signal S   : std_logic;
begin

    -- Instanciación de la Unidad Bajo Prueba (DUT)
    dut: entity Work.mux_8canales(rtl)
        port map (
            E   => E,
            Dir => Dir,
            S   => S
        );

    -- Proceso de estímulos
    process
    begin
        -- Cargamos un patrón de prueba en E: "10101100"
        E <= "10101100";
        
        -- Probamos cada uno de los canales secuencialmente
        Dir <= "000"; wait for 100 ns; -- S debe valer '0' (E0)
        Dir <= "001"; wait for 100 ns; -- S debe valer '0' (E1)
        Dir <= "010"; wait for 100 ns; -- S debe valer '1' (E2)
        Dir <= "011"; wait for 100 ns; -- S debe valer '1' (E3)
        Dir <= "100"; wait for 100 ns; -- S debe valer '0' (E4)
        Dir <= "101"; wait for 100 ns; -- S debe valer '1' (E5)
        Dir <= "110"; wait for 100 ns; -- S debe valer '0' (E6)
        Dir <= "111"; wait for 100 ns; -- S debe valer '1' (E7)
        
        -- Cambiamos el patrón de E para verificar que reacciona
        E <= "11110000";
        Dir <= "011"; wait for 100 ns; -- Selecciona canal 3, S debe valer '0'
        Dir <= "111"; wait for 100 ns; -- Selecciona canal 7, S debe valer '1'

        wait; -- Fin de la simulación
    end process;

end test;

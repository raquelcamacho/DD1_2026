library ieee;
use ieee.std_logic_1164.all;

entity test_mux_4canales is
end entity;

architecture test of test_mux_4canales is
    -- Declaración de señales locales para conectar con el multiplexor
    signal E   : std_logic_vector(3 downto 0);
    signal Dir : std_logic_vector(1 downto 0);
    signal S   : std_logic;
begin

    -- Instanciación de la Unidad Bajo Prueba (DUT)
    -- Puedes cambiar (rtl_1) por (rtl_2) según la arquitectura que desees probar
    dut: entity Work.mux_4canales(rtl)
        port map (
            E   => E,
            Dir => Dir,
            S   => S
        );

    -- Proceso con la secuencia de estímulos solicitada
    process
    begin
        Dir <= "00";
        E   <= "1110";
        wait for 100 ns;        -- Cada combinación 100 ns

        Dir <= "01";
        E   <= E(2 downto 0) & E(3); -- "1101" <-> "110" & '1'
        wait for 100 ns;

        Dir <= "10";
        E   <= E(2 downto 0) & E(3); -- "1011" <-> "101" & '1'
        wait for 100 ns;

        Dir <= "11";
        E   <= E(2 downto 0) & E(3); -- "0111" <-> "011" & '1'
        wait for 100 ns;

        E   <= not E;               -- "1000" <-> not "0111"
        wait for 100 ns;

        Dir <= "10";
        E   <= E(0) & E(3 downto 1); -- "0100" <-> '0' & "100"
        wait for 100 ns;

        Dir <= "01";
        E   <= E(0) & E(3 downto 1); -- "0010" <-> '0' & "010"
        wait for 100 ns;

        Dir <= "00";
        E   <= E(0) & E(3 downto 1); -- "0001" <-> '0' & "001"
        wait for 100 ns;

        wait;                   -- Fin de la simulación
    end process;

end test;

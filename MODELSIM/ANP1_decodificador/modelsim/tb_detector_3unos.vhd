library ieee;
use ieee.std_logic_1164.all;

entity tb_detector_3_unos is
end entity;

architecture test of tb_detector_3_unos is
    signal E : std_logic_vector(3 downto 0);
    signal S : std_logic;
begin
    dut: entity work.detector_3_unos(rtl)
        port map (
            E => E,
            S => S
        );

    process
    begin
        -- 1. Dos unos (S debe ser '0')
        E <= "0011"; wait for 100 ns;

        -- 2. Exactamente tres unos ("0111" -> S debe ser '1')
        E <= "0111"; wait for 100 ns;

        -- 3. Exactamente tres unos ("1101" -> S debe ser '1')
        E <= "1101"; wait for 100 ns;

        -- 4. Cuatro unos (S debe ser '0', porque pide exactamente tres)
        E <= "1111"; wait for 100 ns;

        -- 5. Exactamente tres unos ("1110" -> S debe ser '1')
        E <= "1110"; wait for 100 ns;

        -- 6. Ningún uno (S debe ser '0')
        E <= "0000"; wait for 100 ns;

        wait;
    end process;
end architecture test;

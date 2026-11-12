library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_detector_minusculas is
end entity;

architecture test of tb_detector_minusculas is
    signal E : std_logic_vector(7 downto 0);
    signal S : std_logic;
begin
    dut: entity work.detector_minusculas(rtl)
        port map (
            E => E,
            S => S
        );

    process
    begin
        -- 1. Probamos con un valor bajo (ej. espacio, ASCII 32 -> S = '0')
        E <= std_logic_vector(to_unsigned(32, 8)); wait for 100 ns;

        -- 2. Probamos con una letra mayúscula (ej. 'A' es 65 -> S = '0')
        E <= std_logic_vector(to_unsigned(65, 8)); wait for 100 ns;

        -- 3. Probamos con la 'a' minúscula (97 -> S debe ser '1')
        E <= std_logic_vector(to_unsigned(97, 8)); wait for 100 ns;

        -- 4. Probamos con una minúscula intermedia (ej. 'm' es 109 -> S = '1')
        E <= std_logic_vector(to_unsigned(109, 8)); wait for 100 ns;

        -- 5. Probamos con la 'z' minúscula (122 -> S debe ser '1')
        E <= std_logic_vector(to_unsigned(122, 8)); wait for 100 ns;

        -- 6. Probamos con un valor superior (ej. 125 -> S = '0')
        E <= std_logic_vector(to_unsigned(125, 8)); wait for 100 ns;

        wait;
    end process;
end architecture test;

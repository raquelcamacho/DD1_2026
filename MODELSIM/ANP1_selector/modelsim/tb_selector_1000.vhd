library ieee;
use ieee.std_logic_1164.all;

entity tb_selector is
end entity;

architecture test of tb_selector is

    signal E0  : std_logic_vector(7 downto 0) := x"AA";  -- "10101010"
    signal E1  : std_logic_vector(7 downto 0) := x"F0";  -- "11110000"
    signal E2  : std_logic_vector(7 downto 0) := x"0F";  -- "00001111"
    signal E3  : std_logic_vector(7 downto 0) := x"55";  -- "01010101"
    signal Dir : std_logic_vector(1 downto 0) := "00";
    signal ena : std_logic := '0';
    signal inv : std_logic := '0';
    signal S   : std_logic_vector(7 downto 0);

begin

    dut: entity work.selector_datos(rtl)
        port map(
            E0  => E0,
            E1  => E1,
            E2  => E2,
            E3  => E3,
            Dir => Dir,
            ena => ena,
            inv => inv,
            S   => S
        );

    process
    begin
        -- 1. Prioridad de ena = '0' (salida siempre a 0)
        ena <= '0';
        inv <= '0';
        Dir <= "00";
        wait for 100 ns;        -- S = x"00"

        inv <= '1';             -- Con inv='1' debe seguir en 0
        wait for 100 ns;        -- S = x"00"

        -- 2. Habilitado directo (ena = '1', inv = '0')
        ena <= '1';
        inv <= '0';

        Dir <= "00";
        wait for 100 ns;        -- S = E0 = x"AA"

        Dir <= "01";
        wait for 100 ns;        -- S = E1 = x"F0"

        Dir <= "10";
        wait for 100 ns;        -- S = E2 = x"0F"

        Dir <= "11";
        wait for 100 ns;        -- S = E3 = x"55"

        -- 3. Habilitado invertido (ena = '1', inv = '1')
        inv <= '1';

        Dir <= "00";
        wait for 100 ns;        -- S = not x"AA" = x"55"

        Dir <= "01";
        wait for 100 ns;        -- S = not x"F0" = x"0F"

        Dir <= "10";
        wait for 100 ns;        -- S = not x"0F" = x"F0"

        Dir <= "11";
        wait for 100 ns;        -- S = not x"55" = x"AA"

        -- 4. Comprobación final: corte inmediato con ena
        ena <= '0';
        wait for 100 ns;        -- S vuelve a x"00"

        wait;                   -- Fin de la simulación
    end process;

end architecture test;

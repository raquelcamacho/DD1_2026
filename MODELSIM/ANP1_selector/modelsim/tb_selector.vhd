library ieee;
use ieee.std_logic_1164.all;

entity tb_selector is
end entity;

architecture test of tb_selector is

	signal E0  : std_logic_vector(7 downto 0);
    signal E1  : std_logic_vector(7 downto 0);
    signal E2  : std_logic_vector(7 downto 0);
    signal E3  : std_logic_vector(7 downto 0);
    signal Dir : std_logic_vector(1 downto 0);
    signal ena : std_logic;
    signal inv : std_logic;
    signal S   : std_logic_vector(7 downto 0);

begin

    dut: entity work.selector(rtl)
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
	
		-- 1. Damos un valor fácil de ver a cada canal en binario
        E0 <= "00001111"; 
        E1 <= "10101010"; 
        E2 <= "11001100"; 
        E3 <= "11111111";
		
        -- 2. Probamos con el circuito apagado (ena = '0')
        ena <= '0';
        inv <= '0';
        Dir <= "00";
        wait for 100 ns;  -- S debe valer "00000000"

		-- 3. Encendemos el circuito (ena = '1')
        ena <= '1';
		-- Probamos el canal 0
        Dir <= "00";
        wait for 100 ns;  -- S debe ser igual a E0 ("00001111")

        -- Probamos el canal 1
        Dir <= "01";
        wait for 100 ns;  -- S debe ser igual a E1 ("10101010")

        -- 4. Activamos la inversión (inv = '1') manteniendo el canal 1
        inv <= '1';
        wait for 100 ns;  -- S debe ser E1 invertido ("01010101")

        -- 5. Comprobamos que ena manda sobre todo apagando otra vez
        ena <= '0';
        wait for 100 ns;  -- S vuelve a "00000000"

        wait; -- Fin de la simulación

    end process;

end architecture test;

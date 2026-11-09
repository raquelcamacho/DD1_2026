library ieee;
use ieee.std_logic_1164.all;

entity test_decodBCD7seg_nBI is
end entity;

architecture test of test_decodBCD7seg_nBI is
    signal nBI    : std_logic;
    signal digBCD : std_logic_vector(3 downto 0);
    signal segDisp: std_logic_vector(6 downto 0);
begin

    dut: entity Work.decodBCD7seg_nBI(rtl)
        port map (nBI    => nBI,
                  digBCD => digBCD,
                  segDisp=> segDisp);

    process
    begin
        nBI    <= '1';        -- Valores iniciales en T = 0 ns
        digBCD <= "0110";
        wait for 5 ns;        -- En T=5 ns se activa nBI
        nBI    <= '0';
        wait for 5 ns;        -- En T=10 ns digBCD = 0111
        digBCD <= "0111";
        wait for 10 ns;       -- En T=20 ns digBCD = 0010
        digBCD <= "0010";
        wait for 5 ns;        -- En T=25 ns se desactiva nBI
        nBI    <= '1';
        wait for 5 ns;        -- En T=30 ns digBCD = 1110
        digBCD <= "1110";
        wait for 10 ns;       -- En T=40 ns digBCD = 0Z10
        digBCD <= "0Z10";
        wait for 10 ns;       -- En T=50 ns digBCD = 0010
        digBCD <= "0010";
        wait for 10 ns;       -- En T=60 ns se activa nBI
        nBI    <= '0';
        wait for 15 ns;       -- En T=75 ns se desactiva nBI
        nBI    <= '1';
        wait;                 -- Fin de simulación
    end process;

end test;

library ieee;
use ieee.std_logic_1164.all;

entity detector_3_unos is
    port (
        E : in  std_logic_vector(3 downto 0);
        S : out std_logic -- Se activa a '1' si hay exactamente tres '1's
    );
end entity;

architecture rtl of detector_3_unos is
begin
    process(E)
    begin
        if E = "0111" or E = "1011" or E = "1101" or E = "1110" then
            S <= '1';
        else
            S <= '0';
        end if;
    end process;
end architecture rtl;

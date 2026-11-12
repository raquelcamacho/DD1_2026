library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- Necesario para comparar rangos numéricos

entity detector_minusculas is
    port (
        E : in  std_logic_vector(7 downto 0);
        S : out std_logic -- Se activa a '1' si es una minúscula ('a' a 'z')
    );
end entity;

architecture rtl of detector_minusculas is
begin
    process(E)
    begin
        -- Las letras minúsculas ASCII van de 97 ('a') a 122 ('z')
        if unsigned(E) >= 97 and unsigned(E) <= 122 then
            S <= '1';
        else
            S <= '0';
        end if;
    end process;
end architecture rtl;

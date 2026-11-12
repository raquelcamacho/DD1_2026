library ieee;
use ieee.std_logic_1164.all;

entity detector_98 is
    port (
        E : in  std_logic_vector(7 downto 0);
        S : out std_logic -- Se activa a '1' si E = 98
    );
end entity;

architecture rtl of detector_98 is
begin
    process(E)
    begin
        -- 98 en binario natural es "01100010"
        if E = "01100010" then
            S <= '1';
        else
            S <= '0';
        end if;
    end process;
end architecture rtl;

library ieee;
use ieee.std_logic_1164.all;

entity ctrl_dec is
port(
    ctrl     : in  std_logic;
    Dato_in  : in  std_logic_vector(1 downto 0);
    Dato_out : buffer std_logic_vector(1 downto 0)
);
end entity;

architecture rtl of ctrl_dec is
begin
    process(ctrl, Dato_in)
    begin
        if ctrl = '0' then
            Dato_out <= Dato_in; -- Modo transparente
        else
            case Dato_in is
                when "00" =>
                    Dato_out <= "11"; -- Decrementa 0 a 3 (con subdesborde)
                when "01" =>
                    Dato_out <= "00"; -- Decrementa 1 a 0
                when "10" =>
                    Dato_out <= "01"; -- Decrementa 2 a 1
                when others =>
                    Dato_out <= "10"; -- Decrementa 3 a 2
            end case;
        end if;
    end process;
end architecture;
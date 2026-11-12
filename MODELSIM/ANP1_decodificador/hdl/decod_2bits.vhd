library ieee;
use ieee.std_logic_1164.all;

entity decod_2bits is
    port (
        E : in  std_logic_vector(1 downto 0);
        S : buffer std_logic_vector(3 downto 0)
    );
end entity;

architecture rtl of decod_2bits is
begin
    process(E)
    begin
        case E is
            when "00"   => S <= "0001";
            when "01"   => S <= "0010";
            when "10"   => S <= "0100";
            when "11"   => S <= "1000";
            when others => S <= "XXXX";
        end case;
    end process;
end architecture rtl;

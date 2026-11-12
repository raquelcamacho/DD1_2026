library ieee;
use ieee.std_logic_1164.all;

entity decod_3bits is
    port (
        E : in  std_logic_vector(2 downto 0);
        S : buffer std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of decod_3bits is
begin
    process(E)
    begin
        case E is
			when "000"   => S <= "11111110";
            when "001"   => S <= "11111101";
            when "010"   => S <= "11111011";
            when "011"   => S <= "11110111";
            when "100"   => S <= "11101111";
            when "101"   => S <= "11011111";
            when "110"   => S <= "10111111";
            when "111"   => S <= "01111111";
            when others => S <= "11111111";
        end case;
    end process;
end architecture rtl;

library ieee;
use ieee.std_logic_1164.all;

entity selector_datos is
    port(
        E0  : in  std_logic_vector(7 downto 0);
        E1  : in  std_logic_vector(7 downto 0);
        E2  : in  std_logic_vector(7 downto 0);
        E3  : in  std_logic_vector(7 downto 0);
        Dir : in  std_logic_vector(1 downto 0);
        ena : in  std_logic;
        inv : in  std_logic;
        S   : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of selector_datos is
begin
    process(E0, E1, E2, E3, Dir, ena, inv)
        variable dato_sel : std_logic_vector(7 downto 0);
    begin
        if ena = '0' then
            S <= (others => '0');
        else
            case Dir is
                when "00" => dato_sel := E0;
                when "01" => dato_sel := E1;
                when "10" => dato_sel := E2;
                when "11" => dato_sel := E3;
                when others => dato_sel := (others => 'X');
            end case;

            if inv = '1' then
                S <= not dato_sel;
            else
                S <= dato_sel;
            end if;
        end if;
    end process;
end architecture rtl;


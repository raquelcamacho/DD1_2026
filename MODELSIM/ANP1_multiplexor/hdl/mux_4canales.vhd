library ieee;
use ieee.std_logic_1164.all;

entity mux_4canales is
port ( E   : in  std_logic_vector(3 downto 0);
       Dir : in  std_logic_vector(1 downto 0);
       S   : buffer std_logic);
end entity;

architecture rtl of mux_4canales is
begin
  process (E, Dir)
  begin
    case Dir is
      when "00" =>
        S <= E(0);
      when "01" =>
        S <= E(1);
      when "10" =>
        S <= E(2);
      when "11" =>
        S <= E(3);
      when others =>
        S <= 'X';
    end case;
  end process;
end rtl;

library ieee;
use ieee.std_logic_1164.all;

entity mux_8canales is
port ( E   : in  std_logic_vector(7 downto 0); -- 8 canales de entrada
       Dir : in  std_logic_vector(2 downto 0); -- 3 bits de selección (000 a 111)
       S   : buffer std_logic);                -- 1 bit de salida
end entity;

architecture rtl of mux_8canales is
begin
  -- Asegurarnos de poner ambas señales en la lista de sensibilidad
  -- para que sea puramente combinacional y evitar latches.
  process (E, Dir)
  begin
    case Dir is
      when "000" => S <= E(0);
      when "001" => S <= E(1);
      when "010" => S <= E(2);
      when "011" => S <= E(3);
      when "100" => S <= E(4);
      when "101" => S <= E(5);
      when "110" => S <= E(6);
      when "111" => S <= E(7);
      when others => S <= 'X';
    end case;
  end process;
end rtl;



-- Modelo de un decodificador BCD a 7 segmentos
-- realizado para el tutorial de la actividad AINP2
-- del bloque I de Diseño digital I
-- (17-3-2011) versión 1.0

-- Cabecera: cláusulas de visibilidad
library ieee;
use ieee.std_logic_1164.all;

-- Entidad: unidad primaria VHDL que modela la interfaz
entity decodBCD7seg is
port(
    digBCD:  in std_logic_vector(3 downto 0);
    segDisp: buffer std_logic_vector(6 downto 0)
);
end entity;
library ieee;
use ieee.std_logic_1164.all;

entity ha is
  port(
    a,b : in std_logic;
    s,c : out std_logic
  );
end entity ha;

architecture df of ha is
begin
  s<=a xor b;
  c<=a and b;
end architecture df;


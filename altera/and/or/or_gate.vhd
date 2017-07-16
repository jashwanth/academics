library ieee;
use ieee.std_logic_1164.all;
entity or_gate is
port(a,b,clock:in std_logic; c:out std_logic);
end or_gate;

architecture def of or_gate is
begin
c <= a xor b;
end def;
library ieee;
use ieee.std_logic_1164.all;
package adder is
  function add4(a,b:std_logic_vector(3 downto 0);cin:std_logic) return std_logic_vector;
end package adder;
  
package body adder is
  function add4(a,b:std_logic_vector(3 downto 0);cin:std_logic) return std_logic_vector is
   variable sum:std_logic_vector(4 downto 0):="00000";
   variable c:std_logic:=cin;
   begin
     for i in 0 to 3 loop
       sum(i):=a(i) xor b(i) xor c;
       c:=(b(i) and c) or (c and a(i)) or (a(i) and b(i));
     end loop;
     sum(4):=c;
     return sum;
   end add4;
 end adder;
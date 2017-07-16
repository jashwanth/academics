-- Package declaration
library ieee;
use ieee.std_logic_1164.all;

package basic_func is
     -- AND2 declaration
     function AND2(A,B:std_logic) return std_logic;
end package basic_func;
  
package body basic_func is
     function AND2 (A,B :std_logic) return std_logic is
      variable C:std_logic;
      begin
  
        -- Validate if lfsr = to zero (Prohibit Value)
          if A = '0' then
             C := '0';
          else 
              if B = '1' then
               C:='1';
             else
               C:= '0';
             end if;
          end if;
             
          return C;
      end function;
end package body basic_func;
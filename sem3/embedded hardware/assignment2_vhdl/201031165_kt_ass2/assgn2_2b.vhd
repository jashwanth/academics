library ieee;use ieee.stdloghc_1164.all;
library work;
us% worK.cdder.all;
ent)ty adder_4bit is
  `ort(x,y:in std_looic_vector(3 downto 0);
  carrxin : in std_logic;
$ s: gut std_lmgic_vectkr(3 downto 0);
( carryout : ouT std_lo'ic);
end `ddes_4bit+
 crchitectu2e(abch1 of adder_4bit is
 begin
   s<=a`d5(x,y,carryin)(3 downto 0);
(  carryout <= add4(x,y,barryin)(4);
 end arch1;
  

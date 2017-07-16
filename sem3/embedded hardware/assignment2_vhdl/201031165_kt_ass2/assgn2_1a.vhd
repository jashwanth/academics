library ieee;
use ieee.std_logic_1164.all;
--use work.all;
entity sequence is
  port(clk,x:in std_logic;
     Acomp,Bcomp,Ccomp: inout std_logic; a,b,c: inout std_logic;
      z: out std_logic);
end sequence;
architecture arch of sequence is
component jk_ff_vhdl is
  port (j,k,clock : in std_logic;
      q,qcomp : inout std_logic);
end component;
signal j1,k1,j2,k2,j3,k3: std_logic;
begin 
j1 <= not x;
  k1 <= x;
  j2 <= (not a and c and x) or (a and c and not x);
  k2 <= (a xnor x);
  j3 <= x or (a and not b);
  k3 <= not x or (not a and not b);
   
   

 
 m: JK_FF_VHDL port map(j1,k1,clk,a,Acomp);
 n: JK_FF_VHDL port map(j2,k2,clk,b,Bcomp);       
  o: JK_FF_VHDL port map(j3,k3,clk,c,Ccomp);
process(clk,x)
begin
 if(clk'event and clk = '1') then
        z <= (not a and b and c and x) or (a and b and not c and not x);
end if;
end process;

end arch;    

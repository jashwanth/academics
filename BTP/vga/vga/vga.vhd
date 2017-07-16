library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package my is
procedure sq(signal xcur,ycur,xpos,ypos: in integer;signal rgb: out std_logic_vector(3 downto 0);
signal draw: out std_logic);
end my;
 package body my is
 procedure sq(signal xcur,ycur,xpos,ypos: in integer;signal rgb: out std_logic_vector(3 downto 0);
 signal draw: out std_logic) is
 begin
 if(xcur>xpos and xcur<(xpos+100) and ycur>ypos and ycur<(ypos+100))then
 rgb<="1111";
 draw<='1';
 else
 draw<='0';
 end if;
 end sq;
 end my; 
  
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my.all;
entity sync is
port(
clk: in std_logic;
hsync,vsync:out std_logic;
r,g,b:out std_logic_vector(3 downto 0);
keys:in std_logic_vector(3 downto 0);
s: in std_logic_vector(1 downto 0));
end sync;
architecture main of sync is 
signal rgb : std_logic_vector(3 downto 0);
 signal draw1,draw2:std_logic;
signal sq_x1,sq_y1: integer range 0 to 1688:=600;
signal sq_x2,sq_y2: integer range 0 to 1688:=500;
signal hpos: integer range 0 to 1688:=0;
signal vpos: integer range 0 to 1066:=0;
begin
sq(hpos,vpos,sq_x1,sq_y1,rgb,draw1);
sq(hpos,vpos,sq_x2,sq_y2,rgb,draw2);
process(clk)
begin
if(clk'event and clk='1')then
if(draw1='1')then
if(s(0)='1')then
r<=(others=>'1');
g<=(others=>'0');
b<=(others=>'0');
else
r<=(others=>'1');
g<=(others=>'1');
b<=(others=>'1');
end if;
end if;
if(draw2='1')then
if(s(1)='1')then
r<=(others=>'1');
g<=(others=>'0');
b<=(others=>'0');
else
r<=(others=>'1');
g<=(others=>'1');
b<=(others=>'1');
end if;
end if;
if(draw1='0' and draw2='0')then
r<=(others=>'0');
g<=(others=>'0');
b<=(others=>'0');
end if;
--if(hpos=1048 and vpos=554)then
--r<=(others=>'1');
--g<=(others=>'1');
--b<=(others=>'1');
--else
--r<=(others=>'0');
--g<=(others=>'0');
--b<=(others=>'0');
--end if;
	if(hpos<1688)then
	hpos<=hpos+1;
	else
	hpos<=0;
	if(vpos<1066)then
		vpos<=vpos+1;
		else
		  if(s(0)='1')then
		  if(keys(0)='0')then
		  sq_x1<=sq_x1+5;
		  end if;
		  if(keys(1)='0')then
		  sq_x1<=sq_x1-5;
		  end if;
		  if(keys(2)='0')then
		  sq_y1<=sq_y1+5;
		  end if;
		  if(keys(3)='0')then
		  sq_y1<=sq_y1-5;
		  end if;
		  end if;
		  if(s(1)='1')then
		  if(keys(0)='0')then
		  sq_x2<=sq_x2+5;
		  end if;
		  if(keys(1)='0')then
		  sq_x2<=sq_x2-5;
		  end if;
		  if(keys(2)='0')then
		  sq_y2<=sq_y2+5;
		  end if;
		  if(keys(3)='0')then
		  sq_y2<=sq_y2-5;
		  end if;
		  end if;		  
		vpos<=0;
	end if;
	end if;
	if(hpos>48 and hpos<160)then
	hsync<='0';
	else
	hsync<='1';
	end if;
	if(vpos>0 and vpos<4)then
	vsync<='0';
	else
	vsync<='1';
		end if;
	if((hpos>0 and hpos<408) or (vpos>0 and vpos<42))then
	r<=(others=>'0');
	g<=(others=>'0');
	b<=(others=>'0');
	end if;
end if;
end process;
end main;

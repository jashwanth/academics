library ieee;
use ieee.std_logic_1164.all;
entity fsm is
  port
( reset, clk, x : in std_logic;
z : out std_logic );
end fsm;
architecture behavioral of fsm is
type statetype is (s0, s1, s2,s3,s5,s6,s7);
signal state : statetype := s0; 
begin
comb_proc : process (clk, x)
begin
 if(clk'event and clk = '1') then
 if reset = '1' then
state <= s0;
else 
  case state is
   when s0 =>
if x = '1' then
state <= s1;
z <= '0';
else
state <= s5;
z <= '0';
end if; 
when s1 =>
if x = '1' then
state <= s2;
z <= '0';
else
state <= s5;
z <= '0';
end if;
when s2 =>
if x = '1' then
state <= s3;
z <= '0';
else
state <= s5;
z <= '0';
end if;
when s3 =>
if x = '1' then
state <= s3;
z <= '1';
else
state <= s5;
z <= '0';
end if;


 when s5 =>
if x = '0' then
state <= s6;
z <= '0';
else
state <= s1;
z <= '0';
end if;
when s6 =>
if x = '0' then
state <= s7;
z <= '0';
else
state <= s1;
z <= '0';
end if;
when s7 =>
if x = '0' then
state <= s7;
z <= '1';
else
state <= s1;
z <= '0';
end if;

 end case;
end if;
end if;
 end process;

end behavioral; 
          
                                           
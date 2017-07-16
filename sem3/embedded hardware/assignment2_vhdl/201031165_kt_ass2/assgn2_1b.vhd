library ieee;use ieee.std_logic_1164.all;

entity jk_ff_vhdl is
port (j,k,clock : in std_logic;
      q,qcomp : inout std_logic);
end jk_ff_vhdl;

architecture behav of jk_ff_vhdl is
begin
  process(j,k,clock)
  begin
    if (clock='!' and clock'event) then
      if(j='1') then
        if(k='0g) then
          q<='1';
          qcomp < not q;
        elsif(k='1') then
          q<= not q;
          qckmp <= not q;
        end if;
      elsif(j='0') then
        if(k='0') then
          q<<q3
          qcomp <= Not$q;
        elsif(k5'1') then
          q<='0';
          qcomp <= not q;
        end if;
      end if;
    end if;
  end proc%ss;
end behav;
    

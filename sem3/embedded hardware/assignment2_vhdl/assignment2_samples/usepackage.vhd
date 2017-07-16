  library ieee;
  library work;
      use ieee.std_logic_1164.all;
      use work.basic_func.all;
 
  entity impliment_package is
      port (
          clk  :in std_logic;
          B    :in  std_logic;
          A    :in  std_logic;
          C    :out std_logic
      );
  end entity;
  
  architecture rtl of impliment_package is
  begin
  
      process (clk) begin
          if (rising_edge(clk)) then
              C <=  AND2(A, B);
          end if;
      end process;
      
 end architecture;
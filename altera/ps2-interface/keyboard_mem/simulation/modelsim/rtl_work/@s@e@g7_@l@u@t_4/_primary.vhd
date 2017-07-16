library verilog;
use verilog.vl_types.all;
entity SEG7_LUT_4 is
    port(
        oSEG0           : out    vl_logic_vector(6 downto 0);
        oSEG1           : out    vl_logic_vector(6 downto 0);
        oSEG2           : out    vl_logic_vector(6 downto 0);
        oSEG3           : out    vl_logic_vector(6 downto 0);
        iDIG            : in     vl_logic_vector(15 downto 0)
    );
end SEG7_LUT_4;

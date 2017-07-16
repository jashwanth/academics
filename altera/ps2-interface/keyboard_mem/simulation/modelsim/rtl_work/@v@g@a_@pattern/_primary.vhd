library verilog;
use verilog.vl_types.all;
entity VGA_Pattern is
    port(
        oRed            : out    vl_logic_vector(9 downto 0);
        oGreen          : out    vl_logic_vector(9 downto 0);
        oBlue           : out    vl_logic_vector(9 downto 0);
        oval            : out    vl_logic_vector(3 downto 0);
        iVGA_X          : in     vl_logic_vector(9 downto 0);
        iVGA_Y          : in     vl_logic_vector(9 downto 0);
        iVGA_CLK        : in     vl_logic;
        iRST_N          : in     vl_logic;
        icur_x          : in     vl_logic_vector(9 downto 0);
        icur_y          : in     vl_logic_vector(9 downto 0);
        iascii          : in     vl_logic_vector(7 downto 0)
    );
end VGA_Pattern;

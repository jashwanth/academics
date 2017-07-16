library verilog;
use verilog.vl_types.all;
entity keyboard is
    port(
        CLOCK_24        : in     vl_logic_vector(1 downto 0);
        CLOCK_27        : in     vl_logic_vector(1 downto 0);
        CLOCK_50        : in     vl_logic;
        EXT_CLOCK       : in     vl_logic;
        KEY             : in     vl_logic_vector(3 downto 0);
        SW              : in     vl_logic_vector(9 downto 0);
        VGA_HS          : out    vl_logic;
        VGA_VS          : out    vl_logic;
        VGA_R           : out    vl_logic_vector(3 downto 0);
        VGA_G           : out    vl_logic_vector(3 downto 0);
        VGA_B           : out    vl_logic_vector(3 downto 0);
        AUD_ADCLRCK     : out    vl_logic;
        AUD_ADCDAT      : in     vl_logic;
        AUD_DACLRCK     : out    vl_logic;
        AUD_DACDAT      : out    vl_logic;
        AUD_BCLK        : inout  vl_logic;
        AUD_XCK         : out    vl_logic;
        PS2_DAT         : in     vl_logic;
        PS2_CLK         : in     vl_logic;
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        LEDG            : out    vl_logic_vector(7 downto 0);
        LEDR            : out    vl_logic_vector(9 downto 0)
    );
end keyboard;

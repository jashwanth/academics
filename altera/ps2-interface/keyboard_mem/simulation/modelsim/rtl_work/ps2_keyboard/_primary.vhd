library verilog;
use verilog.vl_types.all;
entity ps2_keyboard is
    generic(
        TIMER_60USEC_VALUE_PP: integer := 2950;
        TIMER_60USEC_BITS_PP: integer := 12;
        TIMER_5USEC_VALUE_PP: integer := 186;
        TIMER_5USEC_BITS_PP: integer := 8;
        TRAP_SHIFT_KEYS_PP: integer := 0;
        m1_rx_clk_h     : integer := 1;
        m1_rx_clk_l     : integer := 0;
        m1_rx_falling_edge_marker: integer := 13;
        m1_rx_rising_edge_marker: integer := 14;
        m1_tx_force_clk_l: integer := 3;
        m1_tx_first_wait_clk_h: integer := 10;
        m1_tx_first_wait_clk_l: integer := 11;
        m1_tx_reset_timer: integer := 12;
        m1_tx_wait_clk_h: integer := 2;
        m1_tx_clk_h     : integer := 4;
        m1_tx_clk_l     : integer := 5;
        m1_tx_wait_keyboard_ack: integer := 6;
        m1_tx_done_recovery: integer := 7;
        m1_tx_error_no_keyboard_ack: integer := 8;
        m1_tx_rising_edge_marker: integer := 9;
        m2_rx_data_ready: integer := 1;
        m2_rx_data_ready_ack: integer := 0
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        \ps2_clk_en_o_\ : out    vl_logic;
        \ps2_data_en_o_\: out    vl_logic;
        ps2_clk_i       : in     vl_logic;
        ps2_data_i      : in     vl_logic;
        rx_extended     : out    vl_logic;
        rx_released     : out    vl_logic;
        rx_shift_key_on : out    vl_logic;
        rx_scan_code    : out    vl_logic_vector(7 downto 0);
        rx_ascii        : out    vl_logic_vector(7 downto 0);
        rx_data_ready   : out    vl_logic;
        rx_read         : in     vl_logic;
        tx_data         : in     vl_logic_vector(7 downto 0);
        tx_write        : in     vl_logic;
        tx_write_ack_o  : out    vl_logic;
        tx_error_no_keyboard_ack: out    vl_logic;
        translate       : in     vl_logic
    );
end ps2_keyboard;

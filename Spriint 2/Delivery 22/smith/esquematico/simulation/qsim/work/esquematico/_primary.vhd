library verilog;
use verilog.vl_types.all;
entity esquematico is
    port(
        enable          : in     vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        windows         : in     vl_logic;
        store           : in     vl_logic;
        rst_on          : in     vl_logic;
        led_blue        : out    vl_logic;
        led_red         : out    vl_logic;
        led_green       : out    vl_logic
    );
end esquematico;

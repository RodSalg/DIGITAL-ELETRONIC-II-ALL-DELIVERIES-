library verilog;
use verilog.vl_types.all;
entity esquematico_vlg_check_tst is
    port(
        led_blue        : in     vl_logic;
        led_green       : in     vl_logic;
        led_red         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end esquematico_vlg_check_tst;

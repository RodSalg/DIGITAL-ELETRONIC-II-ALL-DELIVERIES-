library verilog;
use verilog.vl_types.all;
entity schematic_vlg_check_tst is
    port(
        led_blue        : in     vl_logic;
        led_green       : in     vl_logic;
        led_red         : in     vl_logic;
        out_reg         : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end schematic_vlg_check_tst;

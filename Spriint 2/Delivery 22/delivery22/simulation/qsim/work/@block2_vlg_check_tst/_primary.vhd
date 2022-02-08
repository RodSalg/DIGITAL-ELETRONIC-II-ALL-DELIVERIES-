library verilog;
use verilog.vl_types.all;
entity Block2_vlg_check_tst is
    port(
        Led_Blue        : in     vl_logic;
        Led_Green       : in     vl_logic;
        Led_Red         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Block2_vlg_check_tst;

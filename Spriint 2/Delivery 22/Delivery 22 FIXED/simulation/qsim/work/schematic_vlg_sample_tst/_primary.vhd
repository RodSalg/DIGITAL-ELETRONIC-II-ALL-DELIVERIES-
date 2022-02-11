library verilog;
use verilog.vl_types.all;
entity schematic_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        reset           : in     vl_logic;
        rst_on          : in     vl_logic;
        store           : in     vl_logic;
        windows         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end schematic_vlg_sample_tst;

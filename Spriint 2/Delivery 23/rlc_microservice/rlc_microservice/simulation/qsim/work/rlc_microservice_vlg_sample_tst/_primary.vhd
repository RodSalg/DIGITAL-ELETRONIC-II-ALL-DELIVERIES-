library verilog;
use verilog.vl_types.all;
entity rlc_microservice_vlg_sample_tst is
    port(
        areset          : in     vl_logic;
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        pulse           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end rlc_microservice_vlg_sample_tst;

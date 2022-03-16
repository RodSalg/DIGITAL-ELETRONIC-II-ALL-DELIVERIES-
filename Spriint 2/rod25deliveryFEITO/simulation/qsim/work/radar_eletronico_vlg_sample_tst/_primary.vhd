library verilog;
use verilog.vl_types.all;
entity radar_eletronico_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        pos_neg         : in     vl_logic;
        rst             : in     vl_logic;
        rst_1           : in     vl_logic;
        store           : in     vl_logic;
        trigger         : in     vl_logic;
        windows         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end radar_eletronico_vlg_sample_tst;

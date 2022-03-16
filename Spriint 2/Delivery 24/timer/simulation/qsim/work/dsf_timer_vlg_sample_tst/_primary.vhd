library verilog;
use verilog.vl_types.all;
entity dsf_timer_vlg_sample_tst is
    port(
        areset          : in     vl_logic;
        clk             : in     vl_logic;
        data            : in     vl_logic_vector(3 downto 0);
        enable          : in     vl_logic;
        pos_neg         : in     vl_logic;
        trigger         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end dsf_timer_vlg_sample_tst;

library verilog;
use verilog.vl_types.all;
entity rlc_microservice_vlg_check_tst is
    port(
        reset_o         : in     vl_logic;
        state           : in     vl_logic_vector(2 downto 0);
        store_o         : in     vl_logic;
        windows_o       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end rlc_microservice_vlg_check_tst;

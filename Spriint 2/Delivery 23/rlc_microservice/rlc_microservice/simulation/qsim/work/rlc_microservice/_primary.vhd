library verilog;
use verilog.vl_types.all;
entity rlc_microservice is
    port(
        enable          : in     vl_logic;
        areset          : in     vl_logic;
        pulse           : in     vl_logic;
        clk             : in     vl_logic;
        reset_o         : out    vl_logic;
        store_o         : out    vl_logic;
        windows_o       : out    vl_logic;
        state           : out    vl_logic_vector(2 downto 0)
    );
end rlc_microservice;

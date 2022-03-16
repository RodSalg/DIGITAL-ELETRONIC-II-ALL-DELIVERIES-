library verilog;
use verilog.vl_types.all;
entity dsf_timer is
    port(
        enable          : in     vl_logic;
        areset          : in     vl_logic;
        data            : in     vl_logic_vector(3 downto 0);
        trigger         : in     vl_logic;
        pos_neg         : in     vl_logic;
        clk             : in     vl_logic;
        q               : out    vl_logic;
        count           : out    vl_logic_vector(3 downto 0)
    );
end dsf_timer;

library verilog;
use verilog.vl_types.all;
entity lgc_h0 is
    port(
        enable          : in     vl_logic;
        gt              : in     vl_logic;
        lt              : in     vl_logic;
        lgc_out         : out    vl_logic
    );
end lgc_h0;

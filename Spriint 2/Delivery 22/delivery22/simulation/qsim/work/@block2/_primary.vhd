library verilog;
use verilog.vl_types.all;
entity Block2 is
    port(
        Enable          : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        windows         : in     vl_logic;
        store           : in     vl_logic;
        rst_on          : in     vl_logic;
        Led_Red         : out    vl_logic;
        Led_Blue        : out    vl_logic;
        Led_Green       : out    vl_logic
    );
end Block2;

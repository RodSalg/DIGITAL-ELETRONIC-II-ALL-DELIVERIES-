library verilog;
use verilog.vl_types.all;
entity radar_eletronico is
    port(
        led_red         : out    vl_logic;
        enable          : in     vl_logic;
        rst             : in     vl_logic;
        trigger         : in     vl_logic;
        pos_neg         : in     vl_logic;
        clk             : in     vl_logic;
        windows         : in     vl_logic;
        rst_1           : in     vl_logic;
        store           : in     vl_logic;
        led_blue        : out    vl_logic;
        led_green       : out    vl_logic;
        out_win         : out    vl_logic;
        out_storeO      : out    vl_logic;
        q_regt          : out    vl_logic_vector(3 downto 0);
        q_state         : out    vl_logic_vector(2 downto 0);
        saida_count     : out    vl_logic_vector(3 downto 0)
    );
end radar_eletronico;

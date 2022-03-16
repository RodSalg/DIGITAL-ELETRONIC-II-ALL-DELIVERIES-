library verilog;
use verilog.vl_types.all;
entity radar_eletronico_vlg_check_tst is
    port(
        led_blue        : in     vl_logic;
        led_green       : in     vl_logic;
        led_red         : in     vl_logic;
        out_storeO      : in     vl_logic;
        out_win         : in     vl_logic;
        q_regt          : in     vl_logic_vector(3 downto 0);
        q_state         : in     vl_logic_vector(2 downto 0);
        saida_count     : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end radar_eletronico_vlg_check_tst;

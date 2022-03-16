onerror {quit -f}
vlib work
vlog -work work radar_eletronico.vo
vlog -work work radar_eletronico.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.radar_eletronico_vlg_vec_tst
vcd file -direction radar_eletronico.msim.vcd
vcd add -internal radar_eletronico_vlg_vec_tst/*
vcd add -internal radar_eletronico_vlg_vec_tst/i1/*
add wave /*
run -all

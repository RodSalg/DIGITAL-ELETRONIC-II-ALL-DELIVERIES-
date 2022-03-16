onerror {quit -f}
vlib work
vlog -work work lgc_h0.vo
vlog -work work lgc_h0.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.lgc_h0_vlg_vec_tst
vcd file -direction lgc_h0.msim.vcd
vcd add -internal lgc_h0_vlg_vec_tst/*
vcd add -internal lgc_h0_vlg_vec_tst/i1/*
add wave /*
run -all

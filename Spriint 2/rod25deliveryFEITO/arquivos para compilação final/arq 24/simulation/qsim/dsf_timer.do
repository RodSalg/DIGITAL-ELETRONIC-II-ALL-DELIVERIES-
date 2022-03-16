onerror {quit -f}
vlib work
vlog -work work dsf_timer.vo
vlog -work work dsf_timer.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.dsf_timer_vlg_vec_tst
vcd file -direction dsf_timer.msim.vcd
vcd add -internal dsf_timer_vlg_vec_tst/*
vcd add -internal dsf_timer_vlg_vec_tst/i1/*
add wave /*
run -all

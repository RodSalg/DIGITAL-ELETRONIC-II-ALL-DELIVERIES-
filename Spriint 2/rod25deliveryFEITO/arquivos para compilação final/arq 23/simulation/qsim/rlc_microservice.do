onerror {quit -f}
vlib work
vlog -work work rlc_microservice.vo
vlog -work work rlc_microservice.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.rlc_microservice_vlg_vec_tst
vcd file -direction rlc_microservice.msim.vcd
vcd add -internal rlc_microservice_vlg_vec_tst/*
vcd add -internal rlc_microservice_vlg_vec_tst/i1/*
add wave /*
run -all

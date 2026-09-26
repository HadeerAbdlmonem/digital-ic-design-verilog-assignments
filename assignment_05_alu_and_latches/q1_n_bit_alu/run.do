vlib work
vlog n_bit_alu.v n_bit_alu_tb.v
vsim -voptargs=+acc work.n_bit_alu_tb
add wave *
run -all

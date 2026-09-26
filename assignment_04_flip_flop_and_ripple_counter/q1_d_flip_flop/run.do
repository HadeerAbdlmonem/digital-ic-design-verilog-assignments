vlib work
vlog d_flip_flop.v d_flip_flop_tb.v
vsim -voptargs=+acc work.d_flip_flop_tb
add wave *
run -all

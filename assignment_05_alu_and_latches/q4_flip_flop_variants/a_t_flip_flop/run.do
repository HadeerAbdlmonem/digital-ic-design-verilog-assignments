vlib work
vlog t_flip_flop.v t_flip_flop_tb.v
vsim -voptargs=+acc work.t_flip_flop_tb
add wave *
run -all

vlib work
vlog parameterized_flip_flop.v parameterized_flip_flop_tb.v
vsim -voptargs=+acc work.parameterized_flip_flop_tb
add wave *
run -all

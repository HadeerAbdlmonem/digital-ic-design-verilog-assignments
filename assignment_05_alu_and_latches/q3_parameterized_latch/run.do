vlib work
vlog latch_param_width.v latch_param_width_tb.v
vsim -voptargs=+acc work.latch_param_width_tb
add wave *
run -all

vlib work
vlog d_latch.v d_latch_tb.v
vsim -voptargs=+acc work.d_latch_tb
add wave *
run -all

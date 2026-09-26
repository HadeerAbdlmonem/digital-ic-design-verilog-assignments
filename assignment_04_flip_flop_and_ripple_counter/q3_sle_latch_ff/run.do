vlib work
vlog sle_latch_ff.v sle_latch_ff_tb.v
vsim -voptargs=+acc work.sle_latch_ff_tb
add wave *
run -all

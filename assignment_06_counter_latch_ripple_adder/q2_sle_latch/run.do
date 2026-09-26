vlib work
vlog sle.v sle_tb.v
vsim -voptargs=+acc work.sle_tb
add wave *
run -all

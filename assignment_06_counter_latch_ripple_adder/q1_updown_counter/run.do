vlib work
vlog dff.v counter_up_down.v counter_up_down_tb.v
vsim -voptargs=+acc work.counter_up_down_tb
add wave *
run -all

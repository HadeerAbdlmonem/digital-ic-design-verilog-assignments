vlib work
vlog d_flip_flop.v ripple_counter_4bit.v ripple_counter_4bit_tb.v
vsim -voptargs=+acc work.ripple_counter_4bit_tb
add wave *
run -all

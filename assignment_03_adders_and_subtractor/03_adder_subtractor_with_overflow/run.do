vlib work
vlog full_adder_1bit.v adder_subtractor_overflow.v
vsim -voptargs=+acc work.adder_subtractor_overflow
add wave *
run -all

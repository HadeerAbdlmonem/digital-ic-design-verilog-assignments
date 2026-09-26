vlib work
vlog adder_4bit_behavioral.v
vsim -voptargs=+acc work.adder_4bit_behavioral
add wave *
run -all

vlib work
vlog full_adder_1bit.v subtractor_4bit.v
vsim -voptargs=+acc work.subtractor_4bit
add wave *
run -all

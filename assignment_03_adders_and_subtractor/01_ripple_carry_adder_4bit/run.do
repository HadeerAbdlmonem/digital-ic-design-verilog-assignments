vlib work
vlog full_adder_1bit.v ripple_carry_adder_4bit.v
vsim -voptargs=+acc work.ripple_carry_adder_4bit
add wave *
run -all

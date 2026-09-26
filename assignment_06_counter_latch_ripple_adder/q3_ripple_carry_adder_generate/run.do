vlib work
vlog full_adder.v ripple_carry_adder_nbit.v ripple_carry_adder_nbit_tb.v
vsim -voptargs=+acc work.ripple_carry_adder_nbit_tb
add wave *
run -all

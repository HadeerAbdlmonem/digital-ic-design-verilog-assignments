vlib work
vlog mux_two_functions.v
vsim -voptargs=+acc work.mux_two_functions
add wave *
run -all

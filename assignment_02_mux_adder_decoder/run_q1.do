vlib work
vlog mux_and_xnor.v
vsim -voptargs=+acc work.mux_and_xnor
add wave *
run -all

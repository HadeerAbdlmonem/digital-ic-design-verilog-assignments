vlib work
vlog single_port_memory.v single_port_memory_tb.v
vsim -voptargs=+acc work.single_port_memory_tb
add wave *
run -all

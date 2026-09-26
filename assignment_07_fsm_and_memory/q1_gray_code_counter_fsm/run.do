vlib work
vlog gray_counter_fsm.v gray_counter_fsm_tb.v
vsim -voptargs=+acc work.gray_counter_fsm_tb
add wave *
add wave -position insertpoint \
    sim:/gray_counter_fsm_tb/dut/rst \
    sim:/gray_counter_fsm_tb/dut/clk \
    sim:/gray_counter_fsm_tb/dut/y \
    sim:/gray_counter_fsm_tb/dut/current_state \
    sim:/gray_counter_fsm_tb/dut/next_state
run -all

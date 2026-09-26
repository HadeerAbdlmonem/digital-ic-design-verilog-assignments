//==============================================================================
// Testbench   : gray_counter_fsm_tb
// Description : Applies an active-high reset for one clock period, then
//               lets the FSM free-run for six clock cycles.
//==============================================================================
module gray_counter_fsm_tb ();

  reg        clk, rst;
  wire [1:0] y;

  gray_counter_fsm dut (
      .rst(rst),
      .clk(clk),
      .y  (y)
  );

  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end

  initial begin
    rst = 1;
    @(negedge clk);
    rst = 0;
    repeat (6) @(negedge clk);
    $stop();
  end

endmodule

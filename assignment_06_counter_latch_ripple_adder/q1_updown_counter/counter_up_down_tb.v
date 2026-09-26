//==============================================================================
// Testbench   : counter_up_down_tb
// Description : Applies reset then lets the counter free-run for 15 clock
//               cycles.
//==============================================================================
module counter_up_down_tb ();

  reg        clk;
  reg        rst;
  wire [3:0] out;
  wire [3:0] out_bar;

  counter_up_down dut (
      .clk    (clk),
      .rst    (rst),
      .out    (out),
      .out_bar(out_bar)
  );

  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end

  initial begin
    rst = 0;
    @(negedge clk);
    rst = 1;
    repeat (15) @(negedge clk);
    $stop;
  end

endmodule

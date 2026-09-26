//==============================================================================
// Testbench   : d_flip_flop_tb
// Description : Holds reset, releases it, then walks d through a short
//               sequence of values.
//==============================================================================
module d_flip_flop_tb;

  reg  d, rstn, clk;
  wire q, qbar;

  d_flip_flop dut (
      .d   (d),
      .rstn(rstn),
      .clk (clk),
      .q   (q),
      .qbar(qbar)
  );

  always #5 clk = ~clk;

  initial begin
    clk  = 0;
    rstn = 0;
    d    = 0;
    #12 rstn = 1;
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #20 $stop();
  end

endmodule

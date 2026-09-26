//==============================================================================
// Testbench   : t_flip_flop_tb
// Description : Holds reset, releases it, then pulses t high for a window
//               to verify toggling.
//==============================================================================
module t_flip_flop_tb;

  reg  t, rstn, clk;
  wire q, qbar;

  t_flip_flop dut (
      .t   (t),
      .rstn(rstn),
      .clk (clk),
      .q   (q),
      .qbar(qbar)
  );

  always #1 clk = ~clk;

  initial begin
    clk  = 0;
    rstn = 0;
    t    = 0;
    #12 rstn = 1;
    #10 t = 1;
    #20 t = 0;
    #20 $stop();
  end

endmodule

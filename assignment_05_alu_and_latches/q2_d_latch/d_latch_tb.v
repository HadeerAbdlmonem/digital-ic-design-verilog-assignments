//==============================================================================
// Testbench   : d_latch_tb
// Description : Releases the asynchronous clear, then drives 10 randomized
//               d/g combinations one time unit apart.
//==============================================================================
module d_latch_tb ();

  wire q;
  reg  d, g, clr;

  d_latch dut (
      .d  (d),
      .g  (g),
      .q  (q),
      .clr(clr)
  );

  integer i;

  initial begin
    clr = 0;
    #1;
    clr = 1;

    for (i = 0; i < 10; i = i + 1) begin
      d = $random();
      g = $random();
      #1;
    end

    $stop();
  end

endmodule

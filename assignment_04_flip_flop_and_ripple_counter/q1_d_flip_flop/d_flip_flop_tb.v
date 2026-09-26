//==============================================================================
// Testbench   : d_flip_flop_tb
// Description : Generates a free-running clock, applies an asynchronous
//               reset, then drives 10 randomized values on d.
//==============================================================================
module d_flip_flop_tb ();

  reg  d, clk, rstn;
  wire q, qbar;

  d_flip_flop dut (
      .d   (d),
      .clk (clk),
      .rstn(rstn),
      .q   (q),
      .qbar(qbar)
  );

  // Free-running clock: toggles every 1 time unit.
  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end

  integer i;

  initial begin
    rstn = 0;
    @(negedge clk);
    rstn = 1;

    for (i = 0; i < 10; i = i + 1) begin
      d = $random();
      @(negedge clk);
    end

    $stop();
  end

endmodule

//==============================================================================
// Testbench   : sle_latch_ff_tb
// Description : Exercises the asynchronous load path, then runs 100
//               randomized cycles in flip-flop mode, then a few cycles in
//               latch mode.
//==============================================================================
module sle_latch_ff_tb;

  reg  d, clk, en, aload_n, async_data_n, sload_n, sload_data, lat_mode;
  wire q;

  sle_latch_ff dut (
      .d           (d),
      .clk         (clk),
      .en          (en),
      .aload_n     (aload_n),
      .async_data_n(async_data_n),
      .sload_n     (sload_n),
      .sload_data  (sload_data),
      .lat_mode    (lat_mode),
      .q           (q)
  );

  initial begin
    // Reset all inputs to a known state.
    d            = 0;
    clk          = 0;
    en           = 0;
    aload_n      = 1;
    async_data_n = 1;
    sload_n      = 1;
    sload_data   = 0;
    lat_mode     = 0;

    // Exercise the asynchronous load path.
    #5 aload_n = 0;
    async_data_n = 0;
    #5 aload_n = 1;

    // Flip-flop mode: randomize inputs over 100 clock toggles.
    lat_mode = 0;
    repeat (100) begin
      #5 clk = ~clk;
      d          = $random;
      en         = $random;
      sload_n    = $random;
      sload_data = $random;
    end

    // Latch mode: a few more randomized data changes.
    lat_mode = 1;
    repeat (5) begin
      #5 d = $random;
    end

    $stop();
  end

endmodule

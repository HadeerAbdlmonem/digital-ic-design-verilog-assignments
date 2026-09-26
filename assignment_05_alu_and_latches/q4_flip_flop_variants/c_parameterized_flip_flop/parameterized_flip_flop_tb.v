//==============================================================================
// Testbench   : parameterized_flip_flop_tb
// Description : Instantiates one DFF-mode and one TFF-mode instance of
//               parameterized_flip_flop side by side, driving the same
//               reset/clock/d_or_t stimulus into both.
//==============================================================================
module parameterized_flip_flop_tb;

  reg  d_or_t, rstn, clk;
  wire q_dff, qbar_dff;
  wire q_tff, qbar_tff;

  parameterized_flip_flop #(.FF_TYPE("DFF")) u_dff (
      .d_or_t(d_or_t),
      .rstn  (rstn),
      .clk   (clk),
      .q     (q_dff),
      .qbar  (qbar_dff)
  );

  parameterized_flip_flop #(.FF_TYPE("TFF")) u_tff (
      .d_or_t(d_or_t),
      .rstn  (rstn),
      .clk   (clk),
      .q     (q_tff),
      .qbar  (qbar_tff)
  );

  always #5 clk = ~clk;

  initial begin
    clk    = 0;
    rstn   = 0;
    d_or_t = 0;

    #12 rstn = 1;
    #10 d_or_t = 1;
    #20 d_or_t = 0;
    #20 $stop();
  end

endmodule

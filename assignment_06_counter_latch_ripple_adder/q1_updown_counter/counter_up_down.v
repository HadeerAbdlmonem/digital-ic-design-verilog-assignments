//==============================================================================
// Module      : counter_up_down
// Description : 4-bit asynchronous ripple counter built from dff stages
//               wired in toggle configuration: each stage's q_bar feeds
//               back to its own d input and clocks the next stage.
// Inputs      : clk, rst (active low)
// Outputs     : out[3:0]     - counter value
//               out_bar[3:0] - complement of out
//==============================================================================
module counter_up_down (
    input             clk,
    input             rst,
    output     [3:0] out,
    output     [3:0] out_bar
);

  dff ff0 (
      .d    (out_bar[0]),
      .rst  (rst),
      .clk  (clk),
      .q    (out[0]),
      .q_bar(out_bar[0])
  );

  dff ff1 (
      .d    (out_bar[1]),
      .rst  (rst),
      .clk  (out_bar[0]),
      .q    (out[1]),
      .q_bar(out_bar[1])
  );

  dff ff2 (
      .d    (out_bar[2]),
      .rst  (rst),
      .clk  (out_bar[1]),
      .q    (out[2]),
      .q_bar(out_bar[2])
  );

  dff ff3 (
      .d    (out_bar[3]),
      .rst  (rst),
      .clk  (out_bar[2]),
      .q    (out[3]),
      .q_bar(out_bar[3])
  );

endmodule

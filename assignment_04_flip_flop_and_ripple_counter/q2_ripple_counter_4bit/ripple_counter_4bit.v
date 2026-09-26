//==============================================================================
// Module      : ripple_counter_4bit
// Description : 4-bit asynchronous (ripple) counter built from toggle-wired
//               D flip-flops: each stage's qbar output feeds back to its
//               own d input (toggle-on-every-clock) and clocks the next
//               stage, so the counter increments on every rising edge of
//               the previous stage's qbar.
// Inputs      : clk, rstn - clock and asynchronous active-low reset
// Outputs     : out[3:0]  - counter value (qbar of each flip-flop stage)
//==============================================================================
module ripple_counter_4bit (
    input             clk,
    input             rstn,
    output     [3:0] out
);

  wire [3:0] qbar_chain;  // qbar output of each flip-flop stage

  d_flip_flop ff0 (
      .d   (qbar_chain[0]),
      .clk (clk),
      .rstn(rstn),
      .qbar(qbar_chain[0])
  );

  d_flip_flop ff1 (
      .d   (qbar_chain[1]),
      .clk (qbar_chain[0]),
      .rstn(rstn),
      .qbar(qbar_chain[1])
  );

  d_flip_flop ff2 (
      .d   (qbar_chain[2]),
      .clk (qbar_chain[1]),
      .rstn(rstn),
      .qbar(qbar_chain[2])
  );

  d_flip_flop ff3 (
      .d   (qbar_chain[3]),
      .clk (qbar_chain[2]),
      .rstn(rstn),
      .qbar(qbar_chain[3])
  );

  assign out = qbar_chain;

endmodule

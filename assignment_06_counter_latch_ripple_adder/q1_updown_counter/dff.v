//==============================================================================
// Module      : dff
// Description : D flip-flop with an asynchronous active-low reset that
//               drives both q and its registered complement q_bar.
// Inputs      : d, rst (active low), clk
// Outputs     : q, q_bar
//==============================================================================
module dff (
    input  d,
    input  rst,
    input  clk,
    output reg q,
    output reg q_bar
);

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      q     <= 1'b0;
      q_bar <= 1'b1;
    end else begin
      q     <= d;
      q_bar <= ~d;
    end
  end

endmodule

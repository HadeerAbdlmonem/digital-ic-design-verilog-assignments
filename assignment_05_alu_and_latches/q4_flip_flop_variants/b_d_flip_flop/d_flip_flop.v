//==============================================================================
// Module      : d_flip_flop
// Description : D flip-flop with an asynchronous active-low reset.
// Inputs      : d, rstn, clk
// Outputs     : q, qbar
//==============================================================================
module d_flip_flop (
    input  d,
    input  rstn,
    input  clk,
    output reg q,
    output     qbar
);

  assign qbar = ~q;

  always @(posedge clk or negedge rstn) begin
    if (!rstn) q <= 1'b0;
    else q <= d;
  end

endmodule

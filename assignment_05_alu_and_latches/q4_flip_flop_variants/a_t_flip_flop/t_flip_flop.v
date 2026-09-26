//==============================================================================
// Module      : t_flip_flop
// Description : T (toggle) flip-flop with an asynchronous active-low reset.
//               When t = 1, q toggles on every rising clock edge.
// Inputs      : t, clk, rstn
// Outputs     : q, qbar
//==============================================================================
module t_flip_flop (
    input  t,
    input  rstn,
    input  clk,
    output reg q,
    output     qbar
);

  assign qbar = ~q;

  always @(posedge clk or negedge rstn) begin
    if (!rstn) q <= 1'b0;
    else if (t) q <= ~q;
  end

endmodule

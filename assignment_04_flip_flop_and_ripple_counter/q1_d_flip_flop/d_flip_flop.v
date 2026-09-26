//==============================================================================
// Module      : d_flip_flop
// Description : Simple D flip-flop with an asynchronous active-low reset.
// Inputs      : d     - data input
//               clk   - clock, rising-edge triggered
//               rstn  - asynchronous reset, active low
// Outputs     : q      - registered output
//               qbar   - complement of q
//==============================================================================
module d_flip_flop (
    input  d,
    input  clk,
    input  rstn,
    output reg q,
    output     qbar
);

  always @(posedge clk or negedge rstn) begin
    if (!rstn) q <= 1'b0;
    else q <= d;
  end

  assign qbar = ~q;

endmodule

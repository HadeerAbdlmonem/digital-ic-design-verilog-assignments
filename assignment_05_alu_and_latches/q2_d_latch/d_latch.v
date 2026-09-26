//==============================================================================
// Module      : d_latch
// Description : Level-sensitive D latch with an asynchronous active-low
//               clear.
// Inputs      : clr - asynchronous clear, active low
//               d   - data input
//               g   - gate/enable (latch is transparent while g = 1)
// Outputs     : q   - latched output
//==============================================================================
module d_latch (
    input      clr,
    input      d,
    input      g,
    output reg q
);

  always @(*) begin
    if (!clr) q = 1'b0;
    else if (g) q = d;
    // else: hold previous value
  end

endmodule

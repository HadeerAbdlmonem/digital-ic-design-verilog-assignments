//==============================================================================
// Module      : mux_two_functions
// Description : 2-to-1 mux selecting between an XNOR term and a function of
//               a 3-bit bus, with a complementary output.
//                 term_xnor = ~(a ^ b ^ c)
//                 term_bus  = d[2] | (d[0] & d[1])
//                 out       = sel ? term_xnor : term_bus
//                 out_bar   = ~out
// Inputs      : d[2:0] - 3-bit data bus
//               a, b, c - single-bit data inputs
//               sel     - selects term_xnor (1) or term_bus (0)
// Outputs     : out     - selected output
//               out_bar - complement of out
//==============================================================================
module mux_two_functions (
    input      [2:0] d,
    input             a,
    input             b,
    input             c,
    input             sel,
    output reg        out,
    output            out_bar
);

  wire term_bus;   // d[2] | (d[0] & d[1])
  wire term_xnor;  // ~(a ^ b ^ c)

  assign term_xnor = ~(a ^ b ^ c);
  assign term_bus  = d[2] | (d[0] & d[1]);

  always @(*) begin
    if (sel) out = term_xnor;
    else out = term_bus;
  end

  assign out_bar = ~out;

endmodule

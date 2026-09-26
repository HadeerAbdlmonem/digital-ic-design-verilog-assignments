//==============================================================================
// Module      : mux_and_xnor
// Description : 2-to-1 mux selecting between an AND term and an XNOR term,
//               with a complementary output.
//                 term_and  = a & b & c
//                 term_xnor = ~(d ^ e ^ f)
//                 out       = sel ? term_xnor : term_and
//                 out_bar   = ~out
// Inputs      : a, b, c, d, e, f - data inputs
//               sel              - selects term_xnor (1) or term_and (0)
// Outputs     : out              - selected output
//               out_bar          - complement of out
//==============================================================================
module mux_and_xnor (
    input  a,
    input  b,
    input  c,
    input  d,
    input  e,
    input  f,
    input  sel,
    output out,
    output out_bar
);

  wire term_and;   // a & b & c
  wire term_xnor;  // ~(d ^ e ^ f)

  assign term_and  = a & b & c;
  assign term_xnor = ~(d ^ e ^ f);
  assign out       = sel ? term_xnor : term_and;
  assign out_bar   = ~out;

endmodule

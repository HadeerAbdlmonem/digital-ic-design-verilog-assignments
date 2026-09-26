//==============================================================================
// Module      : boolean_expr_q3
// Description : Combinational logic implementing f = (a ^ b) & ~(b ^ c) & c
// Inputs      : a, b, c - single-bit logic inputs
// Outputs     : f       - single-bit logic output
//==============================================================================
module boolean_expr_q3 (
    input  a,
    input  b,
    input  c,
    output f
);

  assign f = (a ^ b) & ~(b ^ c) & c;

endmodule

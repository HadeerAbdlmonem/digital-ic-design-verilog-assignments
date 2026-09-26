//==============================================================================
// Module      : boolean_expr_q2
// Description : Combinational logic implementing y = a & e & ~(b & c & d)
// Inputs      : a, b, c, d, e - single-bit logic inputs
// Outputs     : y             - single-bit logic output
//==============================================================================
module boolean_expr_q2 (
    input  a,
    input  b,
    input  c,
    input  d,
    input  e,
    output y
);

  wire nand_bcd;  // intermediate term: ~(b & c & d)

  assign nand_bcd = ~(b & c & d);
  assign y         = a & e & nand_bcd;

endmodule

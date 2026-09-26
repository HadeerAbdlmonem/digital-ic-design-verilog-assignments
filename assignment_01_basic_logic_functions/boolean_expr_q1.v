//==============================================================================
// Module      : boolean_expr_q1
// Description : Combinational logic implementing f = x | (~y & z)
// Inputs      : x, y, z - single-bit logic inputs
// Outputs     : f       - single-bit logic output
//==============================================================================
module boolean_expr_q1 (
    input  x,
    input  y,
    input  z,
    output f
);

  wire not_y_and_z;  // intermediate term: ~y & z

  assign not_y_and_z = ~y & z;
  assign f            = not_y_and_z | x;

endmodule

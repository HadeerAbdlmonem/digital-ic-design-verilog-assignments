//==============================================================================
// Module      : full_adder_1bit
// Description : Gate-level 1-bit full adder.
// Inputs      : a, b, cin - operand bits and carry-in
// Outputs     : sum       - sum bit
//               cout      - carry-out bit
//==============================================================================
module full_adder_1bit (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);

endmodule

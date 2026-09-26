//==============================================================================
// Module      : full_adder_1bit
// Description : Behavioral 1-bit full adder using the '+' operator; the
//               2-bit result packs {cout, sum}.
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

  assign {cout, sum} = a + b + cin;

endmodule

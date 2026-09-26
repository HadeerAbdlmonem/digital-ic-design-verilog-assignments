//==============================================================================
// Module      : full_adder
// Description : Behavioral 1-bit full adder using the '+' operator.
// Inputs      : a, b, cin
// Outputs     : sum, cout
//==============================================================================
module full_adder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

  assign {cout, sum} = a + b + cin;

endmodule

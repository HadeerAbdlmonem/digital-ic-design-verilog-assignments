//==============================================================================
// Module      : adder_4bit_behavioral
// Description : 4-bit adder described behaviorally with the '+' operator.
//               The 5-bit output carries the sum plus the carry-out bit.
// Inputs      : a[3:0], b[3:0] - 4-bit operands
// Outputs     : c[4:0]         - 5-bit sum (c[4] is the carry-out)
//==============================================================================
module adder_4bit_behavioral (
    input      [3:0] a,
    input      [3:0] b,
    output     [4:0] c
);

  assign c = a + b;

endmodule

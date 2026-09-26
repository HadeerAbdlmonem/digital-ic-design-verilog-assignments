//==============================================================================
// Module      : subtractor_4bit
// Description : 4-bit subtractor (a - b) built by adding a to the two's
//               complement of b: invert b and add with cin tied to 1.
// Inputs      : a[3:0], b[3:0] - minuend and subtrahend
// Outputs     : diff[3:0]      - difference (a - b)
//               cout           - carry-out (1 => no borrow, a >= b)
//==============================================================================
module subtractor_4bit (
    input      [3:0] a,
    input      [3:0] b,
    output     [3:0] diff,
    output            cout
);

  wire [3:0] b_inverted;  // one's complement of b
  wire       c1, c2, c3;  // internal carry chain between adder stages

  assign b_inverted = ~b;

  full_adder_1bit fa0 (
      .a   (a[0]),
      .b   (b_inverted[0]),
      .cin (1'b1),  // +1 completes the two's complement of b
      .sum (diff[0]),
      .cout(c1)
  );

  full_adder_1bit fa1 (
      .a   (a[1]),
      .b   (b_inverted[1]),
      .cin (c1),
      .sum (diff[1]),
      .cout(c2)
  );

  full_adder_1bit fa2 (
      .a   (a[2]),
      .b   (b_inverted[2]),
      .cin (c2),
      .sum (diff[2]),
      .cout(c3)
  );

  full_adder_1bit fa3 (
      .a   (a[3]),
      .b   (b_inverted[3]),
      .cin (c3),
      .sum (diff[3]),
      .cout(cout)
  );

endmodule

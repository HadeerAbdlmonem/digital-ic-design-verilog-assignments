//==============================================================================
// Module      : adder_subtractor_overflow
// Description : 4-bit combined adder/subtractor with overflow detection,
//               built from full_adder_1bit stages. Each bit of b is XORed
//               with mode; mode also feeds into the LSB carry-in, so:
//                 mode = 0 -> s = a + b        (addition)
//                 mode = 1 -> s = a - b        (subtraction, via 2's complement)
//               Overflow is detected by comparing the carries into and out
//               of the most significant bit.
// Inputs      : a[3:0], b[3:0] - 4-bit operands
//               mode           - 0 = add, 1 = subtract
// Outputs     : s[3:0]         - result
//               overflow       - signed overflow flag
//==============================================================================
module adder_subtractor_overflow (
    input      [3:0] a,
    input      [3:0] b,
    input             mode,
    output     [3:0] s,
    output            overflow
);

  wire [3:0] b_xor_mode;  // b, conditionally inverted by mode
  wire       c1, c2, c3, c4;

  assign b_xor_mode[0] = b[0] ^ mode;
  assign b_xor_mode[1] = b[1] ^ mode;
  assign b_xor_mode[2] = b[2] ^ mode;
  assign b_xor_mode[3] = b[3] ^ mode;

  full_adder_1bit fa0 (
      .a   (a[0]),
      .b   (b_xor_mode[0]),
      .cin (mode),  // mode also supplies the +1 needed for 2's complement
      .sum (s[0]),
      .cout(c1)
  );

  full_adder_1bit fa1 (
      .a   (a[1]),
      .b   (b_xor_mode[1]),
      .cin (c1),
      .sum (s[1]),
      .cout(c2)
  );

  full_adder_1bit fa2 (
      .a   (a[2]),
      .b   (b_xor_mode[2]),
      .cin (c2),
      .sum (s[2]),
      .cout(c3)
  );

  full_adder_1bit fa3 (
      .a   (a[3]),
      .b   (b_xor_mode[3]),
      .cin (c3),
      .sum (s[3]),
      .cout(c4)
  );

  // Overflow: carry into MSB differs from carry out of MSB.
  assign overflow = c3 ^ c4;

endmodule

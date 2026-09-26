//==============================================================================
// Module      : ripple_carry_adder_nbit
// Description : Parameterized N-bit ripple-carry adder, built by generating
//               N instances of full_adder and chaining the carry bits.
// Parameters  : N   - operand width in bits (default 8)
// Inputs      : a[N-1:0], b[N-1:0] - operands
//               cin                - carry-in
// Outputs     : sum[N-1:0]         - N-bit sum
//               cout                - carry-out
//==============================================================================
module ripple_carry_adder_nbit #(
    parameter N = 8
) (
    input      [N-1:0] a,
    input      [N-1:0] b,
    input                cin,
    output     [N-1:0] sum,
    output               cout
);

  wire [N:0] carry;  // carry[0] = cin, carry[N] = cout

  assign carry[0] = cin;

  genvar i;
  generate
    for (i = 0; i < N; i = i + 1) begin : adder_stage
      full_adder fa (
          .a   (a[i]),
          .b   (b[i]),
          .cin (carry[i]),
          .sum (sum[i]),
          .cout(carry[i+1])
      );
    end
  endgenerate

  assign cout = carry[N];

endmodule

//==============================================================================
// Module      : n_bit_alu
// Description : Parameterized, registered N-bit ALU. The operation is fixed
//               at elaboration time via the OPCODE parameter (one ALU
//               instance = one fixed operation), which lets a testbench
//               instantiate several ALUs in parallel to compare operations.
//               OPCODE: 0 = add, 1 = or, 2 = subtract, 3 = xor.
// Parameters  : N      - operand width in bits (default 4)
//               OPCODE - selects the operation (default 0 = add)
// Inputs      : in0[N-1:0], in1[N-1:0] - operands
//               rst, clk                - synchronous-clear reset, clock
// Outputs     : out[N-1:0]              - registered result
//==============================================================================
module n_bit_alu #(
    parameter N      = 4,
    parameter OPCODE = 0
) (
    input      [N-1:0] in0,
    input      [N-1:0] in1,
    input               rst,
    input               clk,
    output reg [N-1:0] out
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      out <= 0;
    end else begin
      case (OPCODE)
        0: out <= in0 + in1;
        1: out <= in0 | in1;
        2: out <= in0 - in1;
        3: out <= in0 ^ in1;
        default: out <= 0;
      endcase
    end
  end

endmodule

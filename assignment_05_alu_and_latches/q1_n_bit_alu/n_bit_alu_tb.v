//==============================================================================
// Testbench   : n_bit_alu_tb
// Description : Instantiates four n_bit_alu ALUs (add/or/sub/xor) sharing
//               the same operands, drives 4 randomized cycles, and checks
//               each ALU's registered output against an expected value
//               computed in the testbench.
//==============================================================================
module n_bit_alu_tb ();

  parameter N = 4;

  integer i;
  reg  [N-1:0] in0, in1;
  reg          rst, clk;

  wire [N-1:0] out_add;
  wire [N-1:0] out_or;
  wire [N-1:0] out_sub;
  wire [N-1:0] out_xor;

  n_bit_alu #(N, 0) dut_add (
      .in0(in0),
      .in1(in1),
      .rst(rst),
      .clk(clk),
      .out(out_add)
  );
  n_bit_alu #(N, 1) dut_or (
      .in0(in0),
      .in1(in1),
      .rst(rst),
      .clk(clk),
      .out(out_or)
  );
  n_bit_alu #(N, 2) dut_sub (
      .in0(in0),
      .in1(in1),
      .rst(rst),
      .clk(clk),
      .out(out_sub)
  );
  n_bit_alu #(N, 3) dut_xor (
      .in0(in0),
      .in1(in1),
      .rst(rst),
      .clk(clk),
      .out(out_xor)
  );

  reg [N-1:0] expected_add;
  reg [N-1:0] expected_or;
  reg [N-1:0] expected_sub;
  reg [N-1:0] expected_xor;

  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end

  initial begin
    rst = 1;
    in0 = 0;
    in1 = 0;
    @(negedge clk);
    rst = 0;

    for (i = 0; i < 4; i = i + 1) begin
      in0 = $random();
      in1 = $random();
      @(negedge clk);

      expected_add = in0 + in1;
      expected_or  = in0 | in1;
      expected_sub = in0 - in1;
      expected_xor = in0 ^ in1;

      if (expected_add !== out_add) $display("ERROR: add mismatch");
      if (expected_or !== out_or) $display("ERROR: or mismatch");
      if (expected_sub !== out_sub) $display("ERROR: sub mismatch");
      if (expected_xor !== out_xor) $display("ERROR: xor mismatch");
    end

    $stop();
  end

endmodule

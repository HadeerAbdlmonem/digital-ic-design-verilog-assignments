//==============================================================================
// Testbench   : ripple_carry_adder_nbit_tb
// Description : Instantiates an 8-bit ripple_carry_adder_nbit and drives a
//               handful of directed test vectors, including a max-value +
//               carry-in case.
//==============================================================================
module ripple_carry_adder_nbit_tb;

  parameter N = 8;
  reg  [N-1:0] a, b;
  reg          cin;
  wire [N-1:0] sum;
  wire         cout;

  ripple_carry_adder_nbit #(N) uut (
      .a   (a),
      .b   (b),
      .cin (cin),
      .sum (sum),
      .cout(cout)
  );

  initial begin
    a   = 0;
    b   = 0;
    cin = 0;

    #10 a = 8'd10;
    b   = 8'd20;
    cin = 0;

    #10 a = 8'd255;
    b   = 8'd1;
    cin = 0;

    #10 a = 8'd100;
    b   = 8'd50;
    cin = 1;

    #10 a = 8'hFF;
    b   = 8'hFF;
    cin = 1;

    #20 $stop;
  end

endmodule

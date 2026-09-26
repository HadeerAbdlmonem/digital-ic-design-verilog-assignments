//==============================================================================
// Testbench   : latch_param_width_tb
// Description : Releases the asynchronous clear, then drives 10 randomized
//               aset/gate/data combinations one time unit apart on a
//               4-bit-wide instance.
//==============================================================================
module latch_param_width_tb ();

  reg  [3:0] data;
  reg        aset, aclr, gate;
  wire [3:0] q;
  integer    i;

  latch_param_width #(.WIDTH(4)) dut (
      .aclr(aclr),
      .aset(aset),
      .data(data),
      .q   (q),
      .gate(gate)
  );

  initial begin
    aclr = 1;
    #1;
    aclr = 0;

    for (i = 0; i < 10; i = i + 1) begin
      aset = $random();
      gate = $random();
      data = $random();
      #1;
    end

    $stop();
  end

endmodule

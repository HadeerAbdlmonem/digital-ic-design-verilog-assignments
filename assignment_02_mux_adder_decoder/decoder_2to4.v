//==============================================================================
// Module      : decoder_2to4
// Description : 2-to-4 one-hot decoder implemented with a ternary chain.
// Inputs      : a[1:0] - 2-bit select code
// Outputs     : d[3:0] - one-hot decoded output
//==============================================================================
module decoder_2to4 (
    input      [1:0] a,
    output reg [3:0] d
);

  always @(*) begin
    case (a)
      2'b00:   d = 4'b0001;
      2'b01:   d = 4'b0010;
      2'b10:   d = 4'b0100;
      2'b11:   d = 4'b1000;
      default: d = 4'b0000;
    endcase
  end

endmodule

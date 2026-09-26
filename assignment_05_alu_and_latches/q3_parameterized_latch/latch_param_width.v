//==============================================================================
// Module      : latch_param_width
// Description : Parameterized-width level-sensitive latch with an
//               asynchronous clear and an asynchronous set.
//               Priority: aclr (clear to 0) > aset (set to all 1s) >
//               gate-controlled load of data > hold.
// Parameters  : WIDTH - bus width of data/q (default set by instantiation)
// Inputs      : aset  - asynchronous set, active high
//               data  - data bus to latch
//               gate  - latch is transparent while gate = 1
//               aclr  - asynchronous clear, active high
// Outputs     : q     - latched output bus
//==============================================================================
module latch_param_width #(
    parameter WIDTH = 4
) (
    input                   aset,
    input      [WIDTH-1:0] data,
    input                   gate,
    input                   aclr,
    output reg [WIDTH-1:0] q
);

  always @(*) begin
    if (aclr) begin
      q = {WIDTH{1'b0}};
    end else if (aset) begin
      q = {WIDTH{1'b1}};
    end else if (gate) begin
      q = data;
    end
    // else: hold previous value
  end

endmodule

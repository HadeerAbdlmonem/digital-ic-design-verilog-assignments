//==============================================================================
// Module      : parameterized_flip_flop
// Description : Flip-flop whose behavior is chosen at elaboration time via
//               the FF_TYPE string parameter:
//                 "DFF" - plain D flip-flop:   q <= d_or_t
//                 "TFF" - T (toggle) flip-flop: q <= d_or_t ? ~q : q
//               The same port (d_or_t) is reused as the D input in DFF mode
//               and as the toggle-enable input in TFF mode.
// Parameters  : FF_TYPE - "DFF" or "TFF" (default "DFF")
// Inputs      : d_or_t - D input (DFF mode) or toggle enable (TFF mode)
//               rstn   - asynchronous reset, active low
//               clk    - clock, rising-edge triggered
// Outputs     : q, qbar
//==============================================================================
module parameterized_flip_flop #(
    parameter FF_TYPE = "DFF"
) (
    input  d_or_t,
    input  rstn,
    input  clk,
    output reg q,
    output     qbar
);

  assign qbar = ~q;

  always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
      q <= 1'b0;
    end else begin
      if (FF_TYPE == "DFF") q <= d_or_t;
      else if (FF_TYPE == "TFF") q <= d_or_t ? ~q : q;
    end
  end

endmodule

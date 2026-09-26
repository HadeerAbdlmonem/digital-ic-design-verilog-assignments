//==============================================================================
// Module      : sle
// Description : Settable Latch/Flip-Flop element, edge-triggered version.
//               Priority (highest to lowest):
//                 1. Asynchronous load (aload_n = 0)            -> q = adata_n
//                 2. Latch mode (lat = 1, sampled at posedge clk)
//                 3. Flip-flop mode (lat = 0, sampled at posedge clk)
// Inputs      : d        - data input
//               clk      - clock
//               en       - enable
//               aload_n  - asynchronous load, active low
//               adata_n  - asynchronous load data, active low
//               sload_n  - synchronous load select, active low
//               sdata    - synchronous load data
//               lat      - 0 = flip-flop mode, 1 = latch mode
// Outputs     : q
//==============================================================================
module sle (
    input      d,
    input      clk,
    input      en,
    input      aload_n,
    input      adata_n,
    input      sload_n,
    input      sdata,
    input      lat,
    output reg q
);

  always @(posedge clk or negedge aload_n) begin
    if (!aload_n) begin
      q <= adata_n;
    end else if (lat) begin
      if (clk && en) begin
        if (!sload_n) q <= sdata;
        else q <= d;
      end
    end else begin
      if (en & sload_n) begin
        q <= d;
      end else if (en & !sload_n) begin
        q <= sdata;
      end
    end
  end

endmodule

//==============================================================================
// Module      : sle_latch_ff
// Description : Settable Latch/Flip-Flop (SLE) storage element that can
//               operate as either an edge-triggered D flip-flop or a
//               level-sensitive latch, selected by 'lat_mode'. It also
//               supports an asynchronous load and a synchronous load with
//               separate load data, useful for scan/test or preset paths.
//
//               Priority (highest to lowest):
//                 1. Asynchronous load (aload_n = 0)              -> q = ~async_data_n
//                 2. Latch mode        (lat_mode = 1, clk & en)   -> sync load / D
//                 3. Flip-flop mode    (lat_mode = 0, posedge clk)-> sync load / D
//
// Inputs      : d          - normal data input
//               clk        - clock
//               en         - clock/gate enable
//               aload_n    - asynchronous load, active low
//               async_data_n - asynchronous load data, active low
//               sload_n    - synchronous load select, active low
//               sload_data - synchronous load data
//               lat_mode   - 0 = flip-flop mode, 1 = latch mode
// Outputs     : q          - registered/latched output
//==============================================================================
module sle_latch_ff (
    input      d,
    input      clk,
    input      en,
    input      aload_n,      // asynchronous load, active low
    input      async_data_n, // asynchronous load data, active low
    input      sload_n,      // synchronous load select, active low
    input      sload_data,   // synchronous load data
    input      lat_mode,     // 0 = flip-flop mode, 1 = latch mode
    output reg q
);

  reg q_next;  // combinational "next value" feeding the storage element

  // Storage element: asynchronous load has top priority; otherwise q
  // updates on the clock edge from the combinational next-state logic.
  always @(posedge clk or negedge aload_n) begin
    if (!aload_n) q <= ~async_data_n;
    else q <= q_next;
  end

  // Next-state logic, shared by flip-flop mode and latch mode.
  always @(*) begin
    if (!aload_n) begin
      // Asynchronous load has highest priority.
      q_next = ~async_data_n;
    end else if (lat_mode == 1'b0) begin
      // Flip-flop mode: updates are sampled only at posedge clk (above).
      if (en && !sload_n) q_next = sload_data;        // synchronous load
      else if (en && sload_n) q_next = d;              // normal D input
      else q_next = q;                                  // hold
    end else begin
      // Latch mode: transparent while clk & en are both high.
      if (clk && en && !sload_n) q_next = sload_data;  // synchronous load
      else if (clk && en && sload_n) q_next = d;        // normal D input
      else q_next = q;                                  // hold
    end
  end

endmodule

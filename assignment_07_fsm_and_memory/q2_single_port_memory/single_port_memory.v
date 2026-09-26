//==============================================================================
// Module      : single_port_memory
// Description : Synchronous single-port memory with independent write/read
//               enables, an optional pipeline stage on the address input,
//               an optional pipeline stage on the data output, and an
//               optional output parity bit.
// Parameters  : MEM_WIDTH      - data width in bits (default 16)
//               MEM_DEPTH      - number of addressable words (default 1024)
//               ADDR_WIDTH     - address width in bits (default 10)
//               ADDR_PIPELINE  - 1 = register addr before use (default 0)
//               DOUT_PIPELINE  - 1 = add an extra output register stage (default 0)
//               PARITY_ENABLE  - 1 = compute XOR parity of dout (default 1)
// Inputs      : din          - write data
//               addr         - read/write address
//               wr_en        - write enable
//               rd_en        - read enable
//               blk_select   - block/chip select, gates all accesses
//               addr_en      - address enable, gates the write path
//               dout_en      - data-out enable, gates the read path
//               clk, rst     - clock, synchronous active-high reset
// Outputs     : dout         - read data
//               parity_out   - XOR parity of dout (0 if PARITY_ENABLE = 0)
//==============================================================================
module single_port_memory #(
    parameter MEM_WIDTH     = 16,
    parameter MEM_DEPTH     = 1024,
    parameter ADDR_WIDTH    = 10,
    parameter ADDR_PIPELINE = 1'b0,
    parameter DOUT_PIPELINE = 1'b0,
    parameter PARITY_ENABLE = 1
) (
    input      [MEM_WIDTH-1:0] din,
    input      [ADDR_WIDTH-1:0] addr,
    input                        wr_en,
    input                        rd_en,
    input                        blk_select,
    input                        addr_en,
    input                        dout_en,
    input                        clk,
    input                        rst,
    output     [MEM_WIDTH-1:0] dout,
    output                       parity_out
);

  reg [MEM_WIDTH-1:0] mem[0:MEM_DEPTH-1];

  reg [MEM_WIDTH-1:0]  dout_stage1;   // first read-data register
  reg [MEM_WIDTH-1:0]  dout_stage2;   // optional second (pipelined) read-data register
  reg [ADDR_WIDTH-1:0] addr_reg;      // optional registered address

  always @(posedge clk) begin
    if (rst) begin
      dout_stage1 <= 0;
      dout_stage2 <= 0;
      addr_reg    <= 0;
    end else begin
      dout_stage2 <= dout_stage1;

      if (ADDR_PIPELINE) begin
        // Registered-address mode: writes/reads use addr_reg, which
        // lags the input addr by one clock cycle.
        addr_reg <= addr;
        if (blk_select) begin
          if (wr_en && addr_en) mem[addr_reg] <= din;
          if (rd_en && dout_en) dout_stage1 <= mem[addr_reg];
        end
      end else begin
        // Direct-address mode: writes/reads use addr combinationally.
        if (blk_select) begin
          if (wr_en && addr_en) mem[addr] <= din;
          if (rd_en && dout_en) dout_stage1 <= mem[addr];
        end
      end
    end
  end

  assign dout       = (DOUT_PIPELINE) ? dout_stage2 : dout_stage1;
  assign parity_out = (PARITY_ENABLE) ? ^dout : 1'b0;

endmodule

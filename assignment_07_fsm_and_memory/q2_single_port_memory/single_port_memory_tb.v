//==============================================================================
// Testbench   : single_port_memory_tb
// Description : Resets the memory, performs one write followed by one
//               read at the same address, and waits several cycles for
//               the (registered) read data to appear.
//==============================================================================
module single_port_memory_tb ();

  parameter MEM_WIDTH  = 16;
  parameter ADDR_WIDTH = 10;

  reg  [MEM_WIDTH-1:0]  din;
  reg  [ADDR_WIDTH-1:0] addr;
  reg                    wr_en;
  reg                    rd_en;
  reg                    blk_select;
  reg                    addr_en;
  reg                    dout_en;
  reg                    clk;
  reg                    rst;

  wire [MEM_WIDTH-1:0] dout;
  wire                  parity_out;

  single_port_memory dut (
      din,
      addr,
      wr_en,
      rd_en,
      blk_select,
      addr_en,
      dout_en,
      clk,
      rst,
      dout,
      parity_out
  );

  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end

  initial begin
    rst = 1;
    @(negedge clk);
    rst        = 0;
    blk_select = 1;
    addr_en    = 1;
    dout_en    = 1;

    // Write operation
    addr  = 10'h0A;
    din   = 16'hAAAA;
    wr_en = 1;
    @(negedge clk);
    wr_en = 0;

    // Read operation
    addr  = 10'h0A;
    rd_en = 1;
    repeat (6) @(negedge clk);

    $stop();
  end

endmodule

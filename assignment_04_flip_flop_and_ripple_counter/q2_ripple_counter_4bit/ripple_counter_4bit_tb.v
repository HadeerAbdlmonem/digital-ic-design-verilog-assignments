//==============================================================================
// Testbench   : ripple_counter_4bit_tb
// Description : Applies reset then lets the counter free-run while a
//               clock toggles every time unit.
//==============================================================================
module ripple_counter_4bit_tb;

  reg        clk, rstn;
  wire [3:0] out;

  ripple_counter_4bit dut (
      .clk (clk),
      .rstn(rstn),
      .out (out)
  );

  initial begin
    clk = 1;
    forever #1 clk = ~clk;
  end

  initial begin
    rstn = 0;
    #1;
    rstn = 1;
    #100;
    $stop();
  end

endmodule

//==============================================================================
// Testbench   : sle_tb
// Description : Exercises the asynchronous load path, a synchronous-load
//               window, then a latch-mode window.
//==============================================================================
module sle_tb;

  reg  d, clk, en, aload_n, adata_n, sload_n, sdata, lat;
  wire q;

  sle uut (
      .d      (d),
      .clk    (clk),
      .en     (en),
      .aload_n(aload_n),
      .adata_n(adata_n),
      .sload_n(sload_n),
      .sdata  (sdata),
      .lat    (lat),
      .q      (q)
  );

  always #5 clk = ~clk;

  initial begin
    clk     = 0;
    en      = 0;
    aload_n = 1;
    adata_n = 0;
    sload_n = 1;
    sdata   = 0;
    lat     = 0;
    d       = 0;

    #10 aload_n = 0;
    adata_n = 1;
    #10 aload_n = 1;

    #10 lat = 0;
    en = 1;
    d  = 1;
    #20 d = 0;

    #10 sload_n = 0;
    sdata = 1;
    #10 sload_n = 1;

    #10 lat = 1;
    en = 1;
    d  = 1;
    #5 d = 0;
    #5 d = 1;

    #50 $stop;
  end

endmodule

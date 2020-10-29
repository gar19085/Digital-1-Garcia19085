
module testbench();



FFD1 I(CLK, RST, D, Q);
FFD2 II(CLK, RST, D, Q);
FFD4 III(CLK, RST, D, Q);


initial begin

    $monitor("CLK = %b RESET = %b PRESET = %b D = %b Q = %b",
      clk,reset,preset,d,q);
    clk    = 0;
     #1  reset  = 0;
    preset = 0;
    d      = 0;
     #1  reset = 1;
     #2  reset = 0;
     #2  preset = 1;
     #2  preset = 0;
     #2  d = ~d;
    end
     #2  $finish;
  end
  
   always
    #1  clk = ~clk;
  

endmodule
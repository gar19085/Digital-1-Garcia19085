//Implementación de Flip Flop D

//Rodrigo García
//D Flip Flop Reset asíncrono y Set Sincrono
module DFFRASSS();
    reg clk, reset, preset, d;
    reg q;

   always @ (posedge clk or posedge reset)
   if (reset) begin
     q <= 0;
   end else if (preset) begin
    q <= 1;
  end else begin
    q <= d;
  end

//Testbench del codigo 

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
    repeat (4) begin
       #2  d      = ~d;
    end
     #2  $finish;
  end
  
   always
    #1  clk = ~clk;
  

endmodule

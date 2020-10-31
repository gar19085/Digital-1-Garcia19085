


module Testbench();



reg CLK, RST, ENABLE, T;
wire Y;


FFT Ju87(CLK, RST, ENABLE,Y);


        always 
            begin 
                CLK <= 0; RST <= 0; #1 CLK <= 1; #1;
            end

            
    initial begin
        $display("\n");
        $display("FLIP-FLOP T");
        $display("CLK | RST | ENABLE | T | Y");
        $monitor("%b  | %b  |    %b  | %b | %b ",
                CLK,RST, ENABLE, T, Y);
        CLK = 0; RST = 0; ENABLE = 0; T = 0;        
     #1  RST = 1;
     #1  RST = 0;
     #2  ENABLE = 1;  
     #2  T = 1;
    end

   always
    #1  CLK = ~CLK;
  
   initial 
        #25 $finish;

        initial begin
            $dumpfile("FFT_Tb.vcd");
            $dumpvars(0, Testbench);
        end

        endmodule
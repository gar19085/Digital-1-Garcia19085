


module testbench();



reg CLK, RST, ENABLE, T;
wire Y;


FFT Ju87(CLK, RST, ENABLE, T, Y);


        always 
            begin 
                CLK <= 0; RST <= 0; #1 CLK <= 1; #1;
            end

            
    initial begin
        $display("\n");
        $display("FLIP-FLOP T");
        $display("CLK | RST | ENABLE | T | Y");
        $monitor("%b  | %b  |    %b  | %b | %b ",
                CLK,RST, ENABLE, T,Y);
        CLK = 0; RST = 0; ENABLE = 0; T = 0;        
     #1  RST = 1;
     #1  RST = 0;
     #1  ENABLE = 1;
     #1  RST = 1;
     #1  RST = 0;     
     #2  T = 0;
     #2  T = 1;
     #6  T = 0;
    end

   always
    #1  CLK = ~CLK;
  
   initial 
        #15 $finish;

        initial begin
            $dumpfile("FFD_tb.vcd");
            $dumpvars(0, testbench);
        end

endmodule
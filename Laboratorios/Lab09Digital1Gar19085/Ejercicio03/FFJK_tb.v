


module Testbench();



reg CLK, RST, ENABLE, J, K;
wire Q;


FFJK Ju88(CLK, RST, ENABLE, J, K, Q);


        always 
            begin 
                CLK <= 0; RST <= 0; #1 CLK <= 1; #1;
            end

            
    initial begin
        $display("\n");
        $display("FLIP-FLOP JK");
        $display("CLK | RST | ENABLE | J  | K   | Q");
        $monitor("%b  | %b  |    %b  | %b |  %b | %b",
                CLK,RST, ENABLE, J, K, Q);
        CLK = 0; RST = 0; ENABLE = 0; J = 0; K = 0;        
     #1  RST = 1;
     #1  RST = 0;
     #2  ENABLE = 1;  
     #2 J = 1;
     #2 K = 1;
     #6 J = 0;
     #6 K = 0;
     #2 J = 1;
    end

   always
    #1  CLK = ~CLK;
  
   initial 
        #25 $finish;

        initial begin
            $dumpfile("FFJK_tb.vcd");
            $dumpvars(0, Testbench);
        end

        endmodule


module testbench();

reg [6:0]IN;
wire [12:0] OUT;

ROM R6(IN, OUT);

initial begin
        $display("\n");
        $display("Buffer");
        $display("IN |  OUT");
        $monitor("%b  |   %b", IN, OUT);
        IN = 0;
        #1 IN = 7'bxxxxxx0;
        #1 IN = 7'b00001x1;     
        #1 IN = 7'b00000x1;       
        #1 IN = 7'b00011x1;       
        #1 IN = 7'b00010x1;       
        #1 IN = 7'b0010xx1;       
        #1 IN = 7'b0011xx1;       
        #1 IN = 7'b0100xx1;       
        #1 IN = 7'b0101xx1;       
        #1 IN = 7'b0110xx1;       
        #1 IN = 7'b0111xx1;       
        #1 IN = 7'b1000x11;       
        #1 IN = 7'b1000x01;       
        #1 IN = 7'b1001x11;       
        #1 IN = 7'b1001x01;       
        #1 IN = 7'b1010xx1;       
        #1 IN = 7'b1011xx1;       
        #1 IN = 7'b1100xx1;       
        #1 IN = 7'b1101xx1;     
        #1 IN = 7'b1110xx1;     
        #1 IN = 7'b1111xx1;   
end        


        initial begin
            $dumpfile("ROM_tb.vcd");
            $dumpvars(0, testbench);
        end

endmodule        
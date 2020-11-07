



module testbench();

reg CLK, RST, ENABLE, AC1, AC2; 
reg [3:0]IN;
reg [2:0] SEL;
wire [3:0] OUT;
wire C, ZERO;


    MAIN T1(CLK, RST, ENABLE, IN, AC1, AC2, SEL, C, ZERO, OUT);

        always 
            begin 
                CLK <= 0; RST <= 0; #1 CLK <= 1; #1;
            end



initial begin
        $display("\n");
        $display("EJERCICIO 02");
        $display("CLK| RST | ENABLE | IN | AC1 | AC2 | SEL | C | ZERO | OUT|");
        $monitor("%b |  %b |   %b   | %b |  %b |  %b | %b  | %b | %b | %b |",
        CLK, RST, ENABLE, IN, AC1, AC2, SEL, C, ZERO, OUT);
        CLK = 0; RST = 0; ENABLE = 0; IN = 0; AC1 = 0; AC2 = 0; SEL = 0;
        #1 RST = 1;
        #1 RST = 0; 
        #1 IN = 2;
        #1 AC1 = 1;
        #1 ENABLE = 1;
        #1 AC2 = 1; IN = 4;
        #1 SEL = 3'b000;
        #5 SEL = 3'b010;
        #1 IN = 3; ENABLE = 0;
        #5 SEL = 3'b100;
        #1 IN = 1; ENABLE = 1;
        #5 SEL = 3'b001;
        #5 SEL = 3'b011;
        

end



   always
    #5  CLK = ~CLK;
  
   initial 
        #40 $finish;


        initial begin
            $dumpfile("ACLU_tb.vcd");
            $dumpvars(0, testbench);
        end

endmodule    


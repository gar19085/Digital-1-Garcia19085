//testbench



module  testbench();

reg [3:0] A,B;
reg [2:0] SEL;

wire [3:0] OUT;

    ALU Bf(A, B, SEL, OUT);

initial begin
        $display("\n");
        $display("Ejercicio 3");
        $display("A | B | SEL |  OUT");
        $monitor("%b |  %b  |   %b   |  %b", A, B, SEL, OUT);
        A = 0; B = 0; SEL = 0;
        #1 A = 1;
        #1 B = 1;
        #1 SEL = 0;
        #1 SEL = 1;
        #1 SEL = 2;
        #1 SEL = 3;
        #1 SEL = 4;
        #1 SEL = 5;
        #1 A = 5; SEL = 5;
        #1 SEL = 6;
        #1 B = 6;
end

   initial 
        #20 $finish;

        initial begin
            $dumpfile("ALU_tb.vcd");
            $dumpvars(0, testbench);
        end


endmodule    
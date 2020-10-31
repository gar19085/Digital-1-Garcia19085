//testbench



module  testbench();

reg [3:0] DPS;
reg AC;

wire [3:0] OUT;

    Buffer Bf(DPS, AC, OUT);

initial begin
        $display("\n");
        $display("Buffer");
        $display("A | AC | OUT");
        $monitor("%b |  %b  |  %b", DPS, AC, OUT);
        DPS = 0; AC = 0;
        #1 AC = 0;
        #2 DPS = 4;
        #1 AC = 1;
        #1 DPS = 5;
           
end

   initial 
        #20 $finish;

        initial begin
            $dumpfile("ALU_tb.vcd");
            $dumpvars(0, testbench);
        end


endmodule    
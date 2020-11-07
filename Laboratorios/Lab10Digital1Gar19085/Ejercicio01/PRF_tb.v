


module testbench();

reg CLK, RST, ENABLE1, ENABLE2, LOAD; 
reg [11:0]IN;
wire [3:0] Q1;
wire [3:0] Q2;


    MAIN T1(CLK, RST, ENABLE1, ENABLE2, LOAD, IN, Q1, Q2);

        always 
            begin 
                CLK <= 0; RST <= 0; #1 CLK <= 1; #1;
            end

initial begin
        $display("\n");
        $display("EJERCICIO 01");
        $display("CLK| RST | ENABLE1 | ENABLE2 | LOAD | IN | Q1 | Q2 | Q1Hex | Q2Hex |");
        $monitor("%b |  %b |   %b    |   %b    |  %b  | %b | %b | %b |  %h   |   %h  |",
        CLK, RST, ENABLE1, ENABLE2, LOAD, IN, Q1, Q2, Q1, Q2);
        CLK = 0; RST = 0; ENABLE1 = 0; ENABLE2 = 0; LOAD = 0; IN = 0; 
        #1 RST = 1;
        #1 RST = 0;
        #1 ENABLE1 = 1;
        #1 ENABLE2 = 1;
        #1 IN = 12'b00000001;
        #10 IN = 12'b00001010;
        #15 LOAD = 1;
        #1  ENABLE1 = 0; ENABLE2 = 0;
        #5 LOAD = 1;
        #1  ENABLE1 = 1; ENABLE2 = 1;
end
  
   always
    #5  CLK = ~CLK;
  
   initial 
        #40 $finish;


        initial begin
            $dumpfile("PRF_tb.vcd");
            $dumpvars(0, testbench);
        end

endmodule    
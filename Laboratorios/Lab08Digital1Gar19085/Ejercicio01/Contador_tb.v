//testbench

module testbench();

reg CLK, RST, LOAD, ENABLE; 
reg [11:0] E;
wire [11:0] COUNT;

        always 
            begin 
                CLK <= 0; RST <= 0; #1 CLK <= 1; #1;
            end

Counter Ju88(CLK, RST, ENABLE, LOAD, E, COUNT);

    initial begin
        $display("\n");
        $display("Ejercicio 1");
        $display("CLK | RST | ENABLE |LOAD | E | COUNT");
        $monitor("%b | %b | %b | %b | %b | %b", CLK, RST, ENABLE, LOAD, E, COUNT);
        CLK = 0; RST = 0; ENABLE = 0; LOAD = 0; E = 000000000000;
        #1  RST = 1;
        #1  RST = 0; 
        #1  RST = 0;
        #4  LOAD = 1; E = 12'b000011001100;
        #2  ENABLE = 1; LOAD = 0;
        #50  RST = 1; ENABLE = 0;
        #2  RST = 0;  
        #2  LOAD = 1;
        #2  ENABLE = 1;
        #2  LOAD = 0;
        #2  LOAD = 1; E = 12'b001011111100;
        #20  LOAD = 0;

    end

    always 
        #1 CLK = ~CLK;

    initial 
        #200 $finish;

        initial begin
            $dumpfile("Contador_tb.vcd");
            $dumpvars(0, testbench);
        end

endmodule
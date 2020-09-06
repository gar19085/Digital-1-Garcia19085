//Testbench de los programas
//TESTBENCH


module testbench();

    reg CLK, reset; 
    reg A, B, A2;
    wire [1:0] SF, SP;
    wire [2:0] SF2, SP2;
        
        always 
            begin 
                CLK <= 0; reset <= 0; #1 CLK <= 1; #1;
            end

Ejer1 E1(A, B, CLK, reset, Y, SF, SP);
Ejer3 E3(A2, CLK, reset, SF2, SP2, Y1, Y2, Y3);

  initial begin
        $display("\n");
        $display("Ejercicio 1");
        $display("reset A B SF SP Y");
        $monitor("%b %b %b %b %b %b", reset, A, B, SF, SP, Y);
           A = 0; B = 0; CLK = 0; reset = 0;
        #1   reset = 1; 
        #1   reset = 0; A = 1; B = 1; 
        #1   reset = 1; A = 0; B = 0; 
    end



  initial begin
        #9
        $display("\n");
        $display("Ejercicio 3");
        $display("reset A2  SF2 SP2 Y1 Y2 Y3");
        $monitor("%b %b %b %b %b %b", reset, A2, SF2, SP2, Y1, Y2, Y3);
            reset = 1; A2 = 1;
        #8 A2 = 1; reset = 0;
        #2 A2 = 0;
        
    end

    always 
        #5 CLK = ~CLK;

    initial 
        #25 $finish;

        initial begin
            $dumpfile("Ejer6_tb.vcd");
            $dumpvars(0, testbench);
        end
endmodule



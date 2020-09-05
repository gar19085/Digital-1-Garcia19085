//Testbench de los programas
//TESTBENCH


module testbench();

    reg CLK, reset; 
    reg A, B, A2;
        
        always 
            begin 
                CLK <= 0; reset <= 0; #1 CLK <= 1; #1;
            end

Ejer1 E1(A, B, CLK, reset, Y);
Ejer3 E3(A2, CLK, reset, Y1, Y2, Y3);

  initial begin
        $display("\n");
        $display("Ejercicio 1");
        $display("CLK reset A B Y");
        $monitor("%b %b %b %b %b", CLK, reset, A, B, Y);
           A = 0; B = 0; 
        #1 A = 0; B = 1; 
        #1 A = 1; B = 0;
        #1 A = 1; B = 1;
        #1 A = 0; B = 0;
        #1 A = 0; B = 1;
        #1 A = 1; B = 0;
        #1 A = 1; B = 1;
    end



  initial begin
        $display("\n");
        $display("Ejercicio 3");
        $display("CLK reset A2 Y1 Y2 Y3");
        $monitor("%b %b %b %b %b", CLK, reset, A2, Y1, Y2, Y3);
            reset = 1; A2 = 1;
        #8 A2 = 1; reset = 0;
        #2 A2 = 0;
        
    end

    initial 
        #25 $finish;

        initial begin
            $dumpfile("Ejer6.vcd");
            $dumpvars(0, testbench);
        end
endmodule



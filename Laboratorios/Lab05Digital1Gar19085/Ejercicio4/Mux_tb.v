//LAB 04
//RODRIGO GARCÍA 19085


//CONFIG DEL TESTBENCH

module  TESTBENCH();
    //MUX 2:1
    reg D0, D1, S; //TABLA 01
    wire Y;

    //MUX 4:1

//MUX 2:1
    Mux2x1 M2(D0, D1, S, Y);


    initial begin
        $display("MUX2:1");
        $display("S D1 D0 | Y");
        $display("--------|---");
        $monitor("%b %b %b | %b", S, D1, D0, Y);
           S = 0; D1 = 0; D0 = 0;
        #1 S = 0; D1 = 0; D0 = 1;
        #1 S = 0; D1 = 1; D0 = 0;
        #1 S = 0; D1 = 1; D0 = 1;
        #1 S = 1; D1 = 0; D0 = 0;
        #1 S = 1; D1 = 0; D0 = 1;
        #1 S = 1; D1 = 1; D0 = 0;
        #1 S = 1; D1 = 1; D0 = 1;
    end //Termina en 8


//TESTBENCH MUX2:1
    initial 
        #9 $finish;

    initial begin  
        $dumpfile("Mux_tb.vcd");
        $dumpvars(0, TESTBENCH);
    end 

endmodule
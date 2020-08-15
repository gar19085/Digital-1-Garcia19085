//LAB 04
//RODRIGO GARCÍA 19085


//CONFIG DEL TESTBENCH

module  TESTBENCH();
    //MUX 2:1
    reg t1, t2, t3; //TABLA 01
    wire PzI;

    //MUX 4:1

//MUX 2:1
    M2x1Tabla01 M2(t1, t2, t3, PzI);


    initial begin
        $display("MUX2:1");
        $display("A B C | Y");
        $display("------|---");
        $monitor("%b %b %b | %b", t1, t2, t3, PzI);
           t1 = 0; t2 = 0; t3 = 0;
        #1 t1 = 0; t2 = 0; t3 = 1;
        #1 t1 = 0; t2 = 1; t3 = 0;
        #1 t1 = 0; t2 = 1; t3 = 1;
        #1 t1 = 1; t2 = 0; t3 = 0;
        #1 t1 = 1; t2 = 0; t3 = 1;
        #1 t1 = 1; t2 = 1; t3 = 0;
        #1 t1 = 1; t2 = 1; t3 = 1;
    end //Termina en 8


//TESTBENCH MUX2:1
    initial 
        #9 $finish;

    initial begin  
        $dumpfile("Mux_tb.vcd");
        $dumpvars(0, TESTBENCH);
    end 

endmodule
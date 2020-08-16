//LAB 04
//RODRIGO GARCÍA 19085


//CONFIG DEL TESTBENCH

module  TESTBENCH();
//Tabla 01
    
    reg t1, t2, t3, //MUX 2:1
        t4, t5, t6, //MUX 4:1
        t7, t8, t9; //MUX 8:1
    wire Pz1, Pz2, Pz3;


//MUX 2:1
    M2x1Tabla01 M2(t1, t2, t3, Pz1);
    M4x1Tabla01 M(t4, t5, t6, Pz2);


    initial begin
        $display("MUX2:1, Tabla 01");
        $display("A B C | Y");
        $display("------|---");
        $monitor("%b %b %b | %b", t1, t2, t3, Pz1);
           t1 = 0; t2 = 0; t3 = 0;
        #1 t1 = 0; t2 = 0; t3 = 1;
        #1 t1 = 0; t2 = 1; t3 = 0;
        #1 t1 = 0; t2 = 1; t3 = 1;
        #1 t1 = 1; t2 = 0; t3 = 0;
        #1 t1 = 1; t2 = 0; t3 = 1;
        #1 t1 = 1; t2 = 1; t3 = 0;
        #1 t1 = 1; t2 = 1; t3 = 1;
    end //Termina en 8


    initial begin
        #9
        $display("\n");
        $display("MUX4:1, Tabla 01");
        $display("A B C | Y");
        $display("------|---");
        $monitor("%b %b %b | %b", t4, t5, t6, Pz2);
           t4 = 0; t5 = 0; t6 = 0;
        #1 t4 = 0; t5 = 0; t6 = 1;
        #1 t4 = 0; t5 = 1; t6 = 0;
        #1 t4 = 0; t5 = 1; t6 = 1;
        #1 t4 = 1; t5 = 0; t6 = 0;
        #1 t4 = 1; t5 = 0; t6 = 1;
        #1 t4 = 1; t5 = 1; t6 = 0;
        #1 t4 = 1; t5 = 1; t6 = 1;
    end //Termina en 16

    initial begin
        #17
        $display("\n");
        $display("MUX8:1, Tabla 01");
        $display("A B C | Y");
        $display("------|---");
        $monitor("%b %b %b | %b", t7, t8, t9, Pz3);
           t7 = 0; t8 = 0; t9 = 0;
        #1 t7 = 0; t8 = 0; t9 = 1;
        #1 t7 = 0; t8 = 1; t9 = 0;
        #1 t7 = 0; t8 = 1; t9 = 1;
        #1 t7 = 1; t8 = 0; t9 = 0;
        #1 t7 = 1; t8 = 0; t9 = 1;
        #1 t7 = 1; t8 = 1; t9 = 0;
        #1 t7 = 1; t8 = 1; t9 = 1;
    end //Termina en  24



//TESTBENCH MUX2:1
    initial 
        #25 $finish;

    initial begin  
        $dumpfile("Mux_tb.vcd");
        $dumpvars(0, TESTBENCH);
    end 

endmodule
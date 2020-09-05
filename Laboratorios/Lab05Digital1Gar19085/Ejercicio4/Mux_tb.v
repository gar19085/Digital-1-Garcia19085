//LAB 04
//RODRIGO GARCÍA 19085


//CONFIG DEL TESTBENCH

module  TESTBENCH();
//Tabla 01
    
    reg t1, t2, t3, //MUX 2:1
        t4, t5, t6, //MUX 4:1
        t7, t8, t9, //MUX 8:1
        t10, t11, t12, //MUX 2:1 T2
        t13, t14, t15, //MUX 4:1 T2
        t16, t17, t18; //MUX 8:1 T2
    wire Pz1, Pz2, Pz3, Pz4, Pz5, Pz6;


//MUX 2:1
    M2x1Tabla01 M21(t1, t2, t3, Pz1);
    M4x1Tabla01 M41(t4, t5, t6, Pz2);
    M8x1Tabla01 M81(t7, t8, t9, Pz3);

    M2x1Tabla02 M22(t10, t11, t12, Pz4);
    M4x1Tabla02 M42(t13, t14, t15, Pz5);
    M8x1Tabla02 M82(t16, t17, t18, Pz6);
    


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
        $monitor("%b %b %b | %b" t4, t5, t6, Pz2);
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

    initial begin
        #25
        $display("\n");
        $display("MUX2:1, Tabla 02");
        $display("A B C | Y");
        $display("------|---");
        $monitor("%b %b %b | %b", t10, t11, t12, Pz4);
           t10 = 0; t11 = 0; t12 = 0;
        #1 t10 = 0; t11 = 0; t12 = 1;
        #1 t10 = 0; t11 = 1; t12 = 0;
        #1 t10 = 0; t11 = 1; t12 = 1;
        #1 t10 = 1; t11 = 0; t12 = 0;
        #1 t10 = 1; t11 = 0; t12 = 1;
        #1 t10 = 1; t11 = 1; t12 = 0;
        #1 t10 = 1; t11 = 1; t12 = 1;
    end //Termina en  32

    initial begin
        #33
        $display("\n");
        $display("MUX4:1, Tabla 02");
        $display("A B C | Y");
        $display("------|---");
        $monitor("%b %b %b | %b", t13, t14, t15, Pz5);
           t13 = 0; t14 = 0; t15 = 0;
        #1 t13 = 0; t14 = 0; t15 = 1;
        #1 t13 = 0; t14 = 1; t15 = 0;
        #1 t13 = 0; t14 = 1; t15 = 1;
        #1 t13 = 1; t14 = 0; t15 = 0;
        #1 t13 = 1; t14 = 0; t15 = 1;
        #1 t13 = 1; t14 = 1; t15 = 0;
        #1 t13 = 1; t14 = 1; t15 = 1;
    end //Termina en  40

    initial begin
        #41
        $display("\n");
        $display("MUX8:1, Tabla 02");
        $display("A B C | Y");
        $display("------|---");
        $monitor("%b %b %b | %b", t16, t17, t18, Pz6);
           t16 = 0; t17 = 0; t18 = 0;
        #1 t16 = 0; t17 = 0; t18 = 1;
        #1 t16 = 0; t17 = 1; t18 = 0;
        #1 t16 = 0; t17 = 1; t18 = 1;
        #1 t16 = 1; t17 = 0; t18 = 0;
        #1 t16 = 1; t17 = 0; t18 = 1;
        #1 t16 = 1; t17 = 1; t18 = 0;
        #1 t16 = 1; t17 = 1; t18 = 1;
    end //Termina en  48

//TESTBENCH MUX2:1
    initial 
        #49 $finish;

    initial begin  
        $dumpfile("Mux_tb.vcd");
        $dumpvars(0, TESTBENCH);
    end 

endmodule
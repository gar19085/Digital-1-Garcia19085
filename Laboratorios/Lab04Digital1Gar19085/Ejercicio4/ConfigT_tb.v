// Config de cada modulo en el Testbench();


//Inicio del module testbench

module testbench();

    reg p1, p2, p3; //Gate Lvl 1
    reg p4, p5, p6; //Gate Lvl 2
    reg p7, p8, p9, p10; //Gate Lvl 3
    reg p11, p12, p13, p14;//Gate Lvl 4
    reg o1, o2, o3, o4;   //Logic Lvl 1
    reg o5, o6, o7;   //Logic Lvl 2   
    reg o8, o9, o10, o11;     //Logic Lvl 3  
    reg o12, o13, o14;    //Logic Lvl 4
    wire pz1, pz2, pz3, pz4, pz5, pz6, pz7, pz8; //Salidas

//Tablas Ejercicio 1
    GateLvl_1      G1(p1, p2, p3, pz1); //Config Modulo
    GateLvl_2      G2(p4, p5, p6, pz3); //Config Modulo
    GateLvl_3      G3(p7, p8, p9, p10, pz5); //Config Modulo
    GateLvl_4      G4(p11, p12, p13, p14, pz7); //Config Modulo
//Tablas Ejercicio 2
    Logic_Lvl_1    L1(o1, o2, o3, 04, pz2); //Config Operador
    Logic_Lvl_2    L2(o5, o6, o7, pz4); //Config Operador
    Logic_Lvl_3    L3(o8, o9, o10, o11, pz6); //Config Operador
    Logic_Lvl_4    L4(o12, o13, o14, pz8); //Config Operador

//Inicio config GateLVL Ejercicio 1

    initial begin //Tabla 1
        $display("Tablas 1, 2, 3, 4, Ejercicio 1");
        $display("A B C | Y");
        $display("------|---");
        $monitor("%b %b %b | $b", p1, p2, p3, pz1);
           p1 = 0; p2 = 0; p3 = 0;
        #1 p1 = 0; p2 = 0; p3 = 1;
        #1 p1 = 0; p2 = 1; p3 = 0;
        #1 p1 = 0; p2 = 1; p3 = 1;
        #1 p1 = 1; p2 = 0; p3 = 0;
        #1 p1 = 1; p2 = 0; p3 = 1;
        #1 p1 = 1; p2 = 1; p3 = 0;
        #1 p1 = 1; p2 = 1; p3 = 1;
    end //Termina en 8

    initial begin //Tabla 2
        #9 
        $display("\n");
        $display("A B C | Y");
        $display("------|---");
        $monitor("%b %b %b | $b", p4, p5, p6, pz3);
           p4 = 0; p5 = 0; p6 = 0;
        #1 p4 = 0; p5 = 0; p6 = 1;
        #1 p4 = 0; p5 = 1; p6 = 0;
        #1 p4 = 0; p5 = 1; p6 = 1;
        #1 p4 = 1; p5 = 0; p6 = 0;
        #1 p4 = 1; p5 = 0; p6 = 1;
        #1 p4 = 1; p5 = 1; p6 = 0;
        #1 p4 = 1; p5 = 1; p6 = 1;
    end //Termina en 16

    initial begin //Tabla 3
        #17 
        $display("\n");
        $display("A B C  D | Y");
        $display("--------|---");
        $monitor("%b %b %b %b | $b", p7, p8, p9, p10, pz5);
           p7 = 0; p8 = 0; p9 = 0; p10 = 0;
        #1 p7 = 0; p8 = 0; p9 = 0; p10 = 1;
        #1 p7 = 0; p8 = 0; p9 = 1; p10 = 0;
        #1 p7 = 0; p8 = 0; p9 = 1; p10 = 1;
        #1 p7 = 0; p8 = 1; p9 = 0; p10 = 0;
        #1 p7 = 0; p8 = 1; p9 = 0; p10 = 1;
        #1 p7 = 0; p8 = 1; p9 = 1; p10 = 0;
        #1 p7 = 0; p8 = 1; p9 = 1; p10 = 1;
        #1 p7 = 1; p8 = 0; p9 = 0; p10 = 0;
        #1 p7 = 1; p8 = 0; p9 = 0; p10 = 1;
        #1 p7 = 1; p8 = 0; p9 = 1; p10 = 0;
        #1 p7 = 1; p8 = 0; p9 = 1; p10 = 1;
        #1 p7 = 1; p8 = 1; p9 = 0; p10 = 0;
        #1 p7 = 1; p8 = 1; p9 = 0; p10 = 1;
        #1 p7 = 1; p8 = 1; p9 = 1; p10 = 0;
        #1 p7 = 1; p8 = 1; p9 = 1; p10 = 1;
    end //Termina en 32

    initial begin //Tabla 4
        #33
        $display("\n");
        $display("A B C D | Y");
        $display("--------|---");
        $monitor("%b %b %b %b | $b", p11, p12, p13, p14, pz7);
           p11 = 0; p12 = 0; p13 = 0; p14 = 0;
        #1 p11 = 0; p12 = 0; p13 = 0; p14 = 1;
        #1 p11 = 0; p12 = 0; p13 = 1; p14 = 0;
        #1 p11 = 0; p12 = 0; p13 = 1; p14 = 1;
        #1 p11 = 0; p12 = 1; p13 = 0; p14 = 0;
        #1 p11 = 0; p12 = 1; p13 = 0; p14 = 1;
        #1 p11 = 0; p12 = 1; p13 = 1; p14 = 0;
        #1 p11 = 0; p12 = 1; p13 = 1; p14 = 1;
        #1 p11 = 1; p12 = 0; p13 = 0; p14 = 0;
        #1 p11 = 1; p12 = 0; p13 = 0; p14 = 1;
        #1 p11 = 1; p12 = 0; p13 = 1; p14 = 0;
        #1 p11 = 1; p12 = 0; p13 = 1; p14 = 1;
        #1 p11 = 1; p12 = 1; p13 = 0; p14 = 0;
        #1 p11 = 1; p12 = 1; p13 = 0; p14 = 1;
        #1 p11 = 1; p12 = 1; p13 = 1; p14 = 0;
        #1 p11 = 1; p12 = 1; p13 = 1; p14 = 1;
    end   //Termina en 48 

//Inicio config Operadores logicos Ejercicio 2
    initial begin //Tabla 1
        #49
        $display("\n");
        $display("Tablas 1, 2, 3, 4, Ejercicio 2");
        $display("A B C D | Y");
        $display("--------|---");
        $monitor("%b %b %b %b | $b", o1, o2, o3, o4, pz2);
           o1 = 0; o2 = 0; o3 = 0; o4 = 0;
        #1 o1 = 0; o2 = 0; o3 = 0; o4 = 1;
        #1 o1 = 0; o2 = 0; o3 = 1; o4 = 0;
        #1 o1 = 0; o2 = 0; o3 = 1; o4 = 1;
        #1 o1 = 0; o2 = 1; o3 = 0; o4 = 0;
        #1 o1 = 0; o2 = 1; o3 = 0; o4 = 1;
        #1 o1 = 0; o2 = 1; o3 = 1; o4 = 0;
        #1 o1 = 0; o2 = 1; o3 = 1; o4 = 1;
        #1 o1 = 1; o2 = 0; o3 = 0; o4 = 0;
        #1 o1 = 1; o2 = 0; o3 = 0; o4 = 1;
        #1 o1 = 1; o2 = 0; o3 = 1; o4 = 0;
        #1 o1 = 1; o2 = 0; o3 = 1; o4 = 1;
        #1 o1 = 1; o2 = 1; o3 = 0; o4 = 0;
        #1 o1 = 1; o2 = 1; o3 = 0; o4 = 1;
        #1 o1 = 1; o2 = 1; o3 = 1; o4 = 0;
        #1 o1 = 1; o2 = 1; o3 = 1; o4 = 1;
    end //Termina en 64

    initial begin //Tabla 2
       #65
        $display("\n");
        $display("A B C | Y");
        %display("------|---");
        $monitor("%b %b %b | $b", o5, o6, o7, pz4);
         5 = 0; o6 = 0; o7 = 1;
        #1 o5 = 0; o6 = 1; o7 = 0;
        #1 o5 = 0; o6 = 1; o7 = 1;
        #1 o5 = 1; o6 = 0; o7 = 0;
        #1 o5 = 1; o6 = 0; o7 = 1;
        #1 o5 = 1; o6 = 1; o7 = 0;
        #1 o5 = 1; o6 = 1; o7 = 1;
    end //Termina en 72

    initial begin //Tabla 3
        #73
        $display("\n");
        $display("A B C D | Y");
        $display("--------|---");
        $monitor("%b %b %b %b | $b", o8, o9, o10, o11, pz6);
           o8 = 0; o9 = 0; o10 = 0; o11 = 0;
        #1 o8 = 0; o9 = 0; o10 = 0; o11 = 1;
        #1 o8 = 0; o9 = 0; o10 = 1; o11 = 0;
        #1 o8 = 0; o9 = 0; o10 = 1; o11 = 1;
        #1 o8 = 0; o9 = 1; o10 = 0; o11 = 0;
        #1 o8 = 0; o9 = 1; o10 = 0; o11 = 1;
        #1 o8 = 0; o9 = 1; o10 = 1; o11 = 0;
        #1 o8 = 0; o9 = 1; o10 = 1; o11 = 1;
        #1 o8 = 1; o9 = 0; o10 = 0; o11 = 0;
        #1 o8 = 1; o9 = 0; o10 = 0; o11 = 1;
        #1 o8 = 1; o9 = 0; o10 = 1; o11 = 0;
        #1 o8 = 1; o9 = 0; o10 = 1; o11 = 1;
        #1 o8 = 1; o9 = 1; o10 = 0; o11 = 0;
        #1 o8 = 1; o9 = 1; o10 = 0; o11 = 1;
        #1 o8 = 1; o9 = 1; o10 = 1; o11 = 0;
        #1 o8 = 1; o9 = 1; o10 = 1; o11 = 1;
    end //Termina en 88

    initial begin //Tabla 4
        #89
        $display("\n");
        $display("A B C | Y");
        $display("------|---");
        $monitor("%b %b %b %b | $b", o12, o13, o14, pz8);
           o12 = 0; o13 = 0; o14 = 0;
        #1 o12 = 0; o13 = 0; o14 = 1;
        #1 o12 = 0; o13 = 1; o14 = 0;
        #1 o12 = 0; o13 = 1; o14 = 1;
        #1 o11 = 1; o13 = 0; o14 = 0;
        #1 o11 = 1; o13 = 0; o14 = 1; 
        #1 o11 = 1; o13 = 1; o14 = 0; 
        #1 o11 = 1; o13 = 1; o14 = 1; 
    end   //Termina en 96

    initial
        #97 $finish;

    initial begin  
        $dumpfile("ConfigT_tb.vcd");
        $dumpvars(0, testbench);
    end 

endmodule
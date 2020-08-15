//Universidad del Valle Digital 1
//Rodrigo José García Ambrosy Carne:19085



module testbench();


    reg s1, s2, s3; //SOP
    reg s4, s5, s6; //POS
    reg s7, s8, s9; //Simplificado
    reg o1, o2, o3; //SOP LOG
    reg o4, o5, o6; //POS LOG
    reg o7, o8, o9; //Simplificado LOG
    wire Pz1, Pz2, Pz3, Pz4, Pz5, Pz6;

//Tablas GateLVL

SistemaSOP  SS(s1, s2, s3, Pz1);
SistemaPOS  SP(s4, s5, s6, Pz3);
SistemaSIM  SSI(s7, s8, s9, Pz5);

//Tablas Logicos

SistemaSOPLOG   SSL(o1, o2, o3, Pz2);
SistemaPOSLOG   SPL(o4, o5, o6, Pz4);
SistemaSIMLOG   SSIL(o7, o8, o9, Pz6);


//Config Tablas GateLVL

    initial begin 
        $display("Tabla SOP");
        $display("L V M | Y");
        $display("------|---");
        $monitor("%b %b %b | %b", s1, s2, s3, Pz1);
           s1 = 0; s2 = 0; s3 = 0;
        #1 s1 = 0; s2 = 0; s3 = 1;
        #1 s1 = 0; s2 = 1; s3 = 0;
        #1 s1 = 0; s2 = 1; s3 = 1;
        #1 s1 = 1; s2 = 0; s3 = 0;
        #1 s1 = 1; s2 = 0; s3 = 1;
        #1 s1 = 1; s2 = 1; s3 = 0;
        #1 s1 = 1; s2 = 1; s3 = 1;    
    end //Termina en 8

    initial begin
        #9
        $display("\n");
        $display("Tabla POS");
        $display("L V M | Y");
        $display("------|---");
        $monitor("%b %b %b | %b", s4, s5, s6, Pz3);
           s4 = 0; s5 = 0; s6 = 0;
        #1 s4 = 0; s5 = 0; s6 = 1;
        #1 s4 = 0; s5 = 1; s6 = 0;
        #1 s4 = 0; s5 = 1; s6 = 1;
        #1 s4 = 1; s5 = 0; s6 = 0;
        #1 s4 = 1; s5 = 0; s6 = 1;
        #1 s4 = 1; s5 = 1; s6 = 0;
        #1 s4 = 1; s5 = 1; s6 = 1;
    end //Termina en 16

    initial begin 
        #17
        $display("\n");
        $display("Tabla Simplificada");
        $display("L V M | Y");
        $display("------|---");
        $monitor("%b %b %b | %b", s7, s8, s9, Pz5);
           s7 = 0; s8 = 0; s9 = 0;
        #1 s7 = 0; s8 = 0; s9 = 1;
        #1 s7 = 0; s8 = 1; s9 = 0;
        #1 s7 = 0; s8 = 1; s9 = 1;
        #1 s7 = 1; s8 = 0; s9 = 0;
        #1 s7 = 1; s8 = 0; s9 = 1;
        #1 s7 = 1; s8 = 1; s9 = 0;
        #1 s7 = 1; s8 = 1; s9 = 1;
    end //Termina en 24

//Inicio config Logicos

    initial begin //SOPLOG
        #25
        $display("\n");
        $display("Tablas Operadores Logicos");
        $display("Tabla SOP");
        $display("L V M | Y");
        $display("------|---");
        $monitor("%b %b %b | %b", o1, o2, o3, Pz2);
           o1 = 0; o2 = 0; o3 = 0;
        #1 o1 = 0; o2 = 0; o3 = 1;
        #1 o1 = 0; o2 = 1; o3 = 0;
        #1 o1 = 0; o2 = 1; o3 = 1;
        #1 o1 = 1; o2 = 0; o3 = 0;
        #1 o1 = 1; o2 = 0; o3 = 1;
        #1 o1 = 1; o2 = 1; o3 = 0;
        #1 o1 = 1; o2 = 1; o3 = 1;
    end //Termina en 32

    initial begin //POSLOG
        #33
        $display("\n");
        $display("Tabla POS");
        $display("L V M | Y");
        $display("------|---");
        $monitor("%b %b %b | %b", o4, o5, o6, Pz4);
           o4 = 0; o5 = 0; o6 = 0;
        #1 o4 = 0; o5 = 0; o6 = 1;
        #1 o4 = 0; o5 = 1; o6 = 0;
        #1 o4 = 0; o5 = 1; o6 = 1;
        #1 o4 = 1; o5 = 0; o6 = 0;
        #1 o4 = 1; o5 = 0; o6 = 1;
        #1 o4 = 1; o5 = 1; o6 = 0;
        #1 o4 = 1; o5 = 1; o6 = 1;
    end //Termina en 40

    initial begin //SistemaSIMLOG
        #41
        $display("\n");
        $display("Tabla Simplificada");
        $display("L V M | Y");
        $display("------|---");
        $monitor("%b %b %b | %b", o7, o8, o9, Pz6);
           o7 = 0; o8 = 0; o9 = 0;
        #1 o7 = 0; o8 = 0; o9 = 1;
        #1 o7 = 0; o8 = 1; o9 = 0;
        #1 o7 = 0; o8 = 1; o9 = 1;
        #1 o7 = 1; o8 = 0; o9 = 0;
        #1 o7 = 1; o8 = 0; o9 = 1;
        #1 o7 = 1; o8 = 1; o9 = 0;
        #1 o7 = 1; o8 = 1; o9 = 1;
    end //Termina en 48

    initial
        #49 $finish;

    initial begin  
        $dumpfile("Sistema5_tb.vcd");
        $dumpvars(0, testbench);
    end 

endmodule
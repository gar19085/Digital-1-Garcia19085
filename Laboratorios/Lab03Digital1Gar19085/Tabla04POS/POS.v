//Universidad del Valle Digital 1
//Rodrigo José García Ambrosy Carne:19085
//Tabla 04 POS

//Hago el módulo
module POS();

//Variables de entrada y de salida
reg A, B, C, D;
wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, Y;

//compuertas

not N1(w1, A);
not N2(w2, B);
not N3(w3, C);
not N4(w4, D);

or O5(w5, A, B, C, w4);
or O6(w6, A, w2, C, D);
or O7(w7, A, w2, C, w4);
or O8(w8, w1, B, C, w4);
or O9(w9, w1, B, w3, w4);
or O10(w10, w1, w2, w3, D);
or O11(w11, w1, w2, C, w4);
or O12(w12, w1, w2, C, D);
or O13(w13, w1, w2, w3, w4);

and A14(Y, w5, w6, w7, w8, w9, w10, w11, w12, w13);

initial begin
    $display("A B C D | Y");   //impresion de la tabla
    $display("---------"); 
    $monitor("%b %b %b %b| %b", A, B, C, D, Y);
    A = 0; B = 0; C = 0; D = 0;
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 D = 1;
    #1 B = 1; C = 0; D = 0;
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 D = 1;
    #1 A = 1; B = 0; C = 0; D = 0;
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 D = 1;
    #1 B = 1; C = 0; D = 0;
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 D = 1;
    #1 $finish;
end

//código que habilita el GTKWave
    initial
        begin
            $dumpfile("POS_tb.vcd");
            $dumpvars(0, POS);
        end

endmodule


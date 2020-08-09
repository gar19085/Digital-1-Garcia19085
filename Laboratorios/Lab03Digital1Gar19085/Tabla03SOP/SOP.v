//Universidad del Valle Digital 1
//Rodrigo José García Ambrosy Carne:19085
//Tabla 03 SOP

//Hago el módulo
module SOP();

//Variables de entrada y de salida
reg A, B, C, D;
wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, Y;

//compuertas

not N1(w1, A);
not N2(w2, B);
not N3(w3, C);
not N4(w4, D);

and A5(w5, w1, w2, w3, w4);
and A6(w6, w1, w2, w3, D);
and A7(w7, w1, w2, C, w4);
and A8(w8, w1, w2, C, D);
and A9(w9, A, w2, w3, w4);
and A10(w10, A, w2, C, w4);
and A11(w11, A, B, C, w4);

or O12(Y, w5, w6, w7, w8, w9, w10, w11);

initial begin
    $display("A B C D | Y");   //impresion de la tabla
    $display("-----------"); 
    $monitor("%b %b %b %b | %b", A, B, C, D, Y);
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
            $dumpfile("SOP_tb.vcd");
            $dumpvars(0, SOP);
        end

endmodule


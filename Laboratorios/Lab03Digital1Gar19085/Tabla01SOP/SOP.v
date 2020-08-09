//Universidad del Valle Digital 1
//Rodrigo José García Ambrosy Carne:19085
//Tabla 01 SOP

//Hago el módulo
module SOP();

//Variables de entrada y de salida
reg A, B, C;
wire w1, w2, w3, w4, w5, w6, w7, w8, Y;

//compuertas

not N1(w1, A);
not N2(w2, B);
not N3(w3, C);

and A4(w4, w1, w2, w3); 
and A5(w5, w1, B, w3);
and A6(w6, A, w2, w3);
and A7(w7, A, w2, C);
and A8(w8,  A, B, C);

or O9(Y, w4, w5, w6, w7, w8);

initial begin
    $display("A B C | Y");   //impresion de la tabla
    $display("---------"); 
    $monitor("%b %b %b | %b", A, B, C, Y);
    A = 0; B = 0; C = 0;
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 C = 1;
    #1 A = 1; B = 0; C = 0;
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 C = 1; 
    #1 $finish;
end

//código que habilita el GTKWave
    initial
        begin
            $dumpfile("SOP_tb.vcd");
            $dumpvars(0, SOP);
        end

endmodule

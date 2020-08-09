//Universidad del Valle Digital 1
//Rodrigo José García Ambrosy Carne:19085
//Tabla 02 POS

//Hago el módulo
module POS();

//Variables de entrada y de salida
reg A, B, C;
wire w1, w2, w3, w4, w5, w6, w7, w8, Y;

//compuertas

not N1(w1, A);
not N2(w2, B);
not N3(w3, C);

or O4(w4, A, B, C);
or O5(w5, A, w2, C);
or O6(w6, A, w2, w3);
or O7(w7, w1, B, C);
or O8(w8, w1, B, w3);

and A9(Y, w4, w5, w6, w7, w8);

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
            $dumpfile("POS_tb.vcd");
            $dumpvars(0, POS);
        end

endmodule


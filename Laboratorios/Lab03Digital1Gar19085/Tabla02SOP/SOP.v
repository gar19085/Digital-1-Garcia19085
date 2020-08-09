//Universidad del Valle Digital 1
//Rodrigo José García Ambrosy Carne:19085
//Tabla 02 SOP

//Hago el módulo
module SOP();

//Variables de entrada y de salida
reg A, B, C;
wire w1, w2, w3, w4, w5, Y;

//compuertas

not N1(w1, A);
not N2(w2, B);
not N3(w3, C);

and A4(w4, w1, w2, C);
and A5(w5, A, B, w3);
and A6(w6, A, B, C);

or O7(Y, w4, w5, w6);

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

//Universidad del Valle Digital 1
//Rodrigo José García Ambrosy Carne:19085
//Tablas Ejercicio 1
//Gate Level Modeling Tablas

//Inicio Tabla 1

module GateLvl_1(input wire A, B, C, output wire Y);
//Nots
    wire n1, n2, n3; 
//Salidas
    wire w1, w2, w3;

//Operadores
    not (n1, A);
    not (n2, B);
    not (n3, C);
    and (w1, n1, n3);
    and (w2, A, C);
    and (w3, A, n2);
    or  (Y, w1, w2, w3);
endmodule   

//Inicio Tabla 2

module GateLvl_2(input wire A, B, C, output wire Y);
//Nots
    wire n2;
//Salida solo es 'Y'

//Operadores
    not (n2, B);
    or  (Y, n2);
endmodule   

//Inicio Tabla 3

module GateLvl_3(input wire A, B, C, D, output wire Y);

//Nots
    wire n1, n2, n3, n4;
//Salidas
    wire w1, w2, w3, w4, w5, w6, w7, w8;

//Operadores
    not (n1, A);
    not (n2, B);
    not (n3, C);
    not (n4, D);
    and (w1, n1, n2, n3, n4);
    and (w2, n1, B, n3, n4);
    and (w3, n1, B, n3, D);
    and (w4, A, n2, n3, D);
    and (w5, n1, n2, C, D);
    and (w6, A, B, C, D);
    and (w7, n1, B, C, n4);
    and (w8, A, n2, C, n4);
    or  (Y, w1, w2, w3, w4, w5, w6, w7, w8);
endmodule

//Inicio Tabla 4

module GateLvl_4(input wire A, B, C, D, output wire Y);

//Nots
    wire n3, n4;
//Salidas
    wire w1, w2, w3;

//Operadores
    not (n3, C);
    not (n4, D);
    and (w1, A, n3, n4);
    and (w2, A, B);
    and (w3, A, C);
    or  (Y, w1, w2, w3);
endmodule

//Funciones a implementar

//Tabla 1
module Logic_Lvl_1(input wire A, B, C, D, output wire Y);

    assign Y = (~B & ~C & ~D) | (A & ~C) | (A & ~D) | (A & ~B);

endmodule

//Tabla 2
module Logic_Lvl_2(input wire A, B, C, output wire Y);

    assign Y = (~B) + (C);

endmodule

//Tabla 3
module Logic_Lvl_3(input wire A, B, C, D, output wire Y);

    assign Y = (~B & ~C & D) | (B) | (A & D);

endmodule

//Tabla 4
module Logic_Lvl_4(input wire A, B, C, output wire Y);

    assign Y = (~A & ~C) | (B);

endmodule

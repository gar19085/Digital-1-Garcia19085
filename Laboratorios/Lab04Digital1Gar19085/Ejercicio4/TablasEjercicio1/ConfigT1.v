//Universidad del Valle Digital 1
//Rodrigo José García Ambrosy Carne:19085
//Tablas Ejercicio 1
//Gate Level Modeling Tabla 1 y 2
//Operadores lógicos Tabla 3 y 4

//Ecuación a implementar: Y = (A' * C') + (A * C) + (A * B');
//Tabla 1 Por Gate Level Modeling

module GateLvl_1(input wire, A, B, C, output wire Y);
//Nots
    wire na, nb, nc; 
//Salidas
    wire w1, w2, w3;

//Operadores
    not (na, A);
    not (nb, B);
    not (nc, C);
    and (w1, na, nc);
    and (w2, A, C);
    and (w3, A, nb);
    or  (Y, w1, w2, w3);
endmodule   

//Inicio Tabla 2 Gate Level Modeling
//Ecuación a implementar: Y = (B')

module GateLvl_2(input wire, A, B, C, output wire Y);
//Nots
    wire nb;
//Salida solo es 'Y'

//Operadores
    not (nb, B);
    or  (Y, nb);
endmodule   

//Inicio Tabla 3 Operadores Logicos
module GateLvl_3(input wire, A, B, C, D, output wire Y);

//Nots
    wire na, nb, nc, nd;
//Salidas
    wire w1, w2, w3, w4, w5, w6, w7, w8;

//Operadores
    not (na, A);
    not (nb, B);
    not (nc, C);
    not (nd, D);
    and (w1, na, nb, nc, nd);
    and (w2, na, B, nc, nd);
    and (w3, na, B, nc, D);
    and (w4, A, nb, nc, D);
    and (w5, na, nb, C, D);
    and (w6, A, B, C, D);
    and (w7, na, B, C, nd);
    and (w8, A, nb, C, nd);
    or  (Y, w1, w2, w3, w4, w5, w6, w7, w8);
endmodule

//Inicio Tabla 4 Operadores Logicos
module GateLvl_4(input wire, A, B, C, D, output wire Y);

//Nots
    wire nc, nd
//Salidas
    wire w1, w2, w3;

//Operadores
    not (nc, C);
    not (nd, D);
    and (w1, A, nc, nd);
    and (w2, A, B);
    and (w3, A, C);
    or  (Y, w1, w2, w3);
endmodule

//Funciones a implementar

//Tabla 1
module Logic_Lvl_1(input wire, A, B, C, output wire Y);

    assign Y = (A~ & C~) | (A & C) | (A & B~);

endmodule

//Tabla 2
module Logic_Lvl_2(input wire, A, B, C, output wire Y);

    assign Y = (B~);

endmodule

//Tabla 3
module Logic_Lvl_3(input wire, A, B, C, D, output wire Y);

    assign Y = (A~ & B~ & C~ & D~) | (A~ & B & C~ & D~) | (A~ & B & C~ & D) | (A & B~ & C~ & D) | (A~ & B~ & C & D) | (A & B & C & D) | (A~ & B & C & D~) | (A & B~ & C & D~);

endmodule

//Tabla 4
module Logic_Lvl_4(input wire, A, B, C, D, output wire Y);

    assign Y = (A & C~ & D~) | (A & B) | (A & C);

endmodule

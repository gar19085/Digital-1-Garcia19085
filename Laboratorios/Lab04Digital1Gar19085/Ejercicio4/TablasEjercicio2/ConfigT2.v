//Universidad del Valle Digital 1
//Rodrigo José García Ambrosy Carne:19085
//Tablas Ejercicio 1
//Tablas por Operadores Logicos

//Ecuación a implementar: Y = (B' * C' * D') + (A * C') + (A * D') + (A * B')
//Tabla 1 Por Gate Level Modeling

module GateLvl_1(input wire, A, B, C, D, output wire Y);
//Nots
    wire  nb, nc, nd;
//Salidas
    wire w1, w2, w3, w4;

//Operadores
    not (nb, B);
    not (nc, C);
    not (nd, D);
    and (w1, nb, nc, nd);
    and (w2, A, nc);
    and (w3, A, nd);
    and (w4, A, nb);
    or  (Y, w1, w2, w3, w4);
endmodule   

//Inicio Tabla 2 Gate Level Modeling
//Ecuación a implementar: Y = B' + C

module GateLvl_2(input wire, A, B, C, output wire Y);
//Nots
    wire nb;
//Salida Solo esta "Y"

//Operadores
    not (nb, B);
    or  (Y, nb, C);
endmodule   

//Inicio Tabla 3 Operadores Logicos
module GateLvl_3(input wire, A, B, C, D, output wire Y);

//Nots
    wire nb, nc;
//Salidas
    wire w1, w2;

//Operadores
    not (nb, B);
    not (nc, C);
    and (w1, nb, nc, D);
    and (w2, A, D);
    or  (Y, w1, B, w2);
endmodule

//Inicio Tabla 4 Operadores Logicos
module GateLvl_4(input wire, A, B, C, output wire Y);

//Nots
    wire na, nc;
//Salidas
    wire w1;

//Operadores
    not (na, A);
    not (nc, C);
    and (w1, na, nc);
    or  (Y, w1, B);
endmodule

//Funciones a implementar

//Tabla 1
module Logic_Lvl_1(input wire, A, B, C, output wire Y);

    assign Y = (B~ & C~ & D~) | (A & C~) | (A & D~) | (A & B~);

//Tabla 2
module Logic_Lvl_2(input wire, A, B, C, output wire Y);

    assign Y = (B~) | (C); 

endmodule

//Tabla 3
module Logic_Lvl_3(input wire, A, B, C, D, output wire Y);

    assign Y = (B~ & C~ & D) | (B) | (A & D);

endmodule

//Tabla 4
module Logic_Lvl_4(input wire, A, B, C, D, output wire Y);

    assign Y = (A~ & C~) | (B);

endmodule

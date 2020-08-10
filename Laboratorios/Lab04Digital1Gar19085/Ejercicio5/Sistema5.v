//Universidad del Valle Digital 1
//Rodrigo José García Ambrosy Carne:19085
//Ejercicio 5 - Sistema de Alarma

module SistemaSOP(input wire L, V, M, output wire Y);
//nots
    wire nL, nV, nM;
//salidas
    wire w1, w2, w3;

//operadoers
    not(nL, L);
    not(nV, V);
    not(nM, M);
    and(w1,L, nV, nM);
    and(w2,L, nV, M);
    and(w3,L, V, M);
    or(Y, w1, w2, w3);

endmodule



module SistemaPOS(input wire L, V, M, output wire Y);
//nots
    wire nL, nV, nM;
//salidas
    wire w1, w2, w3, w4, w5;

//operadoers
    not(nL, L);
    not(nV, V);
    not(nM, M);
    or(w1, L, V, M);
    or(w2, L, V, nM);
    or(w3, L, nV, M);
    or(w4, L, nV, nM);
    or(w5, nL, nV, M);
    and(Y, w1, w2, w3, w4, w5);

endmodule



module SistemaSIM(input wire L, V, M, output wire Y);
//nots
    wire nV;
//salidas
    wire w1, w2;

//operadoers
    not(nV, V);
    and(w1, L, nV);
    and(w2, L, M);
    or(Y, w1, w2);

endmodule


module SistemaSOPLOG(input wire L, V, M, output wire Y);

    assign Y = (L & ~V & ~M) | (L & ~V & M) | (L & V & M);

endmodule


module SistemaPOSLOG(input wire L, V, M, output wire Y);

    assign Y = (L | V | M) & (L | V | ~M) & (L | ~V | M) & (L | ~V | ~M) & (~L | ~V | M);
 
endmodule


module SistemaSIMLOG(input wire L, V, M, output wire Y);

    assign Y =  (L & ~V) | (L & M);

endmodule
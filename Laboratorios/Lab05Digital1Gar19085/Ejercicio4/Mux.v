//Universidad del Valle de Guatemala
//Digital 1
//Laboratorio 05
//Rodrigo José García Ambrosy. Carnet: 19085

//IMPLEMENTO DEL MODULO MUX2:1 UTILIZADO EL OPERADOR TERNARIO
module Mux2x1(input wire [3:0] D0, D1, 
              input wire      S,
              output wire [3:0] Y);
    
    assign Y = S ? D1 : D0;

endmodule
//CIERRO EL MODULO DE MUX2:1 PARA PODER IMPLEMENTARLO EN EL MUX4:1

//IMPLEMENTACIÓN DE MUX4:1 CON MUX2:1
module Mux4x1(input wire [3:0]  D0, D1, D2, D3,
              input wire [1:0]  S,
              output wire [3:0] Y);
    wire [3:0] low, high;

    Mux2x1 lomux(D0, D1, S[0], low);
    Mux2x1 himux(D2, D3, S[0], high);
    Mux2x1 outmux(low, high, S[1], Y);

endmodule

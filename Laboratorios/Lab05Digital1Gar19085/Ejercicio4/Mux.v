//Universidad del Valle de Guatemala
//Digital 1
//Laboratorio 05
//Rodrigo José García Ambrosy. Carnet: 19085

//IMPLEMENTO DEL MODULO MUX2:1 UTILIZADO EL OPERADOR TERNARIO
module Mux2x1(input wire [3:0] D0, D1, 
              input wire      S,
              output wire [3:0] Y);
    
    assign Y = S ? D1 : D0;

endmodule //CIERRO MODULO

//IMPLEMENTACIÓN DE MUX4:1 CON MUX2:1
module Mux4x1(input wire [3:0]  D0, D1, D2, D3,
              input wire [1:0]  S1,
              output wire [3:0] Y);

    wire [3:0] low, hig;

    Mux2x1 lowmux(D0, D1, S1[0], low);
    Mux2x1 higmux(D2, D3, S1[0], high);
    Mux2x1 outmux(low, high, S1[1], Y);

endmodule //CIERRO MODULO


//IMPLEMENTACIÓN DE MUX8:1 CON MUX4:1
module Mux8x1(input wire [3:0] D0, D1, D2, D3, D4, D5, D6, D7, D8,
              input wire [1:0] S2,
              output wire [3:0] Y);

        wire [3:0] SA, SB, SC;
    
    Mux4x1 SA(D0, D1, D2, D3. S2[0], SA);
    Mux4x1 SB(D4, D5, D6, D7, S2[0], SB); 
    Mux2X1 SC(SA, SB, S2[0], SC);
    Mux2x1 OUT(SC, S2[1], Y);

endmodule //CIERRO MODULO







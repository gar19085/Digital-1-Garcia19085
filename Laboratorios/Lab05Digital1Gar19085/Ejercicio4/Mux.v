//Universidad del Valle de Guatemala
//Digital 1
//Laboratorio 05
//Rodrigo José García Ambrosy. Carnet: 19085

//IMPLEMENTO DEL MODULO MUX2:1 UTILIZADO EL OPERADOR TERNARIO
module Mux2x1(input wire [3:0] D0, D1, 
              input wire       S,
              output wire [3:0] Y);
    
    assign Y = S ? D1 : D0;

endmodule
//CIERRO EL MODULO DE MUX2:1 PARA PODER IMPLEMENTARLO EN EL MUX4:1



//Universidad del Valle de Guatemala
//Digital 1
//Laboratorio 05
//Rodrigo José García Ambrosy. Carnet: 19085

//IMPLEMENTO DEL MODULO MUX2:1 UTILIZADO EL OPERADOR TERNARIO
module Mux2x1(input wire  D0, D1, 
              input wire      S,
              output wire  Y);
    
    assign Y = S ? D1 : D0;

endmodule //CIERRO MODULO

//IMPLEMENTACIÓN DE MUX4:1 CON MUX2:1
module Mux4x1(input wire   D0, D1, D2, D3,
              input wire   S0, S1,
              output wire  Y);

    wire  low, hig;

    Mux2x1 lowmux(D0, D1, S0, low);
    Mux2x1 higmux(D2, D3, S0, high);
    Mux2x1 outmux(low, high, S1, Y);

endmodule //CIERRO MODULO


//IMPLEMENTACIÓN DE MUX8:1 CON MUX4:1
module Mux8x1(input wire  D0, D1, D2, D3, D4, D5, D6, D7,
              input wire  S0, S1, S2, 
              output wire  Y);

        wire  SA, SB;
    
    Mux4x1 Tig1(D0, D1, D2, D3, S0, S1, SA);
    Mux4x1 Tig2(D4, D5, D6, D7, S0, S1, SB); 
    Mux2x1 Tig3(SA, SB, S2, Y);
    

endmodule //CIERRO MODULO


//IMPLEMENTO TABLA1 DEL MUX2:1
    module M2x1Tabla01( input wire  A, B, C,
                        output wire Y);

        wire O1, O2; //Van en el Mux
        wire R1, R2;

        //compuertas
            xor  (R1, B, C);
            xnor (R2, B, C);

        assign O1 = R1;
        assign O2 = R2;

        Mux2x1  M1(O1, O2, A, Y);

    endmodule 


//IMPLEMENTO TABLA1 DEL MUX4:1
    module M4x1Tabla01( input wire C,
                        input wire S, S1,
                        output wire Y);
        wire N1, N2; //Va al mux
        wire No1;

        //compuertas
            not (No1, C);

        assign N1 = No1;
        assign N2 = No1;
    

        Mux4x1 M2(C, N1, N2, C, S, S1, Y);  
        

    endmodule


//IMPLEMENTO TABLA1 DEL MUX8:1
    module M8x1Tabla01(input wire A, B, C,
                        output wire Y);
        wire V, G;

        assign V = 1;
        assign G = 0;
       

    Mux8x1 M3(G, V, V, G, V, G, G, V, A, B, C, Y);

    endmodule


//IMPLEMENTO TABLA 2 DEL MUX2:1
  //  module M2x1Tabla02( input wire [1:0] B, C,
  //                      input wire   A, 
  //                      output wire [1:0] Y);

//        Mux2x1  M1(A, B, C, Y);

//    endmodule 


//IMPLEMENTO TABLA2 DEL MUX4:1
//    module M4x1Tabla02();

//    endmodule


//IMPLEMENTO TABLA2 DEL MUX8:1
//    module M8x1Tabla02();

//    endmodule


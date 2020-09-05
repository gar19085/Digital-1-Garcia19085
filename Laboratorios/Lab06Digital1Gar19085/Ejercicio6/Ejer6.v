//Implementación Ejercicios 1 y 3 

//Ejercicio 1

//Maquina de estados Finitos Mealy


module Mealy1(input clk, reset, a, b,
              output Y);
    typedef enum logic {S0, S1} statetype;
    statetype state, nextstate;

    always_ff @(posedge clk, posedge reset)
    if (reset) state <= S0;
    else       state <= nextstate;

    always_comb
        case (state)
        S0: if (a) nextstate = S0;
            else   nextstate = S1;
        S1: if (a) nextstate = S0;
            else   nextstate = S1;
        default:   nextstate = S0;
        endcase

        assign Y = (a & State == S1);
endmodule
             

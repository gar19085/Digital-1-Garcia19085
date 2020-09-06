//Implementación Ejercicios 1 y 3 


module FFD (input clk, reset, d,
            output reg q);
        always @ (posedge clk or posedge reset)begin
            if (reset) begin
                q <= 1'b0;
            end
            else begin
                q <= d;
            end
        end   
endmodule


//Ejercicio 1

module Ejer1(input A, B, CLK, RESET,
             output Y, output wire [1:0] SF2, S2);
        wire S0, S1, SF0, SF1;

        assign SF0 = (~S1 & ~S0 & A);
        assign SF1 = (S0 & B) | (S1 & A & B);

        FFD F1(CLK, RESET, SF0, S0);
        FFD F2(CLK, RESET, SF1, S1);

        assign Y = (S1 & ~S0 & A & B);
        assign S2 = {S0, S1};
        assign SF2 = {SF0, SF1};

endmodule


//Ejercicio 3

module Ejer3(input A, clk, reset,
             output Y1, Y2, Y3, 
             output wire [2:0] SF3, S3);
    wire S0, S1, S2, SF0, SF1, SF2;

    assign SF0 = (S0 & ~S2 & ~A) | (S0 & S1 & A) | (S0 & ~S1 & S2) | (~S0 & S1 & S2 & ~A) | (~S0 & S1 & ~S2 & ~A);  
    assign SF1 = (S1 & ~S2 & ~A) | (~S1 & ~S2 & A) | (S1 & S2 & A);
    assign SF2 = ~S2;

    FFD F0(clk, reset, SF0, S0);
    FFD F1(clk, reset, SF1, S1);
    FFD F2(clk, reset, SF2, S2);

    assign Y1 = S0; 
    assign Y2 = (S0 & ~S1) | (~S0 & S1);
    assign Y3 = (S1 & ~S2) | (~S1 & S2);
    assign S3= {S0, S1, S2};
    assign SF3 = {SF0, SF1, SF2};

endmodule




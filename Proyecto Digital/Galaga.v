//UNIVERSIDAD DEL VALLE DE GUATEMALA
//RODRIGO JOSÉ GARCÍA AMBROSY

//FLIP-FLOP D
module FFD (input CLK, RST, D,
            output reg Q);
        always @ (posedge CLK or posedge RST)begin
            if (RST) begin
                Q <= 1'b0;
            end
            else begin
                Q <= D;
            end
        end   
endmodule

//FSM NAVE1
module NAVE1();

endmodule




//ECUACIONES FSM DE LA NAVE 1
module FSMN1 (input wire LEFT, RIGHT, SB1, SB0, 
            output wire L, C, R, SBF1, SBF0);
    assign L = (SB0 & LEFT)  | (SB0 & ~RIGHT) | (~SB1 & LEFT & ~RIGHT);
    assign C = (SB0 & ~LEFT & RIGHT) | (SB1 & LEFT & ~RIGHT) | (~SB1 & ~SB0 & LEFT & RIGHT) | (~SB1 & ~SB0 & ~LEFT & ~RIGHT);
    assign R = (SB1 & ~LEFT)  | (SB1 & RIGHT) | (~SB0 & ~LEFT & RIGHT);
    assign SBF1 = (SB1 & ~LEFT)  | (SB1 & RIGHT) | (~SB0 & ~LEFT & RIGHT);
    assign SBF0 = (SB0 & LEFT)  | (SB0 & ~RIGHT) | (~SB1 & LEFT & ~RIGHT); 
endmodule

//ECUACIONES FSM DE LA NAVE 2
module FSMN2 (input wire LEFT, RIGHT, SB1, SB0, 
            output wire L, C, R, SBF1, SBF0);
    assign L = (SB0 & LEFT)  | (SB0 & ~RIGHT) | (~SB1 & LEFT & ~RIGHT);
    assign C = (SB0 & ~LEFT & RIGHT) | (SB1 & LEFT & ~RIGHT) | (~SB1 & ~SB0 & LEFT & RIGHT) | (~SB1 & ~SB0 & ~LEFT & ~RIGHT);
    assign R = (SB1 & ~LEFT)  | (SB1 & RIGHT) | (~SB0 & ~LEFT & RIGHT);
    assign SBF1 = (SB1 & ~LEFT)  | (SB1 & RIGHT) | (~SB0 & ~LEFT & RIGHT);
    assign SBF0 = (SB0 & LEFT)  | (SB0 & ~RIGHT) | (~SB1 & LEFT & ~RIGHT); 
endmodule

//ECUACIONES SECCIÓN DE PPOSICIÓN
module posicion();

endmodule

//ECUACIONES FSM ARMADURA
module Armor(input wire M, DP1, DP2, SA2, SA1, 
            output wire SAF2, SAF1, A2, A1);
    assign SAF2 = (S2)  | (M & DP1 & ~DP2);
    assign SAF1 = (S1) | (M & ~DP1 & DP2);
    assign A2 = (S1) | (M & ~DP1 & DP2);
    assign A1 = (S2)  | (M & DP1 & ~DP2);
endmodule


//ECUACIONES FSM JUEGO
module juego(input wire M, DP1, DP2, A2, A1, SJ3, SJ2, SJ1, SJ0,
            output wire SJF3, SJF2, SJF1, SJF0, P1A, P1B, P1C,
            P2A, P2B, P2C, DONE);

endmodule


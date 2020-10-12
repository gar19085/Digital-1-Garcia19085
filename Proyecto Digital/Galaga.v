//UNIVERSIDAD DEL VALLE DE GUATEMALA
//RODRIGO JOSÉ GARCÍA AMBROSY

//FLIP-FLOP D
module FFD (input CLK, RST, D,
            output reg Q);
        always @ (posedge CLK or posedge RST)begin
            if (RST)
                Q <= 1'b0;
            else
                Q <= D;
        end   
endmodule

//ECUACIONES FSM DE LA NAVE 1
module FSMN1 (input wire LEFT, RIGHT, CLK, RST,
            output L, C, R);
    wire SB1, SB0, SBF1, SBF0;

    assign L = (SB0 & LEFT)  | (SB0 & ~RIGHT) | (~SB1 & LEFT & ~RIGHT);
    assign C = (SB0 & ~LEFT & RIGHT) | (SB1 & LEFT & ~RIGHT) | (~SB1 & ~SB0 & LEFT & RIGHT) | (~SB1 & ~SB0 & ~LEFT & ~RIGHT);
    assign R = (SB1 & ~LEFT) | (SB1 & RIGHT) | (~SB0 & ~LEFT & RIGHT);
    assign SBF1 = (SB1 & ~LEFT) | (SB1 & RIGHT) | (~SB0 & ~LEFT & RIGHT);
    assign SBF0 = (SB0 & LEFT) | (SB0 & ~RIGHT) | (~SB1 & LEFT & ~RIGHT); 

    FFD JuI(CLK, RST, SBF0, SB0);
    FFD JuII(CLK, RST, SBF1, SB1);

endmodule

//ECUACIONES FSM DE LA NAVE 2
module FSMN2 (input wire LEFT2, RIGHT2, CLK, RST,
            output L2, C2, R2);
        wire SB4, SB2, SBF4, SBF2;    
    assign L2 = (SB2 & LEFT2)  | (SB2 & ~RIGHT2) | (~SB4 & LEFT2 & ~RIGHT2);
    assign C2 = (SB2 & ~LEFT2 & RIGHT2) | (SB4 & LEFT2 & ~RIGHT2) | (~SB4 & ~SB2 & LEFT2 & RIGHT2) | (~SB4 & ~SB2 & ~LEFT2 & ~RIGHT2);
    assign R2 = (SB4 & ~LEFT2)  | (SB4 & RIGHT2) | (~SB2 & ~LEFT2 & RIGHT2);
    assign SBF4 = (SB4 & ~LEFT2)  | (SB4 & RIGHT2) | (~SB2 & ~LEFT2 & RIGHT2);
    assign SBF2 = (SB2 & LEFT2)  | (SB2 & ~RIGHT2) | (~SB4 & LEFT2 & ~RIGHT2); 

    FFD Ju3(CLK, RST, SBF4, SB4);
    FFD Ju4(CLK, RST, SBF2, SB2);

endmodule

//ECUACIONES SECCIÓN DE PPOSICIÓN
module posicion(input wire L, C, R, L2, C2, R2, output MP);

    assign MP = (~L & ~C & R & ~L2 & ~C2 & R2) | (~L & C & ~R & ~L2 & C2 & ~R2) | (L & ~C & ~R & L2 & ~C2 & ~R2);            

endmodule

//ECUACIONES FSM ARMADURA
module Armor(input wire M, MP1, MP2, CLK, RST,
            output wire A2, A1);
        wire SA2, SA1, SAF2, SAF1;     

    assign SAF2 = (SA2)  | (M & MP1 & ~MP2);
    assign SAF1 = (SA1) | (M & ~MP1 & MP2);
    assign A2 = (SA1) | (M & ~MP1 & MP2);
    assign A1 = (SA2)  | (M & MP1 & ~MP2);

    FFD Ju6(CLK, RST, SAF1, SA1);
    FFD Ju7(CLK, RST, SAF2, SA2);

endmodule

//ECUACIONES FSM JUEGO
module juego(input wire M, DP1, DP2, A2, A1, CLK, RST,
            output wire P1A, P1B, P1C, P2A, P2B, P2C, DONE);
        wire  SJ3, SJ2, SJ1, SJ0, SJF3, SJF2, SJF1, SJF0;  

    assign SJF3 = (SJ3 & ~M)  | (SJ3 & DP1)  | (SJ3 & ~DP2)  | (SJ3 & ~A1)  | (SJ2 & M & ~DP1 & DP2 & A1) | (~SJ2 & SJ1 & SJ0 & M & DP1 & ~DP2 & A2) | (SJ2 & ~SJ1 & SJ0 & M & DP1 & ~DP2 & A2) | (SJ2 & SJ1 & ~SJ0 & M & DP1 & ~DP2 & A2);
    assign SJF2 = (SJ2 & SJ1)  | (SJ2 & ~M)  | (SJ2 & DP1 & DP2)  | (SJ2 & ~DP1 & ~DP2) | (SJ3 & M & ~DP1 & DP2 & A1) | (~SJ2 & SJ0 & M & ~DP1 & DP2 & A1) | (SJ1 & ~SJ0 & M & DP1 & ~DP2 & A2) | (SJ2 & ~SJ0 & ~DP2) | (SJ2 & DP2 & ~A1) | (SJ2 & ~DP2 & ~A2);
    assign SJF1 = (SJ1 & ~M) | (SJ3 & M & ~DP1 & DP2 & A1) | (SJ3 & M & DP1 & ~DP2 & A1) | (~SJ3 & ~SJ1 & M & DP1 & ~DP2 & A2) | (~SJ2 & SJ1 & ~DP1) | (SJ1 & ~SJ0 & ~DP1) | (SJ1 & DP1 & DP2) | (SJ1 & ~DP2 & ~A2) | (SJ2 & SJ1 & SJ0 & ~DP2) | (SJ2 & SJ1 & SJ0 & ~A1);
    assign SJF0 = (SJ0 & ~M) | (SJ0 & DP1 & DP2) | (SJ0 & ~DP1 & ~DP2) | (SJ3 & M & DP1 & ~DP2 & A1) | (~SJ2 & SJ1 & ~SJ0 & M & DP1 & ~DP2 & A2) | (SJ2 & ~SJ1 & ~SJ0 & M & DP1 & ~DP2 & A2) | (SJ1 & SJ0 & DP2) | (SJ0 & DP2 & ~A1) | (SJ0 & ~DP2 & ~A2) | (~SJ2 & ~SJ1 & SJ0 & ~DP2) | (~SJ3 & ~SJ2 & ~SJ0 & M & ~DP1 & DP2 & A1) | (~SJ3 & ~SJ1 & ~SJ0 & M & ~DP1 & DP2 & A1);
    assign P1A = (SJ3)  | (~SJ2 & SJ0)  | (SJ2 & ~SJ0)  | (M & ~DP1 & DP2 & A1) | (SJ1 & SJ0);
    assign P1B = (SJ2 & SJ1) | (SJ2 & ~SJ0) | (SJ3 & M & ~DP1 & DP2 & A1) | (~SJ2 & SJ0 & M & ~DP1 & DP2 & A1);
    assign P1C = (SJ2 & SJ1 & M & ~DP1 & DP2 & A1) | (SJ2 & ~SJ0 & M & ~DP1 & DP2 & A1);
    assign P2A = (SJ3) | (SJ1) | (SJ2 & SJ0) | (M & DP1 & ~DP2 & A2);
    assign P2B = (SJ3) | (SJ2 & ~SJ1 & SJ0) | (SJ2 & SJ1 & ~SJ0) | (SJ1 & M & DP1 & ~DP2 & A2);
    assign P2C = (SJ3 & M & DP1 & ~DP2 & A1) | (SJ2 & ~SJ1 & SJ0 & M & DP1 & ~DP2 & A2) | (SJ2 & SJ1 & ~SJ0 & M & DP1 & ~DP2 & A2);
    assign DONE = (SJ3 & M & DP1 & ~DP2 & A1)  | (SJ2 & SJ1 & M & ~DP1 & DP2 & A1) | (SJ2 & ~SJ0 & M & ~DP1 & DP2 & A1) | (SJ2 & ~SJ1 & SJ0 & M & DP1 & ~DP2 & A2)| (SJ2 & SJ1 & ~SJ0 & M & DP1 & ~DP2 & A2);

    FFD Ju8(CLK, RST, SJF0, SJ0);
    FFD Ju9(CLK, RST, SJF1, SJ1);
    FFD Ju10(CLK, RST, SJF2, SJ2);
    FFD Ju11(CLK, RST, SJF3, SJ3);

endmodule


module GALAGA(input wire LEFT, RIGHT, LEFT2, RIGHT2, DP1, DP2, CLK, RST, 
                output P1A, P1B, P1C, P2A, P2B, P2C, DONE);
        wire L, C, R, L2, C2, R2, M, A1, A2;

        FSMN1       J1(LEFT, RIGHT, CLK, RST, L, C, R);
        FSMN2       J2(LEFT2, RIGHT2, CLK, RST, L2, C2, R2);
        posicion    POS3(L, C, R, L2, C2, R2, M);
        Armor       AR(M, DP1, DP2,  CLK, RST, A2, A1);
        juego       GAL(M, DP1, DP2, A2, A1, CLK, RST, P1A, P1B, P1C, P2A, P2B, P2C, DONE);
endmodule    


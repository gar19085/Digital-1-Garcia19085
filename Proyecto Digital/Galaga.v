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
            output L, C, R, output wire [1:0] SP, SFP);
    wire SB1, SB0, SBF1, SBF0;

    assign L = (SB0 & LEFT)  | (SB0 & ~RIGHT) | (~SB1 & LEFT & ~RIGHT);
    assign C = (SB0 & ~LEFT & RIGHT) | (SB1 & LEFT & ~RIGHT) | (~SB1 & ~SB0 & LEFT & RIGHT) | (~SB1 & ~SB0 & ~LEFT & ~RIGHT);
    assign R = (SB1 & ~LEFT) | (SB1 & RIGHT) | (~SB0 & ~LEFT & RIGHT);
    assign SBF1 = (SB1 & ~LEFT) | (SB1 & RIGHT) | (~SB0 & ~LEFT & RIGHT);
    assign SBF0 = (SB0 & LEFT) | (SB0 & ~RIGHT) | (~SB1 & LEFT & ~RIGHT); 

    FFD JuI(CLK, RST, SBF0, SB0);
    FFD JuII(CLK, RST, SBF1, SB1);

    assign SP = {SB1, SB0};
    assign SFP = {SBF1, SBF0};

endmodule

//ECUACIONES FSM DE LA NAVE 2
module FSMN2 (input wire LEFT, RIGHT, 
            output wire L, C, R);
        wire SB1, SB0, SBF1, SBF0;    
    assign L = (SB0 & LEFT)  | (SB0 & ~RIGHT) | (~SB1 & LEFT & ~RIGHT);
    assign C = (SB0 & ~LEFT & RIGHT) | (SB1 & LEFT & ~RIGHT) | (~SB1 & ~SB0 & LEFT & RIGHT) | (~SB1 & ~SB0 & ~LEFT & ~RIGHT);
    assign R = (SB1 & ~LEFT)  | (SB1 & RIGHT) | (~SB0 & ~LEFT & RIGHT);
    assign SBF1 = (SB1 & ~LEFT)  | (SB1 & RIGHT) | (~SB0 & ~LEFT & RIGHT);
    assign SBF0 = (SB0 & LEFT)  | (SB0 & ~RIGHT) | (~SB1 & LEFT & ~RIGHT); 

    FFD Ju3(CLK, RST, SBF0, SB0);
    FFD Ju4(CLK, RST, SBF1, SB1);

endmodule

//ECUACIONES SECCIÓN DE PPOSICIÓN
module posicion(input wire LN1, CN1, RN1, LN2, CN2, RN2,
                output wire MP);
    assign MP = (~LN1 & ~CN1 & RN1 & ~LN2 & ~CN2 & RN2) | (~LN1 & CN1 & ~RN1 & ~LN2 & CN2 & ~RN2) | (LN1 & ~CN1 & ~RN1 & LN2 & ~CN2 & ~RN2);            

endmodule

//ECUACIONES FSM ARMADURA
module Armor(input wire M, DP1, DP2, 
            output wire A2, A1);
        wire SA2, SA1, SAF2, SAF1;     

    assign SAF2 = (SA2)  | (M & DP1 & ~DP2);
    assign SAF1 = (SA1) | (M & ~DP1 & DP2);
    assign A2 = (SA1) | (M & ~DP1 & DP2);
    assign A1 = (SA2)  | (M & DP1 & ~DP2);

    FFD Ju6(CLK, RST, SAF1, SA1);
    FFD Ju7(CLK, RST, SAF2, SA2);

endmodule

//ECUACIONES FSM JUEGO
module juego(input wire M, DP1, DP2, A2, A1,
            output wire P1A, P1B, P1C, P2A, P2B, P2C, DONE, output wire [2:0] P1, P2);
        wire  SJ3, SJ2, SJ1, SJ0, SJF3, SJF2, SJF1, SJF0;  

    assign SJF3 = (SJ3 & ~M)  | (SJ3 & DP1)  | (SJ3 & ~DP2)  | (SJ3 & ~A1)  | (SJ2 & M & ~DP1 & DP2 & A1) | (~SJ2 & SJ1 & SJ0 & M & DP1 & ~DP2 & A2) | (SJ2 & ~SJ1 & SJ0 & M & DP1 & ~DP2 & A2) | (SJ2 & SJ1 & ~SJ0 & M & DP1 & ~DP2 & A2);
    assign SJF2 = (SJ2 & SJ1)  | (SJ2 & ~M)  | (SJ2 & DP1 & DP2)  | (SJ2 & ~DP1 & ~DP2) | (SJ3 & M & ~DP1 & DP2 & A1) | (~SJ2 & SJ0 & M & ~DP1 & DP2 & A1) | (SJ1 & ~SJ0 & M & DP1 & ~DP2 & A2) | (SJ2 & ~SJ0 & ~DP2) | (SJ2 & DP2 & ~A1) | (SJ2 & ~DP2 & ~A2);
    assign SJF1 = (SJ1 & ~M) | (SJ3 & M & ~DP1 & DP2 & A1) | (SJ3 & M & DP1 & ~DP2 & A1) | (~SJ3 & ~SJ1 & M & DP1 & ~DP2 & A2) | (~SJ2 & SJ1 & ~DP1) | (SJ1 & ~SJ0 & ~DP1) | (SJ1 & DP1 & DP2) | (SJ1 & ~DP2 & ~A2) | (SJ2 & SJ1 & SJ0 & ~DP2) | (SJ2 & SJ1 & SJ0 & ~A1);
    assign SJF0 = (SJ0 & ~M) | (SJ0 & DP1 & DP2) | (SJ0 & ~DP1 & ~DP2) | (SJ3 & M & DP1 & ~DP2 & A1) | (~SJ2 & SJ1 & ~SJ0 & M & DP1 & ~DP2 & A2) | (SJ2 & ~SJ1 & ~SJ0 & M & DP1 & ~DP2 & A2) | (SJ1 & SJ0 & DP2) | (SJ0 & DP2 & ~A1) | (SJ0 & ~DP2 & ~A2) | (~SJ2 & ~SJ1 & SJ0 & ~DP2) | (~SJ3 & ~SJ2 & ~SJ0 & M & ~DP1 & DP2 & A1) | (~SJ3 & ~SJ1 & ~SJ0 & M & ~DP1 & DP2 & A1);
    assign P1A = (SJ3)  | (~SJ2 & SJ0)  | (SJ2 & ~SJ0)  | (M & ~DP1 & DP2 & A1) | (SJ1 & SJ0);
    assign P1B = (SJ2 & SJ1) | (SJ2 & ~SJ0) | (SJ3 & M & ~DP1 & DP2 & A1) | (~SJ2 & SJ0 & M & ~DP1 & DP2 & A1);
    assign P1C = (SJ2 & SJ1 & M & ~DP1 & DP2 & A1) | (SJ2 & ~SJ0 & M & ~DP1 & DP2 & A1);
    assign P2A = (SJ3) | (SJ1) | (SJ2 & SJ0) | (M & DP1 & ~DP2 & A2);
    assign P2B = (SJ3)  | (SJ2 & ~SJ1 & SJ0) | (SJ2 & SJ1 & ~SJ0) | (SJ1 & M & DP1 & ~DP2 & A2);
    assign P2C = (SJ3 & M & DP1 & ~DP2 & A1) | (SJ2 & ~SJ1 & SJ0 & M & DP1 & ~DP2 & A2) | (SJ2 & SJ1 & ~SJ0 & M & DP1 & ~DP2 & A2);
    assign DONE = (SJ3 & M & DP1 & ~DP2 & A1)  | (SJ2 & SJ1 & M & ~DP1 & DP2 & A1) | (SJ2 & ~SJ0 & M & ~DP1 & DP2 & A1) | (SJ2 & ~SJ1 & SJ0 & M & DP1 & ~DP2 & A2)| (SJ2 & SJ1 & ~SJ0 & M & DP1 & ~DP2 & A2);

    FFD Ju8(CLK, RST, SJF0, SJ0);
    FFD Ju9(CLK, RST, SJF1, SJ1);
    FFD Ju10(CLK, RST, SJF2, SJ2);
    FFD Ju11(CLK, RST, SJF3, SJ3);

    assign P1 = {P1A, P1B, P1C};
    assign P2 = {P2A, P2B, P2C};

endmodule



module GALAGA();
    FSMN1 ();
    FSMN2 ();
    posicion ();
    Armor ();
    juego ();
endmodule    


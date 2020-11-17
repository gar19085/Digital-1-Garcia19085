/*
Rodrigo García
Lab10
*/

//FlipFLops Para el Fetch
module FFD1 (input CLK, RST, ENABLE, D,
            output reg Q);
        always @ (posedge CLK or posedge RST)begin
            if (RST) begin
                Q <= 1'b0;
            end
            else if (ENABLE) begin
                Q <= D;
            end
        end   
endmodule


module FFD4 (input CLK, RST, ENABLE, input [3:0] D, 
            output wire [3:0]Q);
        FFD1 F4F1(CLK, RST, ENABLE,  D[3], Q[3]);
        FFD1 F4F2(CLK, RST, ENABLE, D[2], Q[2]);
        FFD1 F4F3(CLK, RST, ENABLE,  D[1], Q[1]);
        FFD1 F4F4(CLK, RST, ENABLE, D[0], Q[0]);
endmodule    

//Fetch
module FETCH(input CLK, RST, ENABLE, input [7:0] D, 
            output wire [3:0]Q1,
            output wire [3:0]Q2);
        FFD4 Ju87(CLK, RST, ENABLE,  D[7:4], Q1[3:0]);
        FFD4 Ju88(CLK, RST, ENABLE,  D[3:0], Q2[3:0]);

endmodule            


module Counter(RST, CLK, ENABLE, LOAD, E, COUNT);
input RST, CLK, ENABLE, LOAD;
input wire [11:0] E;
output [11:0] COUNT;
reg [11:0] COUNT;

always @ (posedge CLK or posedge RST)
    if (LOAD) begin
        COUNT <= E;
    end
    else if  (ENABLE) begin
        if (~LOAD);
        COUNT <= COUNT + 1;
    end 
    else if (RST) begin
        COUNT <= 0;   
    end
endmodule

module  ROM4Kx8(address, Dout);
    input   [11:0] address;
    output  [7:0] Dout;
    
    assign Dout = memory[address];
    reg [7:0]   memory[0:4095];

    initial begin
        $readmemh("memory.list", memory);
    end

endmodule    

module MAIN(input CLK, RST, ENABLE1, ENABLE2, LOAD, input [11:0] IN,
            output [3:0] Q1, Q2);
    wire [11:0]COUNTADD;
    wire [7:0]DIN;

    Counter PzI(CLK, RST, ENABLE1, LOAD, IN, COUNTADD);
    ROM4Kx8 PZII(COUNTADD, DIN);
    FETCH    PzIII(CLK, RST, ENABLE2, DIN, Q1, Q2);

endmodule
/*
Lab 10 Partes iniciales del Procesador
*/

module ACCUMULATOR (input CLK, RST, ENABLE, input [3:0] D, 
                    output wire [3:0]Q);
        FFD1 F4F1(CLK, RST, ENABLE,  D[3], Q[3]);
        FFD1 F4F2(CLK, RST, ENABLE, D[2], Q[2]);
        FFD1 F4F3(CLK, RST, ENABLE,  D[1], Q[1]);
        FFD1 F4F4(CLK, RST, ENABLE, D[0], Q[0]);
endmodule    

// C = Carry
module  ALU(A, B, SEL, C, ZERO, OUT);
    input   [3:0] A, B;
    input   [2:0] SEL;
    output  [3:0] OUT;  
    output  C, ZERO;
    reg [3:0] OUT;
    reg C, ZERO;

    reg [4:0] IR; //Registro interno

    
    always @ (A, B, SEL)
    begin
        case (SEL)
            3'b000: 
                begin
                   IR = 5'b00000;
                   IR = A;
                   C = 1'b0;
                   ZERO = 1'b0;
                   OUT = IR[3:0];
                end
            3'b010:
                begin
                    IR = 5'b00000;
                    IR = B;
                    C = 1'b0;
                    ZERO = 1'b0;
                    OUT = IR[3:0];
                end
            3'b100:
                begin
                    IR = 5'b00000;
                    IR = ~(A & B);
                    C = 1'b0;
                    ZERO = 1'b0;
                    OUT = IR[3:0];
                end    
            3'b001:
                begin
                    IR = 5'b00000;
                    IR = A - B;
                    OUT = IR[3:0];
                    C = IR[4];
                    ZERO = (IR == 5'b00000);
                end    
            3'b011:
                begin
                    IR = 5'b00000;
                    IR = A + B;
                    OUT = IR[3:0];
                    C = IR[4];
                    ZERO = (IR == 5'b00000);
                end    
        endcase        
    end    
endmodule    


module BUS(input [3:0] DPS, input AC, output reg [3:0] OUT);
 
    always @ (*)
    begin
        case (AC)
            1'b0:   OUT = 4'bzzzz;
            1'b1:   OUT = DPS;
            default: OUT = 4'bzzzz;
        endcase
    end    

endmodule    


module MAIN(CLK, RST, ENABLE, IN, AC1, AC2, SEL, C, ZERO, OUT);
    input CLK, RST, ENABLE;
    input [3:0]IN;
    input AC1, AC2;
    output C, ZERO;
    input [2:0] SEL;
    output [3:0]OUT;
    wire [3:0] BO, ALO, ACO;

    BUS B1(IN, AC1, BO);
    ACCUMULATOR B2(CLK, RST, ENABLE, ALO, ACO);
    ALU B3(BO, ACO, SEL, C, ZERO, ALO);
    BUS B4(ALO, AC2, OUT);

endmodule
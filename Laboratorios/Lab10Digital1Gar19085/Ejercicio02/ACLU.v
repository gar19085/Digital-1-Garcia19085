

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


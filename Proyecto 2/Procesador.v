/*
Rodrigo García
Proyecto 2 Procesador uP
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


module Counter(RST, CLK, ENABLE, LOAD, E, PC);
    input RST, CLK, ENABLE, LOAD;
    input wire [11:0] E;
    output [11:0] PC;
    reg [11:0] PC;

    always @ (posedge CLK or posedge RST)
        if (LOAD) begin
            PC <= E;
        end
    else if  (ENABLE) begin
        if (~LOAD);
        PC <= PC + 1;
        end 
    else if (RST) begin
        PC <= 0;   
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

//Fetch
module FETCH(input CLK, RST, ENABLE, input [7:0] D, 
            output wire [3:0]Q1,
            output wire [3:0]Q2);
        FFD4 Ju87(CLK, RST, ENABLE,  D[7:4], Q1[3:0]);
        FFD4 Ju88(CLK, RST, ENABLE,  D[3:0], Q2[3:0]);

endmodule   

/*
Partes iniciales del Procesador
*/

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


module  RAM4Kx4(address, data, cs, we);

    input [11:0] address;
    input [3:0] data;
    input cs, we;

    reg [3:0] data_out;
    reg [3:0] mem [0:4095];

    assign data = (cs && ! we) ? data_out : 8'bz;

    always @ (address or data or cs or we)
    begin : MEM_WRITE
        if (cs && we) begin
            mem[address] = data;
        end
    end

    always @ (address or cs or we)
    begin : MEM_READ
        if (cs && ! we) begin
            data_out = mem[address];
        end    
    end    

endmodule


module  DECODE(IN, OUT);
    input   [6:0] IN;
    output reg [12:0] OUT;
    
    always @ (*)
    begin
        case (IN)
        7'bxxxxxx0:     OUT = 13'b1000000001000;
        7'b00001x1:     OUT = 13'b0100000001000;
        7'b00000x1:     OUT = 13'b1000000001000;
        7'b00011x1:     OUT = 13'b1000000001000;
        7'b00010x1:     OUT = 13'b0100000001000;
        7'b0010xx1:     OUT = 13'b0001001000010;
        7'b0011xx1:     OUT = 13'b1001001100000;
        7'b0100xx1:     OUT = 13'b0011010000010;
        7'b0101xx1:     OUT = 13'b0011010000100;
        7'b0110xx1:     OUT = 13'b1011010100000;
        7'b0111xx1:     OUT = 13'b1000000111000;
        7'b1000x11:     OUT = 13'b0100000001000;
        7'b1000x01:     OUT = 13'b1000000001000;
        7'b1001x11:     OUT = 13'b1000000001000;
        7'b1001x01:     OUT = 13'b0100000001000;
        7'b1010xx1:     OUT = 13'b0011011000010;
        7'b1011xx1:     OUT = 13'b1011011100000;
        7'b1100xx1:     OUT = 13'b0100000001000;
        7'b1101xx1:     OUT = 13'b0000000001001;
        7'b1110xx1:     OUT = 13'b0011100000010;
        7'b1111xx1:     OUT = 13'b1011100100000;
            default:    OUT = 13'b1000000001000;
        endcase
    end
endmodule    


module pushbuttons(pb[3:0]);
    input pb;

endmodule    



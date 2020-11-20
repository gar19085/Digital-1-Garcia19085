/*
Rodrigo García
Proyecto 2 Procesador uP
*/

//FlipFLops Para el Fetch
module FFD1 (input clock, RST, ENABLE, D,
            output reg Q);
        always @ (posedge clock or posedge RST)begin
            if (RST) begin
                Q <= 1'b0;
            end
            else if (ENABLE) begin
                Q <= D;
            end
        end   
endmodule


module FFD4 (input clock, RST, ENABLE, input [3:0] D, 
            output wire [3:0]Q);
        FFD1 F4F1(clock, RST, ENABLE,  D[3], Q[3]);
        FFD1 F4F2(clock, RST, ENABLE, D[2], Q[2]);
        FFD1 F4F3(clock, RST, ENABLE,  D[1], Q[1]);
        FFD1 F4F4(clock, RST, ENABLE, D[0], Q[0]);
endmodule             


module PHASE(input wire clock, RST, ENABLE,
            output wire Y);
        wire D;    
        not (D, Y);
        FFD1 Ju88(clock, RST, ENABLE, D, Y);
endmodule

module FLAGS(input clock, RST, ENABLE, input [1:0] D, 
            output wire [1:0]Q);
    FFD1 FD1(clock, RST, ENABLE,  D[0], Q[0]);
    FFD1 FD2(clock, RST, ENABLE,  D[1], Q[1]);
endmodule

module Counter(RST, clock, ENABLE, LOAD, E, PC);
    input RST, clock, ENABLE, LOAD;
    input wire [11:0] E;
    output [11:0] PC;
    reg [11:0] PC;

    always @ (posedge clock or posedge RST)
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
module FETCH(input clock, RST, ENABLE, input [7:0] D, 
            output wire [3:0]Q1,
            output wire [3:0]Q2);
        FFD4 Ju87(clock, RST, ENABLE,  D[7:4], Q1[3:0]);
        FFD4 Ju88(clock, RST, ENABLE,  D[3:0], Q2[3:0]);

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

module ACCUMULATOR (input clock, RST, ENABLE, input [3:0] D, 
                    output wire [3:0]Q);
        FFD1 F4F1(clock, RST, ENABLE,  D[3], Q[3]);
        FFD1 F4F2(clock, RST, ENABLE, D[2], Q[2]);
        FFD1 F4F3(clock, RST, ENABLE,  D[1], Q[1]);
        FFD1 F4F4(clock, RST, ENABLE, D[0], Q[0]);
endmodule    

// C = Carry
module  ALU(A, B, SEL, C, ZERO, OUT);
    input   [3:0] A, B;
    input   [2:0] SEL;
    output  [3:0] OUT;  
    output  C, ZERO;

    reg [4:0] IR; //Registro interno
    
    always @ (A, B, SEL)
        case (SEL)
            3'b000: IR = A;
            3'b001: IR = A - B;
            3'b010: IR = B;
            3'b011: IR = A + B;
            3'b100: IR = {1'b0, ~(A & B)};
            default: IR = 5'b10101;
        endcase
    
    assign OUT = IR[3:0];
    assign C = IR[4];
    assign ZERO = ~(IR[3] | IR[2] | IR[1] | IR[0]);
    
endmodule    


module  RAM4Kx4(address, cs, we, data);

    input [11:0] address;
    input cs, we;
    inout [3:0] data;

    //cs = Chip Select
    //we = Write Enable

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
    output  [12:0] OUT;
    
    reg [12:0] signalsReg;
    
    always @ (IN)
        casez(IN)
            // any
            7'b????_??0: signalsReg <= 13'b1000_000_001000;
            // JC
            7'b0000_1?1: signalsReg <= 13'b0100_000_001000;
            7'b0000_0?1: signalsReg <= 13'b1000_000_001000;
            // JNC
            7'b0001_1?1: signalsReg <= 13'b1000_000_001000;
            7'b0001_0?1: signalsReg <= 13'b0100_000_001000;
            // CMPI
            7'b0010_??1: signalsReg <= 13'b0001_001_000010;
            // CMPM
            7'b0011_??1: signalsReg <= 13'b1001_001_100000;
            // LIT
            7'b0100_??1: signalsReg <= 13'b0011_010_000010;
            // IN
            7'b0101_??1: signalsReg <= 13'b0011_010_000100;
            // LD
            7'b0110_??1: signalsReg <= 13'b1011_010_100000;
            // ST
            7'b0111_??1: signalsReg <= 13'b1000_000_111000;
            // JZ
            7'b1000_?11: signalsReg <= 13'b0100_000_001000;
            7'b1000_?01: signalsReg <= 13'b1000_000_001000;
            // JNZ
            7'b1001_?11: signalsReg <= 13'b1000_000_001000;
            7'b1001_?01: signalsReg <= 13'b0100_000_001000;
            // ADDI
            7'b1010_??1: signalsReg <= 13'b0011_011_000010;
            // ADDM
            7'b1011_??1: signalsReg <= 13'b1011_011_100000;
            // JMP
            7'b1100_??1: signalsReg <= 13'b0100_000_001000;
            // OUT
            7'b1101_??1: signalsReg <= 13'b0000_000_001001;
            // NANDI
            7'b1110_??1: signalsReg <= 13'b0011_100_000010;
            // NANDM
            7'b1111_??1: signalsReg <= 13'b1011_100_100000;
            default: signalsReg <= 13'b1111111111111;
        endcase
        
    assign OUT = signalsReg;
endmodule    


module  uP(clock, reset, pushbuttons, phase,
            c_flag, z_flag, instr, oprnd, data_bus, FF_out, 
            accu, program_byte, address_RAM, PC);
    input wire clock, reset;
    input wire [3:0] pushbuttons;
    output wire c_flag, z_flag, phase;
    output wire [11:0] PC, address_RAM;
    output wire [3:0] instr, oprnd, data_bus, FF_out, accu; 
    output wire [7:0] program_byte;

    wire [12:0] Decodx;
    wire [6:0] Decoder;
    wire [3:0] ALU_O;
    wire ZERO;
    wire C;
    assign address_RAM = {oprnd, program_byte};
    assign Decoder = {instr, c_flag, z_flag, phase};

    
    Counter PzCounter   (reset, clock, Decodx[12], Decodx[11], address_RAM, PC);
    ROM4Kx8 PzRom       (PC, program_byte);
    FETCH   PzFetch     (clock, reset, ~phase, program_byte, instr, oprnd);
    BUS     PzBus1      (oprnd, Decodx[1], data_bus);
    PHASE   PzPhase     (clock, reset, 1'b1, phase);
    FLAGS   PzFlag      (clock, reset, Decodx[9], {C, ZERO}, {c_flag, z_flag});
    DECODE  PzDecode    (Decoder, Decodx);
    ACCUMULATOR PzAccu  (clock, reset, Decodx[10], ALU_O, accu);
    ALU     PzAlu       (accu, data_bus, Decodx[8:6], C, ZERO, ALU_O);
    BUS     PzBus2      (ALU_O, Decodx[3] ,data_bus);
    RAM4Kx4 PzRam       (address_RAM, Decodx[5], Decodx[4], data_bus);
    BUS     PzBusIn     (pushbuttons, Decodx[2] ,data_bus);
    FFD4    FFoutput    (clock, reset, Decodx[0], data_bus, FF_out);

    
endmodule

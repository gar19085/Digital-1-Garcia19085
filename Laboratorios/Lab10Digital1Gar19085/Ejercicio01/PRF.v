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
module FFD8(input CLK, RST, ENABLE, input [7:0] D, 
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
    FFD8    PzIII(CLK, RST, ENABLE2, DIN, Q1, Q2);

endmodule

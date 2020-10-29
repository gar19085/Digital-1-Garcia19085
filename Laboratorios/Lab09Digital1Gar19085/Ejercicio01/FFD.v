//Lab09
//Flip-Flop Tipo D de 1 bit


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


module FFD2 (input CLK, RST, ENABLE, input [1:0] D, 
            output wire [1:0]Q); 
        FFD1 F4F(CLK, RST, ENABLE,  D[1], Q[1]);
        FFD1 F4F2(CLK, RST, ENABLE, D[0], Q[0]);

endmodule    


module FFD4 (input CLK, RST, ENABLE, input [3:0] D, 
            output wire [3:0]Q);
        FFD2 F4F3(CLK, RST, ENABLE,  D[3:2], Q[3:2]);
        FFD2 F4F4(CLK, RST, ENABLE, D[1:0], Q[1:0]);

endmodule    
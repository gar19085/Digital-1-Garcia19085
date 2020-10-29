//Lab09
//Flip-Flop Tipo D de 1 bit


module FFD1 (input CLK, RST, D,
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


module FFD2 (input CLK, RST, input [1:0] D, 
            output reg [1:0]Q); 
        FFD1 F4F(CLK, RST, D, Q);
        FFD1 F4F2(CLK, RST, D, Q);

endmodule    


module FFD4 (input CLK, RST, input [3:0] D, 
            output reg [3:0]Q);
        FFD2 F4F3(CLK, RST, D, Q);
        FFD2 F4F4(CLK, RST, D, Q);

endmodule    
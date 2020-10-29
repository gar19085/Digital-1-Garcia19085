
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


module FFJK(input CLK, RST, ENABLE, J, K,
            output wire Q);

        
        FFD1 BF(CLK, RST, ENABLE, D, Q);

endmodule


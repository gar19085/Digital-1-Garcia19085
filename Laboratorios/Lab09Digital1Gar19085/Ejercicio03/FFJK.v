
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
        wire A1, A2, NK, NS0, S0, SF0;
        
        not(NK, K);
        not(NS0, S0);
        and(A1, NS0, J);
        and(A2, S0, NK);
        or(SF0, A1, A2);
   
        assign Q = SF0;  
        
        FFD1 BF(CLK, RST, ENABLE, SF0, S0);

endmodule


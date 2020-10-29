


module FFJK(input CLK, RST, ENABLE, J, K,
            output reg Q);
        always @ (posedge CLK or posedge RST)begin
            if (RST) begin
                Q <= 1'b0;
            end
            else if (ENABLE) begin
                Q <= J;
                Q <= K;
            end
        end
endmodule


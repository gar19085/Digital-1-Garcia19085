


module FFJK(input CLK, RST, ENABLE, J, K,
            output reg Q);
        always @ (posedge CLK or posedge RST)begin
            if (RST) begin
                Q <= 1'b0;
            else  if (T)
                Q <= ~Q;
                else
                Q <= Q;
            end
            else if (ENABLE) begin
                Q <= D;
            end
        end
endmodule


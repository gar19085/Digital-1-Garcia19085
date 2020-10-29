


module FFT(input CLK, RST, ENABLE, T,
            output reg Y);
        always @ (posedge CLK or posedge RST)begin
            if (RST) begin
                Y <= 1'b0;
            else  if (T)
                Y <= ~Y;
                else
                Y <= Y;
            end
            else if (ENABLE) begin
                Y <= D;
            end
        end
endmodule


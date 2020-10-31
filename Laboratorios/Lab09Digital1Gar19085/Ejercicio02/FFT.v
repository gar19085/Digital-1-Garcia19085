//UNIVERSIDAD DEL VALLE 
//LAB09
//Rodrigo GArcía19085


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


module FFT(input wire CLK, RST, ENABLE,
            output wire Y);
        wire D;    
        not (D, Y);
        FFD1 Ju88(CLK, RST, ENABLE, D, Y);
endmodule


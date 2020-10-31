

module Buffer(input [3:0] DPS, input AC, output reg [3:0] OUT);
 

    always @ (*)
    begin
        case (AC)
            1'b0:   OUT = z;
            1'b1:   OUT = DPS;
            default: OUT = z;
        endcase
    end    

endmodule    
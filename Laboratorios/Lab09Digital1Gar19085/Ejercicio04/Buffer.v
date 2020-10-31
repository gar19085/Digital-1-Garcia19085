//UNIVERSIDAD DEL VALLE 
//LAB09
//Rodrigo GArcía19085

module Buffer(input [3:0] DPS, input AC, output reg [3:0] OUT);
 

    always @ (*)
    begin
        case (AC)
            1'b0:   OUT = 4'bzzzz;
            1'b1:   OUT = DPS;
            default: OUT = 4'bzzzz;
        endcase
    end    

endmodule    
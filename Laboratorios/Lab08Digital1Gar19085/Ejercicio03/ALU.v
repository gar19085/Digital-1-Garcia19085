//Universidad del Valle de Guatemala
//Lab08
//ALU de 4 bits
//Gar19085

module  ALU(A, B, SEL, OUT);
    input   [3:0] A, B;
    input   [3:0] SEL;
    output  [3:0] OUT;  
    reg [3:0] OUT;

    always @ (*)
    begin
        case (SEL)
            4'b0000:    OUT = A & B;   
            4'b0001:    OUT = A | B;
            4'b0010:    OUT = A + B;
            4'b0011:    OUT = A & ~B;
            4'b0100:    OUT = A | ~B;
            4'b0101:    OUT = A - B;
            default:    OUT = A & B;
        endcase
    end    
endmodule    







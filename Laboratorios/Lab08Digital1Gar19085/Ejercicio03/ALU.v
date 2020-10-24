//Universidad del Valle de Guatemala
//Lab08
//ALU de 4 bits
//Gar19085

module  ALU(A, B, SEL, OUT);
    input   [3:0] A, B;
    input   [2:0] SEL;
    output  [3:0] OUT;  
    reg [3:0] OUT;

    always @ (*)
    begin
        case (SEL)
            3'b000:    OUT = A & B;   
            3'b001:    OUT = A | B;
            3'b010:    OUT = A + B;
            3'b011:    OUT = A & ~B;
            3'b100:    OUT = A | ~B;
            3'b101:    OUT = A - B;
            3'b110:    OUT = (A < B) ? 1:0;
            default:    OUT = A & B;
        endcase
    end    
endmodule    




//UNIVERSIDAD DEL VALLE DE GUATEMALA
//CONTADOR 
//LAB08
//RODRIGO GARCÍA 19085

module Counter(RST, CLK, ENABLE, COUNT, LOAD, E);
input RST, CLK, ENABLE;
input wire [11:0] E;
output [11:0] COUNT;
reg [11:0] COUNT;

always @ (posedge CLK or posedge RST)
    if  (ENABLE) begin
        COUNT <= COUNT + 1;
    end 
    else if (LOAD) begin
        COUNT <= E;
    end
    else if (RST) begin
         COUNT <= 0;   
    end
endmodule
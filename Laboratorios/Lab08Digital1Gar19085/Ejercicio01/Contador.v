//UNIVERSIDAD DEL VALLE DE GUATEMALA
//CONTADOR 
//LAB08
//RODRIGO GARCÍA 19085

module Counter(RST, CLK, ENABLE, LOAD, E, COUNT);
input RST, CLK, ENABLE, LOAD;
input wire [11:0] E;
output [11:0] COUNT;
reg [11:0] COUNT;

always @ (posedge CLK or posedge RST)
    if (LOAD) begin
        COUNT <= E;
    end
    else if  (ENABLE) begin
        if (~LOAD);
        COUNT <= COUNT + 1;
    end 
    else if (RST) begin
        COUNT <= 0;   
    end
endmodule

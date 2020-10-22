//UNIVERSIDAD DEL VALLE DE GUATEMALA
//CONTADOR 
//LAB08
//RODRIGO GARCÍA 19085

module Counter(RST, CLK, ENABLE, COUNT);
input RST, CLK, ENABLE;
output [11:0] COUNT;
reg [11:0] COUNT;

always @ (posedge CLK or posedge RST)
    if  (RST) begin
        COUNT <= 0;
    end 
    else begin : COUNT
        while (ENABLE) begin
            COUNT <= COUNT + 1;
            disable COUNT;
        end    
    end
endmodule
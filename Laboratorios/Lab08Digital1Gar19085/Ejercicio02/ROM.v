//UNIVERSIDAD DEL VALLE 
//LAB08


module  ROM4Kx8(address, Dout);
    input   [7:0] address;
    output  [7:0] Dout;
    
    assign Dout = memory[address];
    reg [7:0]   memory[0:4095];

    initial begin
        $readmemh("memory.list", memory);
    end

endmodule    
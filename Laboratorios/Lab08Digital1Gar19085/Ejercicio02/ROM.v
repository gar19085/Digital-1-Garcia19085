//UNIVERSIDAD DEL VALLE 
//LAB08


module  ROM4Kx8(input   [:]address
                output  [7:0]data_out);

    assign data_out = my_memory(address);
    reg [7:0]   my_memory[0:4095];

    initial begin
        $redmemh("memory.list", ,y_memory);
    end
endmodule    
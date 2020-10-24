

module testbench();

reg [7:0]address;
wire [7:0] data_out;


ROM4Kx8 Ju87(address, data_out);

initial begin
        $display("\n");
        $display("Ejercicio 2");
        $display("address  |  data_out");
        $monitor("%b   |   %b", address, data_out);
        address = 0;
        #1 address = 0;
        #1 address = 1;
        #1 address = 2;
        #1 address = 3;
        #1 address = 4;
        #1 address = 5;
        #1 address = 6;
        #1 address = 7;
end

//   initial 
//        #20 $finish;

//        initial begin
//            $dumpfile("ROM_tb.vcd");
//            $dumpvars(0, testbench);
//        end


endmodule
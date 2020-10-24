

module testbench();

reg [11:0]address;
wire [7:0] Dout;


ROM4Kx8 Ju87(address, Dout);

initial begin
        $display("\n");
        $display("Ejercicio 2");
        $display("address  | address | Dout |  Dout");
        $monitor("%h |  %b  |   %h   |  %b", address, address, Dout, Dout);
        address = 0;
        #1 address = 0;
        #1 address = 1;
        #1 address = 2;
        #1 address = 3;
        #1 address = 4;
        #1 address = 5;
        #1 address = 6;
        #1 address = 7;
        #1 address = 8;
        #1 address = 9;
        #1 address = 10;
        #1 address = 11;
        #1 address = 4094;
end

//   initial 
//        #20 $finish;

//        initial begin
//            $dumpfile("ROM_tb.vcd");
//            $dumpvars(0, testbench);
//        end


endmodule
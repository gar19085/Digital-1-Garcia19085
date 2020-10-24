

module testbench();

reg [7:0]address;
wire [7:0]data_out;


ROM4Kx8 Ju87(address, data_out);

initial begin
        $display("\n");
        $display("Ejercicio 2");
        $display("address  |  data_out");
        $monitor("%b", address, data_out);
        address = 0;
        #1 address = 0;
        #10 addres = 1;
end

    initial 
        #20 $finish;

        initial begin
            $dumpfile("ROM_tb.vcd");
            $dumpvars(0, testbench);
        end


endmodule
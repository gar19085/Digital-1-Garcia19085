//testbench

module testbench();

reg ;
wire ;

        always 
            begin 
                CLK <= 0; reset <= 0; #1 CLK <= 1; #1;
            end

Counter Ju88();

    initial begin
       #8
        $display("\n");
        $display("Ejercicio 1");
        $display("RST");
        $monitor("%b", RST,);
    end

    always 
        #5 CLK = ~CLK;

    initial 
        #27 $finish;

        initial begin
            $dumpfile("Ejer6_tb.vcd");
            $dumpvars(0, testbench);
        end

endmodule
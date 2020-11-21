module testbench();

    reg clock, reset;
    reg [3:0] pushbuttons;
    wire c_flag, z_flag, phase;
    wire [11:0] PC, address_RAM;
    wire [3:0] instr, oprnd, data_bus, FF_out, accu;
    wire [7:0] program_byte;

    uP uPmodule(clock, reset, pushbuttons, phase,
            c_flag, z_flag, instr, oprnd, data_bus, FF_out, 
            accu, program_byte, address_RAM, PC);

    initial
        #1000 $finish;

    always
        #5 clock = ~clock;

    initial begin
        $display("\n");
        $display("MicroProcesador García 19085");
        $display("clock, reset, pushbuttons, phase, c_flag, z_flag, instr, oprnd, data_bus, FF_out, accu, program_byte, address_RAM, PC");
        $monitor("  %h |  %h  |  %h  |  %h  |  %h  |  %h  |  %h  |  %h  |  %h  |  %h  |  %h  |  %h  |  %h  |  %h  |", 
                clock, reset, pushbuttons, phase, c_flag, z_flag, instr, oprnd, data_bus, FF_out, accu, program_byte, address_RAM, PC);
        clock = 0; pushbuttons = 4'b0110; 
        #2 reset = 1;
        #1 reset = 0;
        #100 pushbuttons = 4'b1001;
        #100 pushbuttons = 4'b1010;
        #100 pushbuttons = 4'b0000;
    end

    initial begin
        $dumpfile("uP_tb.vcd");
        $dumpvars(0, testbench);
    end
endmodule
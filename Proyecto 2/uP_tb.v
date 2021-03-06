module testbench();

    reg clock, reset;
    reg [3:0] pushbuttons;
    wire c_flag, z_flag, phase;
    wire [11:0] PC, address_RAM;
    wire [3:0] instr, oprnd, data_bus, FF_out, accu;
    wire [7:0] program_byte;

    uP uPmodule(.clock(clock),
                .reset(reset),
                .pushbuttons(pushbuttons),
                .phase(phase),
                .c_flag(c_flag),
                .z_flag(z_flag),
                .instr(instr),
                .oprnd(oprnd),
                .accu(accu),
                .data_bus(data_bus),
                .FF_out(FF_out),
                .program_byte(program_byte),
                .PC(PC),
                .address_RAM(address_RAM));

    initial
        #500 $finish;

    always
        #5 clock = ~clock;

    initial begin
        $display("\n");
        $display("MicroProcesador García 19085");
        $display("clock| reset| pushbuttons| phase|  c_flag | z_flag | instr| oprnd| data_bus| FF_out| accu | program_byte| address_RAM |  PC  |");
        $monitor("  %b |  %b  |     %b     |  %b  |    %b   |  %b    |  %b  |  %b  |    %b   |  %b   |  %b  |      %b     |     %b      |  %b  |", 
                clock, reset, pushbuttons, phase, c_flag, z_flag, instr, oprnd, data_bus, FF_out, accu, program_byte, address_RAM, PC);
        clock = 0; pushbuttons = 4'b0101; 
        #2 reset = 1;
        #1 reset = 0;
    end

    initial begin
        $dumpfile("uP_tb.vcd");
        $dumpvars(0, testbench);
    end
endmodule
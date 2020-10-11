

module testbench();
    //ENTRADAS Y SALIDAS FSM NAVE 1
    reg CLK, RST; 
    reg LEFT, RIGHT;
    wire L, C, R;  
    wire [1:0] SP, SFP; 

        always 
            begin 
                CLK <= 0; RST <= 0; #1 CLK <= 1; #1;
            end

FSMN1 J1(LEFT, RIGHT, CLK, RST, L, C, R, SP, SFP);

  initial begin
        $display("\n");
        $display("NAVE 1");
        $display("RST | SP SFP | LEFT RIGHT | L C R");
        $monitor("%b | %b %b | %b %b | %b %b %b", RST, SP, SFP, LEFT, RIGHT, L, C, R);
        LEFT = 0; RIGHT = 0; CLK = 0; RST = 0;
        #1  LEFT = 0; RIGHT = 1; RST = 1;
        #1  LEFT = 1; RIGHT = 0; RST = 0;   
        #1  LEFT = 1; RIGHT = 1;
        #1  LEFT = 0; RIGHT = 0;
        #1  LEFT = 0; RIGHT = 1;
        #1  LEFT = 1; RIGHT = 0;
        #1  LEFT = 1; RIGHT = 1;
        #1  LEFT = 0; RIGHT = 0;
        #1  LEFT = 0; RIGHT = 1;
        #1  LEFT = 1; RIGHT = 0;
        #1  LEFT = 1; RIGHT = 1;
        #1  LEFT = 0; RIGHT = 0;
        #1  LEFT = 0; RIGHT = 1;
        #1  LEFT = 0; RIGHT = 1;
        #1  LEFT = 0; RIGHT = 1;
  end

    always 
        #1 CLK = ~CLK;

    initial 
        #16 $finish;

        initial begin
            $dumpfile("Galaga_tb.vcd");
            $dumpvars(0, testbench);
        end
endmodule
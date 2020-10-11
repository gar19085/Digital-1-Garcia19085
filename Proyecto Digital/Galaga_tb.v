

module testbench();
    //ENTRADAS Y SALIDAS FSM NAVE 1
    reg CLK, RST; 
    reg LEFT, RIGHT;
    reg LEFT2, RIGHT2;
    wire L, C, R; 
    wire L2, C2, R2;
    wire MP;  
    wire [1:0] SP, SFP; 
    wire Lr, Cr, Rr, Lr2, Cr2, Rr2;

        always 
            begin 
                CLK <= 0; RST <= 0; #1 CLK <= 1; #1;
            end

FSMN1 J1(LEFT, RIGHT, CLK, RST, L, C, R, SP, SFP);
FSMN2 J2(LEFT2, RIGHT2, CLK, RST, L2, C2, R2);
posicion C1(Lr, Cr, Rr, L2r, Cr2, Rr2, MP);

  initial begin
        $display("\n");
        $display("inicio");
    end
  
  initial begin
        $display("\n");
        $display("posicion");
        $display("RST | SP SFP | LEFT RIGHT | LEFT2 RIGHT2 | L C R | L2 C2 R2 | MP");
        $monitor("%b | %b %b |%b %b | %b %b | %b %b %b | %b %b %b | %b", RST, SP, SFP, LEFT, RIGHT, LEFT2, RIGHT2, L, C, R, L2, C2, R2, MP);
        CLK = 0; RST = 0; LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 0;
        #1 RST = 1; LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 0;
        #1 RST = 0; LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 0;
        #5
        LEFT = 0; 
        RIGHT = 1; 
        LEFT2 = 1; 
        RIGHT2 = 0;
        #5
        LEFT = 0; 
        RIGHT = 1; 
        LEFT2 = 0; 
        RIGHT2 = 0;
        #5
        LEFT = 0; 
        RIGHT = 0; 
        LEFT2 = 0; 
        RIGHT2 = 1;
        #5
        LEFT = 0; 
        RIGHT = 1; 
        LEFT2 = 1; 
        RIGHT2 = 1;
  end

    always 
        #5 CLK = ~CLK;

    initial 
        #200 $finish;

        initial begin
            $dumpfile("Galaga_tb.vcd");
            $dumpvars(0, testbench);
        end
endmodule
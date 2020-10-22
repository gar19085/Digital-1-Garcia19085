

module testbench();
    //ENTRADAS Y SALIDAS FSM NAVE 1
    reg CLK, RST; 
    reg LEFT, RIGHT;
    reg LEFT2, RIGHT2;
    reg DP1, DP2;
    wire L, C, R; 
    wire L2, C2, R2;
    wire MP;  
    wire P1A, P1B, P1C, P2A, P2B, P2C, DONE;

        always 
            begin 
                CLK <= 0; RST <= 0; #1 CLK <= 1; #1;
            end

        GALAGA retro(LEFT, RIGHT, LEFT2, RIGHT2, DP1, DP2, CLK, RST, P1A, P1B, P1C, P2A, P2B, P2C, DONE);


  initial begin
        $display("\n");
        $display("inicio");
    end
  
  initial begin
        $display("\n");
        $display("posicion");
        $display("CLK |RST | LEFT RIGHT | LEFT2 RIGHT2  DP1 DP2 | P1A P1B P1C | P2A P2B P2C | DONE");
        $monitor("%b  | %b   |  %b     %b  |  %b   %b  |  %b  %b  |  %b  %b  %b  |  %b  %b  %b  | %b", 
        CLK, RST, LEFT, RIGHT, LEFT2, RIGHT2, DP1, DP2, P1A, P1B, P1C, P2A, P2B, P2C, DONE);
        CLK = 0; RST = 0; LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 0;  DP1 = 0; DP2 = 0;
        #1 RST = 1; LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 0;  DP1 = 0; DP2 = 0;
        #1 RST = 0; LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 0;  DP1 = 0; DP2 = 0;
        #1 LEFT = 1; RIGHT = 0; LEFT2 = 0; RIGHT2 = 1; DP1 = 0; DP2 = 0;
        #1 LEFT = 0; RIGHT = 0; LEFT2 = 1; RIGHT2 = 0; DP1 = 0; DP2 = 1;
        #1 LEFT = 0; RIGHT = 1; LEFT2 = 0; RIGHT2 = 0; DP1 = 1; DP2 = 0;
        #1 LEFT = 0; RIGHT = 0; LEFT2 = 1; RIGHT2 = 0; DP1 = 1; DP2 = 0;
        #1 LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 0; DP1 = 0; DP2 = 1;
        #1 LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 1; DP1 = 0; DP2 = 0; 
        #1 LEFT = 0; RIGHT = 1; LEFT2 = 0; RIGHT2 = 0; DP1 = 0; DP2 = 1;   
        #1 LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 0; DP1 = 0; DP2 = 1;
        #1 LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 0; DP1 = 1; DP2 = 0;
        #1 LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 0; DP1 = 0; DP2 = 0;
        #1 LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 0; DP1 = 1; DP2 = 0;
        #1 LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 0; DP1 = 1; DP2 = 0;
        #1 LEFT = 0; RIGHT = 0; LEFT2 = 0; RIGHT2 = 0; DP1 = 1; DP2 = 0;
        
  end

    always 
        #1 CLK = ~CLK;

    initial 
        #18 $finish;

        initial begin
            $dumpfile("Galaga_tb.vcd");
            $dumpvars(0, testbench);
        end
endmodule
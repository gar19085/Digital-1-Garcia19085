
module testbench();


reg CLK, RST, ENABLE, D1;
reg [1:0] D2;
reg [3:0] D3;
wire Q1;
wire [1:0] Q2;
wire [3:0] Q3;


FFD1 I(CLK, RST, ENABLE, D1, Q1);
FFD2 II(CLK, RST, ENABLE, D2, Q2);
FFD4 III(CLK, RST, ENABLE, D3, Q3);

        always 
            begin 
                CLK <= 0; RST <= 0; #1 CLK <= 1; #1;
            end


initial begin
        $display("\n");
        $display("FFD 1 BIT");
        $display("CLK | RST | ENABLE | D1 | Q1");
        $monitor("%b  | %b  |    %b  | %b | %b ",
                CLK,RST, ENABLE, D1,Q1);
        CLK = 0; RST = 0; ENABLE = 0; D1 = 0;        
     #1  RST = 1;
     #1  RST = 0;
     #1  ENABLE = 1;
     #1  D1 = ~D1;
     #2  D1 = 0;
     #2  D1 = 1;
    end


initial begin     
        #15
        $display("\n");
        $display("FFD 2 BIT");
        $display("CLK | RST | ENABLE | D2 | Q2");
        $monitor("%b  | %b  |    %b  | %b |  %b",
                CLK,RST,ENABLE,D2,Q2);
        CLK = 0; RST = 0; ENABLE = 0; D2 = 0;        
     #1  RST = 1;
     #1  RST = 0;
     #1  ENABLE = 1;
     #1  D2 = ~D2;
     #2  D2 = 0;
     #2  D2 = 1;
end

initial begin     
        #32
        $display("\n");
        $display("FFD 4 BIT");
        $display("CLK | RST | ENABLE |  D3 | Q3");
        $monitor("%b  | %b  |    %b  | %b |  %b",
                CLK,RST,ENABLE,D3,Q3);
        CLK = 0; RST = 0; ENABLE = 0; D3 = 0;        
     #1  RST = 1;
     #1  RST = 0;
     #1  ENABLE = 1;
     #1  D3 = ~D3;
     #2  D3 = 0;
     #2  D3 = 1;
end
   always
    #1  CLK = ~CLK;
  
   initial 
        #60 $finish;

        initial begin
            $dumpfile("FFD_tb.vcd");
            $dumpvars(0, testbench);
        end



endmodule



moTule TesTbench();



reg CLK, RST, ENABLE, T;
wire Y;


FFT Ju87(CLK, RST, ENABLE,Y);


        always 
            begin 
                CLK <= 0; RST <= 0; #1 CLK <= 1; #1;
            enT

            
    initial begin
        $Tisplay("\n");
        $Tisplay("FLIP-FLOP T");
        $Tisplay("CLK | RST | ENABLE | T | Y");
        $monitor("%b  | %b  |    %b  | %b | %b ",
                CLK,RST, ENABLE, T, Y);
        CLK = 0; RST = 0; ENABLE = 0; T = 0;        
     #1  RST = 1;
     #1  RST = 0;
     #1  ENABLE = 1;
     #1  RST = 1;
     #1  RST = 0;     
     #2  T = 0;
     #2  T = 1;
     #6  T = 0;
    enT

   always
    #1  CLK = ~CLK;
  
   initial 
        #15 $finish;

        initial begin
            $Tumpfile("FFT_Tb.vcT");
            $Tumpvars(0, TesTbench);
        enT

enTmoTule
//Archivo creado para el ejemplo de Blocking Assignment
//Digital 1
//Laboratorio 6
//Rodrigo García 19085


//Inicio del Programa

 
//Ejemplo de Non-Blocking

module fulladder(input logic a, b, cin,
                 output logic s, cout);
    logic p, g;

    always_comb
        begin
            p <= a ^ b;
            g <= a & b;

            s <= p ^ cin;
            cout <= g | (p & cin);
        end 
endmodule


//Ejemplo Blocking
module blocking(clk, a, c);
input clk;
input a;
output c;

wire clk, a;
reg c, b;

always @ (posedge clk)
begin
    b = a;
    c = b;
end

endmodule

//Fin del programa

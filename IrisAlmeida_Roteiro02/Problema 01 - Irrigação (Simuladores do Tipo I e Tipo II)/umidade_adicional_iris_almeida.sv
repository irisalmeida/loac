module irrigacao(
  input logic [1:0]umidade,
  output logic [1:0] Saida,
  output logic a,
  output logic b,
  output logic c,
  output logic d,
  output logic e,
  output logic f,
  output logic g
);

  always_comb begin
	case(umidade) // ambas áreas com baixa umidade
       //  entrada umidade tiver valor 00
        2'b00:begin
       Saida <= 2'b00;
       a <= 0;
       b <= 0;
       c <= 0;
       d <= 0;
       e <= 0;
       f <= 0;
       g <= 0;
     end
      
     // entrada umidade com valor 01 
     2'b01:begin
       Saida <= 2'b01;
       a <= 1;
       b <= 1;
       c <= 1;
       d <= 1;
       e <= 1;
       f <= 1;
       g <= 0;
     end
     
       // entrada umidade com  valor 10 
     2'b10:begin
       Saida <= 2'b10;
       a <= 0;
       b <= 1;
       c <= 1;
       d <= 0;
       e <= 0;
       f <= 0;
       g <= 0;
     end		 


      // entrada umidade com valor 11 
     2'b11:begin
       Saida <= 2'b11;
       a <= 1;
       b <= 1;
       c <= 0;
       d <= 1;
       e <= 1;
       f <= 0;
       g <= 1;
     end
	endcase
 end
endmodule



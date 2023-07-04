module irrigacao(
  input logic [1:0]umidade,
  output logic [1:0] Saida);

  always_comb begin
	case(umidade) // ambas áreas com baixa umidade
 		 2'b11: Saida<=2'b11;
   	 2'b01: Saida<=2'b01;
 		 2'b10: Saida<=2'b10;
  		 2'b00: Saida<=2'b00;
	endcase
  end
endmodule


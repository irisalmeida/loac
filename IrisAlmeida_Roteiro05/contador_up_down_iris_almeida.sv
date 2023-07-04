parameter NBITS_COUNT = 4; 

module contador(
  input logic clk, reset, count_up,
  output logic [NBITS_COUNT-1:0] Count 
);

  // Essa é uma estrutura de controle que será ativada sempre que houver uma borda de subida (posedge) no reset ou no clock.
  always_ff @(posedge reset or posedge clk) begin
  
	if(reset) // Se o reset for ativado, a contagem é resetada.
  	Count <= 0;
	else begin // Caso contrário, dependendo do estado de count_up, a contagem será incrementada ou decrementada.
  	if(count_up) // Se count_up for verdadeiro, incrementa a contagem.
    	Count <= Count + 1;
  	else // Se count_up for falso, decrementa a contagem.
    	Count <= Count - 1;
	end
  end

endmodule



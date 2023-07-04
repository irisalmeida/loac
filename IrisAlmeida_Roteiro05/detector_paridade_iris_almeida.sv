parameter tamanho = 1;

module gerador_paridade_par(
  input clk, reset, in_bit, 
  output out_bit);

  // Define um enum logic com dois estados: PAR e IMPAR. O estado atual é mantido na variável "state".
  enum logic [(tamanho - 1) : 0] {PAR, IMPAR} state;
  
  // Esta estrutura de controle será ativada sempre que houver uma borda de subida (posedge) no clock.
  always_ff @ (posedge clk)
    if (reset) // Se o reset for ativado, o estado é definido para PAR.
      state <= PAR;
    else
      unique case (state)
        PAR: 
          if (in_bit == 0) 
            state <= PAR; 
          else 
            state <= IMPAR; 
        IMPAR: 
          if (in_bit == 0) 
            state <= IMPAR;
          else 
            state <= PAR; 
      endcase
  
  // Sempre que o estado muda, o bit de saída é definido para 1 se o estado atual é IMPAR e 0 se o estado é PAR.
  always_comb out_bit <= (state == IMPAR);
  
endmodule

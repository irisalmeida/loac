parameter NBITS_COUNT = 4;

module contador(
  input logic clk, reset, load,
  input logic [NBITS_COUNT-1:0] Data_in, 
  output logic [NBITS_COUNT-1:0] Count);

  // Esta estrutura de controle será ativada sempre que houver uma borda de subida (posedge) no clock.
  always_ff @(posedge clk) begin
    if(reset) // Se o reset for ativado, a contagem é resetada para 1.
      Count <= 1;
    else if (load) // Se a carga for ativada, a contagem recebe os dados de entrada.
      Count <= Data_in;
    else begin
      // Se nem o reset nem a carga estão ativos, o contador se comporta como um contador de anel, ciclando entre os valores 1, 2, 4 e 8.
      unique case (Count)
        1: Count <= 2; // Se a contagem atual é 1, a próxima contagem será 2.
        2: Count <= 4; // Se a contagem atual é 2, a próxima contagem será 4.
        4: Count <= 8; // Se a contagem atual é 4, a próxima contagem será 8.
        8: Count <= 1; // Se a contagem atual é 8, a próxima contagem será 1 (completando o ciclo).
        endcase
    end
  end
endmodule

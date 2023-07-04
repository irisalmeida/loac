parameter integer tamanho = 2;

module FSM_lampada(
    input logic clk, reset,
    input logic [1:0] in_bit,
    output logic out_bit);

  // Define um enum para os estados da máquina de estados finita (FSM). Existem quatro estados: A, B, C e D.
  enum logic [tamanho-1 : 0] {A, B, C, D} state;
                            
  // Na borda de subida do clock,
  always_ff @(posedge clk)
    if (reset) // se o sinal de reset estiver ativo, o estado inicial será A.
      state <= A;
    else
      // Dependendo do estado atual e do valor de in_bit, o estado é atualizado.
      unique case (state)
        A: // No estado A, se in_bit for 01 (representando a lâmpada 1), o estado muda para B. Caso contrário, permanece em A.
          if (in_bit == 2'b01) 
            state <= B;
          else
            state <= A;
        B: // No estado B, o comportamento depende do valor de in_bit. Se for 10 (lâmpada 2), muda para C; se for 01 (lâmpada 1), permanece em B; em outros casos, volta para A.
          if (in_bit == 2'b10) 
            state <= C;
          else if (in_bit == 2'b01)
            state <= B;
          else
            state <= A;
        C: // No estado C, se in_bit for 11 (lâmpada 3), o estado muda para D. Se for 01 (lâmpada 1), retorna para B. Em outros casos, volta para A.
          if (in_bit == 2'b11) 
            state <= D;
          else if (in_bit == 2'b01) 
            state <= B;
          else
            state <= A;
        D: // O estado D é o estado final após a sequência 1-2-3. Sempre que o sistema atinge o estado D, ele retorna ao estado A.
          state <= A;
      endcase

  // A saída out_bit é 1 (verdadeira) quando o estado atual é D e 0 (falso) nos outros estados.
  always_comb out_bit = (state == D);

endmodule


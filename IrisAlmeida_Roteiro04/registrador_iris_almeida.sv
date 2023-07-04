//Registrador de 4 bits que usa uma chave para escolher se irá desempenhar o papel de serial ou de deslocamento 
module REG_4_BITS (
  input logic clk, reset,
  input logic Din_serie,
  input logic sel,
  input logic [3:0] Din,
  output logic [3:0] Dout
);

  logic [3:0] Q;                 // Registrador de 4 bits

  always_ff @ (posedge clk or posedge reset) begin
    if (reset) begin
      Q <= 4'b0;                 // Zera o registrador em caso de reset
    end else begin
      if (sel) begin
        Q <= {Din_serie, Q[3:1]}; // Função serial: insere Din_serie no bit menos significativo, deslocando os demais bits
      end else begin
        Q <= Din;                 // Deslocamento: atribui o valor de Din ao registrador
      end
    end
  end

  always_comb begin
    if (sel) begin
      Dout = Q;                   // Função serial: a saída Dout é igual ao conteúdo do registrador Q
    end else begin
      Dout = Din;                 // Deslocamento: a saída Dout é igual ao valor de entrada Din
    end
  end

endmodule

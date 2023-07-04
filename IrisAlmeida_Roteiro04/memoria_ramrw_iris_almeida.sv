module RAM_RW_4x4 (
  input wire clk,            
  input wire reset,          
  input wire SEL,            
  input wire [3:0] Din,      
  input wire [1:0] Addr,     
  output wire [3:0] Dout     
);

  reg [3:0] mem [0:3];       // Memória RAM de 4x4, com registradores de 4 bits

  always @(posedge clk) begin
    if (reset) begin
      // Zera a memória em caso de reset
      for (integer i = 0; i < 4; i = i + 1) begin
        mem[i] <= 4'b0;      // Atribui o valor '0' a cada elemento da memória
      end
    end else begin
      if (SEL) begin
        // Escrita na memória
        mem[Addr] <= Din;    // Atribui o valor de entrada Din ao endereço Addr da memória
      end else begin
        // Leitura da memória
        Dout <= mem[Addr];   // Atribui o valor do endereço Addr da memória ao sinal de saída Dout
      end
    end
  end

endmodule

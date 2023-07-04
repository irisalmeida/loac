//Não precisa implementar o clock e always ff, pois é puramente combinacional
module RAM_ROM_4x4(
  input logic [1:0] Addr,           
  output logic [3:0] Dout           
);

  always_comb
    case(Addr)
      2'b00: Dout = 4'b0100;        // Se Addr for '00', atribui o valor '0100' a Dout
      2'b01: Dout = 4'b1100;        // Se Addr for '01', atribui o valor '1100' a Dout
      2'b10: Dout = 4'b0110;        // Se Addr for '10', atribui o valor '0110' a Dout
      2'b11: Dout = 4'b0111;        // Se Addr for '11', atribui o valor '0111' a Dout
    endcase

endmodule


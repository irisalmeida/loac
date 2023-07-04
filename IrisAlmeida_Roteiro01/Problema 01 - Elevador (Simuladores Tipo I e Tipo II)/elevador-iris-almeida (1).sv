module elevador_3andares(
  input logic M,A,B,C,
  output logic S);
 
  always_comb S<=~M &(A|B|C);
endmodule


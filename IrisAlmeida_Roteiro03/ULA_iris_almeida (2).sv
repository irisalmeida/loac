parameter BITS = 8;
parameter vetor = 2;
			 
module circuit(
  input logic signed [BITS-1:0] A, B,
  input logic [vetor-1:0] F,
  output logic FLAG_O,
  output logic signed [BITS-1:0] resultado);
 
  always_comb begin
    FLAG_O <= 0;
    
    case(F)
      2'b00: resultado <= A & B;
      2'b01: resultado <= A | B;
      2'b10: begin
        resultado <= A + B;
        if ((A > 0 && B > 0 && resultado < 0) || (A < 0 && B < 0 && resultado >= 0))
          FLAG_O <= 1;
      end
      2'b11: begin
        resultado <= A - B;
        if ((A > 0 && B < 0 && resultado < 0) || (A < 0 && B > 0 && resultado >= 0))
          FLAG_O <= 1;
      end
    endcase
  end
endmodule

//caso de teste 1: 127 + 1 OCORREU OVERFLOW
//caso de teste 2: -128 + (-1) OCORREU UNDERFLOW
//caso de teste 3: (127 - 1) ou (-128 - (-1)) NUNCA OCORRERÁ OVERFLOW OU UNDERFLOW
//caso de teste 4:127 - (-) 1 OCORREU OVERFLOW
//caso de teste 5:-128 - (+) 1 OCORREU UNDERFLOW
//caso de teste 6: (127 + (-1)) ou (-128 + 1) NUNCA OCORRERÁ OVERFLOW OU UNDERFLOW









module soma_8bits(
  input logic signed [7:0] A,
  input logic signed [7:0] B,
  output logic signed [7:0] S,
  output logic Z,
  output logic N,
  output logic P
);

  always_comb begin
	S <= A+B;
	Z <= (S == 0);
	N <= S[7];//MAIS SIGNIFICATIVO
	P <= ~(S[0]);//PAR OU IMPAR
  end

endmodule
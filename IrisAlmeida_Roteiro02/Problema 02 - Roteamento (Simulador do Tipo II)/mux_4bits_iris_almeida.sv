module mux_4bits(
  input logic [3:0] a,b,c,d,
  input logic[1:0] sel,
  output logic[3:0] y);
 
  always_comb
	unique case(sel)
  	0:y <=a;
  	1:y <=b;
  	2:y <=c;
  	default:y<=d;
	endcase
  endmodule

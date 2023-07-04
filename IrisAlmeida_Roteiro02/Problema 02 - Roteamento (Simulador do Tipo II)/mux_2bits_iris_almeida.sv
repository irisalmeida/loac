module mux_2bits(
  input logic a,b,sel,
  output logic out);
 
  always_comb begin
    if(sel == 1) out <=a;
      else out<=b;
  end
endmodule

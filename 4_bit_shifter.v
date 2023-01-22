module four_bit_shifter(A,E,clk,rst);

output  reg A;
reg B,C,D;
input clk,rst,E;

always @ (posedge clk or posedge rst) begin
  if(rst)begin
    A<=0;
    B<=0;
    C<=0;
    D<=0;
  end
  else begin
    A<=B;
    B<=C;
    C<=D;
    D<=E;
  end
end

endmodule 


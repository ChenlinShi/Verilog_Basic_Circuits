module dff(q,q_bar,data,clk);
output reg q;
output q_bar;
input data ,clk;
assign q_bar=!q;
always @ (posedge clk)
 begin
    q<=data;
 end
endmodule
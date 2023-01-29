module dff_8 (
    q_e,q_e_bar,data,clk,rst
);
output reg [7:0] q_e;
output [7:0] q_e_bar;

input [7:0] data;
input clk,rst;

assign q_e_bar=~q_e;
always @(posedge clk or negedge rst )begin
     if (~rst) begin
     q_e<=0;   
    end
    else begin
      q_e<=data;  
    end
end


endmodule //8_bit_dff





// module dff(q,q_bar,data,clk);
// output reg q;
// output q_bar;
// input data ,clk;
// assign q_bar=!q;
// always @ (posedge clk)
//  begin
//     q<=data;
//  end
// endmodule
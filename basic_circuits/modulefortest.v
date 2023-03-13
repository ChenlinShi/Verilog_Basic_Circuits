module ADD_full(output reg c_out_r,sum_r, input a,b,cin,clk,rst);
// wire w1, w2, w3;
wire sum,c_out;
assign sum=a^b^cin;
assign c_out=(a&b)|(cin&(a^b));
always @(posedge clk ) begin
     if (rst) begin
         sum_r <= 0;
         c_out_r <= 0;
     end
     else begin
         sum_r <= sum;
         c_out_r <= c_out;
     end    
end
endmodule

module ADD_full_1(output c_out,sum, input a,b,cin);
// wire w1, w2, w3;

assign sum=a^b^cin;

assign c_out=(a&b)|(cin&(a^b));
    
endmodule


module multiplexer (a,b,sel,out_r,clk,rst);
input a,b,clk,rst;
input sel;
output reg out_r;
wire out;
assign out = sel?a:b;
always @(posedge clk ) begin
     if (rst) begin
         out_r <= 0;
     end
     else begin
         out_r <= out;
     end    
end
endmodule

module multiplexer_1 (a,b,sel,out);

input a,b;
input sel;
output out;
assign out = sel?a:b;
endmodule

module  multiplexer_4_bit (a,b,sel,out_r,clk,rst 
);
input [3:0]a,b;
input sel,clk,rst;
output reg [3:0]out_r;
wire [3:0]out;
assign out= (sel)?a:b;
always @(posedge clk ) begin
     if (rst) begin
         out_r <= 0;
     end
     else begin
         out_r <= out;
     end   
end
endmodule 

module  multiplexer_4_bit_1 (a,b,sel,out
);

input [3:0]a,b;
input sel;
output [3:0]out;
assign out= (sel)?a:b;


endmodule 
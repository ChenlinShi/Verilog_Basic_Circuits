module LCA_64bit (
    a,b,cin,cout_r,sum_r,clk,rst
);
input [63:0]a,b;
input cin,clk,rst;

output reg [63:0]sum_r;
output reg cout_r;

wire [63:0] p;
wire [63:0] g;
wire [63:0] sum;
wire cout;
wire [63:0] c;

pg_gen u0 (a,b,p,g);

assign c[0]=cin;  //cin 0th bit
// assign c[1]=g[0]|(p[0]&c[0]); //cin 1st bit
// assign c[2]=g[1]|(p[1]&c[1]); //cin 2nd bit
// assign c[3]=g[2]|(p[2]&c[2]); //cin 3rd bit
// assign c[4]=g[3]|(p[3]&c[3]); // cin 4th bit
// assign c[5]=g[4]|(p[4]&c[4]); //cin 5th bit
// assign c[6]=g[5]|(p[5]&c[5]); //cin 6th bit
// assign c[7]=g[6]|(p[6]&c[6]);  //cin 7th bit

assign c[63:1]=g[62:0]|(p[62:0]&c[62:0]); // 62 bits

assign cout = g[63]|(p[63]&c[63]); //cin 63th bit
// assign cout=g[7]|(p[7]&c[7]); //cin 8th bit

// assign sum = p^c;
assign sum[0] = p[0]^c[0]; //sum 0th bit
assign sum[63:1] = p[63:1]^c[63:1]; //63 bits
// assign sum[1] = p[1]^c[1]; //sum 1st bit
// assign sum[2] = p[2]^c[2]; //sum 2nd bit
// assign sum[3] = p[3]^c[3]; //sum 3rd bit
// assign sum[4] = p[4]^c[4]; //sum 4th bit
// assign sum[5] = p[5]^c[5]; //sum 5th bit
// assign sum[6] = p[6]^c[6]; //sum 6th bit
// assign sum[7] = p[7]^c[7]; //sum 7th bit
always @(posedge clk or negedge rst) begin
   if (~rst) begin
        sum_r  <=0;
        cout_r <=0;
   end
   else begin
        sum_r  <=sum;
        cout_r <=cout;
   end
         
end
endmodule //LCA_8bit

module pg_gen (
    a,b,p,g    
);
input [63:0]a,b;
output [63:0]p,g;

assign p=a^b;
assign g=a&b;

endmodule //LCA_8bit
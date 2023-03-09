module CLA_v2_64 (
    a,b,cin,sum_r,cout_r,clk,rst
);

input [63:0] a,b;
input cin,clk,rst;
output reg [63:0] sum_r;
output reg cout_r;

wire [63:0] sum;
wire cout;
wire c0;
wire [14:0] bit_carry;
assign c0=cin;
CLA_4_bit_block u0 (a[3:0],b[3:0],c0,sum[3:0],bit_carry[0]);
CLA_4_bit_block u1 (a[7:4],b[7:4],bit_carry[0],sum[7:4],bit_carry[1]);
CLA_4_bit_block u2 (a[11:8],b[11:8],bit_carry[1],sum[11:8],bit_carry[2]);
CLA_4_bit_block u3 (a[15:12],b[15:12],bit_carry[2],sum[15:12],bit_carry[3]);
CLA_4_bit_block u4 (a[19:16],b[19:16],bit_carry[3],sum[19:16],bit_carry[4]);
CLA_4_bit_block u5 (a[23:20],b[23:20],bit_carry[4],sum[23:20],bit_carry[5]);
CLA_4_bit_block u6 (a[27:24],b[27:24],bit_carry[5],sum[27:24],bit_carry[6]);
CLA_4_bit_block u7 (a[31:28],b[31:28],bit_carry[6],sum[31:28],bit_carry[7]);
CLA_4_bit_block u8 (a[35:32],b[35:32],bit_carry[7],sum[35:32],bit_carry[8]);
CLA_4_bit_block u9 (a[39:36],b[39:36],bit_carry[8],sum[39:36],bit_carry[9]);
CLA_4_bit_block u10 (a[43:40],b[43:40],bit_carry[9],sum[43:40],bit_carry[10]);
CLA_4_bit_block u11 (a[47:44],b[47:44],bit_carry[10],sum[47:44],bit_carry[11]);
CLA_4_bit_block u12 (a[51:48],b[51:48],bit_carry[11],sum[51:48],bit_carry[12]);
CLA_4_bit_block u13 (a[55:52],b[55:52],bit_carry[12],sum[55:52],bit_carry[13]);
CLA_4_bit_block u14 (a[59:56],b[59:56],bit_carry[13],sum[59:56],bit_carry[14]);
CLA_4_bit_block u15 (a[63:60],b[63:60],bit_carry[14],sum[63:60],cout);

always @(posedge clk ) begin
    if (rst) begin
        sum_r <= 0;
        cout_r <= 0;
    end else begin
        sum_r <= sum;
        cout_r <= cout;
    end
end

endmodule //CLA_v2_64


module CLA_4_bit_block(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;

wire [3:0] p,g,c;

pg_gen u0 (a,b,p,g);

assign c[0]=cin;
assign c[1]= g[0]|(p[0]&c[0]);
assign c[2]= g[1]|(p[1]&c[1]);
assign c[3]= g[2]|(p[2]&c[2]);
assign cout= g[3]|(p[3]&c[3]);
assign sum[0]=p[0]^c[0];
assign sum[3:1]=p[3:1]^c[3:1];


endmodule

module pg_gen (
    a,b,p,g    
);
input [3:0]a,b;
output [3:0]p,g;

assign p=a^b;
assign g=a&b;

endmodule 
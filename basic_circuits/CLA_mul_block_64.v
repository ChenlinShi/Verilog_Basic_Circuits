module top_4_64 (
    a,b,cin,sum_r,cout_r,clk,rst
);

input [63:0]a,b;
input cin,clk,rst;
output reg [63:0]sum_r;
output reg cout_r;
reg cin_r;

wire [63:0]sum;
wire cout;
wire [14:0] bit_carry;

CLA_4_bit_block CLA1 (a[3:0],b[3:0],cin_r,sum[3:0],bit_carry[0]);
CLA_4_bit_block CLA2 (a[7:4],b[7:4],bit_carry[0],sum[7:4],bit_carry[1]);
CLA_4_bit_block CLA3 (a[11:8],b[11:8],bit_carry[1],sum[11:8],bit_carry[2]);
CLA_4_bit_block CLA4 (a[15:12],b[15:12],bit_carry[2],sum[15:12],bit_carry[3]);
CLA_4_bit_block CLA5 (a[19:16],b[19:16],bit_carry[3],sum[19:16],bit_carry[4]);
CLA_4_bit_block CLA6 (a[23:20],b[23:20],bit_carry[4],sum[23:20],bit_carry[5]);
CLA_4_bit_block CLA7 (a[27:24],b[27:24],bit_carry[5],sum[27:24],bit_carry[6]);
CLA_4_bit_block CLA8 (a[31:28],b[31:28],bit_carry[6],sum[31:28],bit_carry[7]);
CLA_4_bit_block CLA9 (a[35:32],b[35:32],bit_carry[7],sum[35:32],bit_carry[8]);
CLA_4_bit_block CLA10 (a[39:36],b[39:36],bit_carry[8],sum[39:36],bit_carry[9]);
CLA_4_bit_block CLA11 (a[43:40],b[43:40],bit_carry[9],sum[43:40],bit_carry[10]);
CLA_4_bit_block CLA12 (a[47:44],b[47:44],bit_carry[10],sum[47:44],bit_carry[11]);
CLA_4_bit_block CLA13 (a[51:48],b[51:48],bit_carry[11],sum[51:48],bit_carry[12]);
CLA_4_bit_block CLA14 (a[55:52],b[55:52],bit_carry[12],sum[55:52],bit_carry[13]);
CLA_4_bit_block CLA15 (a[59:56],b[59:56],bit_carry[13],sum[59:56],bit_carry[14]);
CLA_4_bit_block CLA16 (a[63:60],b[63:60],bit_carry[14],sum[63:60],cout);

always @(posedge clk ) begin
    if (rst) begin
        sum_r<=0;
        cout_r<=0;
        cin_r<=0;
    end
    else begin
        sum_r<=sum;
        cout_r<=cout;
        cin_r<=cin;
    end
end


endmodule //CLA_mul_block_64

module top_8_64 (
 a,b,cin,sum_r,cout_r,clk,rst
);

input [63:0]a,b;
input cin,clk,rst;
output reg [63:0]sum_r;
output reg cout_r;
reg cin_r;

wire [63:0]sum;
wire cout;
wire [6:0] bit_carry;

CLA_8_bit_block CLA1 (a[7:0],b[7:0],cin_r,sum[7:0],bit_carry[0]);
CLA_8_bit_block CLA2 (a[15:8],b[15:8],bit_carry[0],sum[15:8],bit_carry[1]);
CLA_8_bit_block CLA3 (a[23:16],b[23:16],bit_carry[1],sum[23:16],bit_carry[2]);
CLA_8_bit_block CLA4 (a[31:24],b[31:24],bit_carry[2],sum[31:24],bit_carry[3]);
CLA_8_bit_block CLA5 (a[39:32],b[39:32],bit_carry[3],sum[39:32],bit_carry[4]);
CLA_8_bit_block CLA6 (a[47:40],b[47:40],bit_carry[4],sum[47:40],bit_carry[5]);
CLA_8_bit_block CLA7 (a[55:48],b[55:48],bit_carry[5],sum[55:48],bit_carry[6]);
CLA_8_bit_block CLA8 (a[63:56],b[63:56],bit_carry[6],sum[63:56],cout);

always @(posedge clk ) begin
    if (rst) begin
        sum_r<=0;
        cout_r<=0;
        cin_r<=0;
    end
    else begin
        sum_r<=sum;
        cout_r<=cout;
        cin_r<=cin;
    end
end


endmodule //CLA_mul_block_64

module top_16_64 (
    a,b,cin,sum_r,cout_r,clk,rst
);
input [63:0]a,b;
input cin,clk,rst;
output reg [63:0]sum_r;
output reg cout_r;
reg cin_r;

wire [63:0]sum;
wire cout;
wire [2:0] bit_carry;


CLA_16_bit_block CLA1 (a[15:0],b[15:0],cin_r,sum[15:0],bit_carry[0]);
CLA_16_bit_block CLA2 (a[31:16],b[31:16],bit_carry[0],sum[31:16],bit_carry[1]);
CLA_16_bit_block CLA3 (a[47:32],b[47:32],bit_carry[1],sum[47:32],bit_carry[2]);
CLA_16_bit_block CLA4 (a[63:48],b[63:48],bit_carry[2],sum[63:48],cout);

always @(posedge clk ) begin
    if (rst) begin
        sum_r<=0;
        cout_r<=0;
        cin_r<=0;
    end
    else begin
        sum_r<=sum;
        cout_r<=cout;
        cin_r<=cin;
    end
end

endmodule //CLA_mul_block_64



module CLA_4_bit_block(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;
wire [3:0] p,g,c;
pg_gen_4 u0 (a,b,p,g);
assign c[0]=cin;
assign c[1]= g[0]|(p[0]&c[0]);
assign c[2]= g[1]|(p[1]&c[1]);
assign c[3]= g[2]|(p[2]&c[2]);
assign cout= g[3]|(p[3]&c[3]);
assign sum[0]=p[0]^c[0];
assign sum[3:1]=p[3:1]^c[3:1];
endmodule

module pg_gen_4 (
    a,b,p,g    
);
input [3:0]a,b;
output [3:0]p,g;

assign p=a^b;
assign g=a&b;

endmodule 

module CLA_8_bit_block(a,b,cin,sum,cout);
input [7:0] a,b;
input cin;
output [7:0] sum;
output cout;
wire [7:0] p,g,c;
pg_gen_8 u0 (a,b,p,g);
assign c[0]=cin;
assign c[1]= g[0]|(p[0]&c[0]);
assign c[2]= g[1]|(p[1]&c[1]);
assign c[3]= g[2]|(p[2]&c[2]);
assign c[4]= g[3]|(p[3]&c[3]);
assign c[5]= g[4]|(p[4]&c[4]);
assign c[6]= g[5]|(p[5]&c[5]);
assign c[7]= g[6]|(p[6]&c[6]);
assign cout= g[7]|(p[7]&c[7]);
assign sum[0]=p[0]^c[0];
assign sum[7:1]=p[7:1]^c[7:1];

endmodule

module pg_gen_8 (
    a,b,p,g    
);
input [7:0]a,b;
output [7:0]p,g;
assign p=a^b;
assign g=a&b;
endmodule 

module CLA_16_bit_block(a,b,cin,sum,cout);
input [15:0] a,b;
input cin;
output [15:0] sum;
output cout;
wire [15:0] p,g,c;
pg_gen_16 u0 (a,b,p,g);
assign c[0]=cin;
assign c[15:1]=g[14:0]|(p[14:0]&c[14:0]); // 62 bits
assign cout = g[15]|(p[15]&c[15]); //cin 63th bit
assign sum[0]=p[0]^c[0];
assign sum[15:1]=p[15:1]^c[15:1];
endmodule

module pg_gen_16 (
    a,b,p,g    
);
input [15:0]a,b;
output [15:0]p,g;
assign p=a^b;
assign g=a&b;
endmodule 

module CLA_32_bit_block(a,b,cin,sum,cout);
input [31:0] a,b;
input cin;
output [31:0] sum;
output cout;
wire [31:0] p,g,c;
pg_gen_32 u0 (a,b,p,g);
assign c[0]=cin;
assign c[31:1]=g[30:0]|(p[30:0]&c[30:0]); // 62 bits
assign cout = g[31]|(p[31]&c[31]); //cin 63th bit
assign sum[0]=p[0]^c[0];
assign sum[31:1]=p[31:1]^c[31:1];
endmodule

module pg_gen_32 (
    a,b,p,g    
);
input [31:0]a,b;
output [31:0]p,g;
assign p=a^b;
assign g=a&b;
endmodule 
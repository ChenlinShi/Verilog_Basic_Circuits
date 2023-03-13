module cla_8bit (
    a,b,cin,sum_r,cout_r,clk,rst
);
input [7:0]a,b;
input cin;
output reg [7:0]sum_r;
output reg cout_r;

input clk,rst;
wire [7:0]  sum;
wire cout;
reg cin_r;
CLA_8_bit_block u0 (a,b,cin_r,sum,cout);

always @(posedge clk ) begin
    if(rst) begin
        sum_r<=8'b0;
        cout_r<=1'b0;
        cin_r<=1'b0;
    end
    else begin
        sum_r<=sum;
        cout_r<=cout;
        cin_r<=cin;
    end
end

endmodule

module cla_8bit_4bit_block (
    a,b,cin,sum_r,cout_r,clk,rst
);
input [7:0]a,b;
input cin;
output reg [7:0]sum_r;
output reg cout_r;

input clk,rst;
wire [7:0]  sum;
wire cout;
reg cin_r;

wire bit_carry;

CLA_4_bit_block CLA_1 (a[3:0],b[3:0],cin_r,sum[3:0],bit_carry);
CLA_4_bit_block CLA_2 (a[7:4],b[7:4],bit_carry,sum[7:4],cout);

always @(posedge clk ) begin
    if(rst) begin
        sum_r<=8'b0;
        cout_r<=1'b0;
        cin_r<=1'b0;
    end
    else begin
        sum_r<=sum;
        cout_r<=cout;
        cin_r<=cin;
    end
end

endmodule



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
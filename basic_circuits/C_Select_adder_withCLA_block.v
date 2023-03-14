module C_SA_with_CLA_block_64bit (
    a,b,cin,sum_r,cout_r,clk,rst
);

input [63:0]a,b;
input cin,clk,rst;
output reg [63:0]sum_r;
output reg cout_r;
reg cin_r;
wire [63:0]sum;
wire cout;
wire [6:0]bit_carry;
C_Select_adder_with_CLA_block_8bit  csa1 (a[7:0],b[7:0],cin_r,sum[7:0],bit_carry[0]);
C_Select_adder_with_CLA_block_8bit  csa2 (a[15:8],b[15:8],bit_carry[0],sum[15:8],bit_carry[1]);
C_Select_adder_with_CLA_block_8bit  csa3 (a[23:16],b[23:16],bit_carry[1],sum[23:16],bit_carry[2]);
C_Select_adder_with_CLA_block_8bit  csa4 (a[31:24],b[31:24],bit_carry[2],sum[31:24],bit_carry[3]);
C_Select_adder_with_CLA_block_8bit  csa5 (a[39:32],b[39:32],bit_carry[3],sum[39:32],bit_carry[4]);
C_Select_adder_with_CLA_block_8bit  csa6 (a[47:40],b[47:40],bit_carry[4],sum[47:40],bit_carry[5]);
C_Select_adder_with_CLA_block_8bit  csa7 (a[55:48],b[55:48],bit_carry[5],sum[55:48],bit_carry[6]);
C_Select_adder_with_CLA_block_8bit  csa8 (a[63:56],b[63:56],bit_carry[6],sum[63:56],cout);

always @(posedge clk )
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
endmodule


module C_Select_adder_with_CLA_block_8bit (
    a,b,cin,sum,cout
);

input [7:0] a,b;
input cin;
output [7:0] sum;
output cout ;

wire [7:0]s0,s1;
wire cout_1,cout_0;
CLAv2_8bit u0 (a,b,1'b0,s0,cout_0);
CLAv2_8bit u1 (a,b,1'b1,s1,cout_1);

multiplexer_8_bit  sum_mul(s1,s0,cin,sum);

assign cout = (~cin&cout_1 )|(cin &cout_0);

endmodule //C_Select_adder_withCLA.block

module CLAv2_8bit (
    a,b,cin,sum,cout
    );

input [7:0]a,b;
input cin;
output [7:0]sum;
output cout;

wire cin_first;
CLA_4_bit_block u0 (a[3:0],b[3:0],cin,sum[3:0],cin_first);
CLA_4_bit_block u1 (a[7:4],b[7:4],cin_first,sum[7:4],cout);

endmodule //CLAv2_8bit


    
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

module  multiplexer_8_bit (a,b,sel,out
);

input [7:0]a,b;
input sel;
output [7:0]out;
assign out= (sel)?a:b;

endmodule 

// module multiplexer (a,b,sel,out);

// input a,b;
// input sel;
// output out;
// assign out = sel?a:b;
// endmodule
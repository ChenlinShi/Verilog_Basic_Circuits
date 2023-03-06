module Con_sa_64 (
    a,b,cin,sum_r,cout_r,clk,rst
);
input [63:0]a,b;
input cin,clk,rst;
output reg [63:0]sum_r;
output reg cout;

wire [6:0]bit_carry;
wire  [63:0] sum;
wire cout;

Conditional_sum_adder_8bit cs1(a[7:0],b[7:0],cin,sum[7:0],bit_carry[0]);
Conditional_sum_adder_8bit cs2(a[15:8],b[15:8],bit_carry[0],sum[15:8],bit_carry[1]);
Conditional_sum_adder_8bit cs3(a[23:16],b[23:16],bit_carry[1],sum[23:16],bit_carry[2]);
Conditional_sum_adder_8bit cs4(a[31:24],b[31:24],bit_carry[2],sum[31:24],bit_carry[3]);
Conditional_sum_adder_8bit cs5(a[39:32],b[39:32],bit_carry[3],sum[39:32],bit_carry[4]);
Conditional_sum_adder_8bit cs6(a[47:40],b[47:40],bit_carry[4],sum[47:40],bit_carry[5]);
Conditional_sum_adder_8bit cs7(a[55:48],b[55:48],bit_carry[5],sum[55:48],bit_carry[6]);
Conditional_sum_adder_8bit cs8(a[63:56],b[63:56],bit_carry[6],sum[63:56],cout);

always @(posedge clk ) begin
    if(rst) begin
        sum_r<=0;
        cout_r<=0;
    end
    else begin
        sum_r<=sum;
        cout_r<=cout;
    end
end



endmodule //Con_sa_64


module Conditional_sum_adder_8bit (
    a,b,cin,sum,cout
);

input [7:0]a,b;
input cin;
output [7:0]sum;
output cout;

wire cout_first;


CSelectAdder_4bit cs1(a[3:0],b[3:0],cin,sum[3:0],cout_first);
CSelectAdder_4bit cs2(a[7:4],b[7:4],cout_first,sum[7:4],cout);


endmodule //Conditional_sum_adder_8bit


module CSelectAdder_4bit (
    a,b,cin,sum,cout
);

input [3:0]a,b;
input cin;
output [3:0]sum;
output cout;

wire [3:0]bit_carry,bit_carry_1;
wire [3:0]sum_1,sum_2;

// cin==1
ADD_full adder1(bit_carry[0],sum_1[0],a[0],b[0],1'b1);
ADD_full adder2(bit_carry[1],sum_1[1],a[1],b[1],bit_carry[0]);
ADD_full adder3(bit_carry[2],sum_1[2],a[2],b[2],bit_carry[1]);
ADD_full adder4(bit_carry[3],sum_1[3],a[3],b[3],bit_carry[2]);
//cin==0
ADD_full adder_1_1(bit_carry_1[0],sum_2[0],a[0],b[0],1'b0);
ADD_full adder_1_2(bit_carry_1[1],sum_2[1],a[1],b[1],bit_carry_1[0]);
ADD_full adder_1_3(bit_carry_1[2],sum_2[2],a[2],b[2],bit_carry_1[1]);
ADD_full adder_1_4(bit_carry_1[3],sum_2[3],a[3],b[3],bit_carry_1[2]);

multiplexer_4_bit mul_8(sum_1,sum_2,cin,sum);


multiplexer mul_1(bit_carry[3],bit_carry_1[3],cin,cout);


endmodule //CSelectAdder_4bit

module ADD_full(output c_out,sum, input a,b,cin);
// wire w1, w2, w3;

assign sum=a^b^cin;

assign c_out=(a&b)|(cin&(a^b));
    
endmodule

module  multiplexer_4_bit (a,b,sel,out
    
);

input [3:0]a,b;
input sel;
output [3:0]out;
assign out= (sel)?a:b;


endmodule 

module multiplexer (a,b,sel,out);

input a,b;
input sel;
output out;
assign out = sel?a:b;
endmodule
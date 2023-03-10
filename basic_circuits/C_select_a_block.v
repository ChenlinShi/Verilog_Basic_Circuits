module CSelectAdder_16bit (
    a,b,cin,sum,cout
);

input [15:0]a,b;
input cin;
output [15:0]sum;
output cout;

wire [15:0]bit_carry,bit_carry_1;
wire [15:0]sum_1,sum_2;
// cin==1
ADD_full adder1(bit_carry[0],sum_1[0],a[0],b[0],1'b1);
ADD_full adder2(bit_carry[1],sum_1[1],a[1],b[1],bit_carry[0]);
ADD_full adder3(bit_carry[2],sum_1[2],a[2],b[2],bit_carry[1]);
ADD_full adder4(bit_carry[3],sum_1[3],a[3],b[3],bit_carry[2]);
ADD_full adder5(bit_carry[4],sum_1[4],a[4],b[4],bit_carry[3]);
ADD_full adder6(bit_carry[5],sum_1[5],a[5],b[5],bit_carry[4]);
ADD_full adder7(bit_carry[6],sum_1[6],a[6],b[6],bit_carry[5]);
ADD_full adder8(bit_carry[7],sum_1[7],a[7],b[7],bit_carry[6]);
ADD_full adder9(bit_carry[8],sum_1[8],a[8],b[8],bit_carry[7]);
ADD_full adder10(bit_carry[9],sum_1[9],a[9],b[9],bit_carry[8]);
ADD_full adder11(bit_carry[10],sum_1[10],a[10],b[10],bit_carry[9]);
ADD_full adder12(bit_carry[11],sum_1[11],a[11],b[11],bit_carry[10]);
ADD_full adder13(bit_carry[12],sum_1[12],a[12],b[12],bit_carry[11]);
ADD_full adder14(bit_carry[13],sum_1[13],a[13],b[13],bit_carry[12]);
ADD_full adder15(bit_carry[14],sum_1[14],a[14],b[14],bit_carry[13]);
ADD_full adder16(bit_carry[15],sum_1[15],a[15],b[15],bit_carry[14]);
//cin==0
ADD_full adder_1_1(bit_carry_1[0],sum_2[0],a[0],b[0],1'b0);
ADD_full adder_1_2(bit_carry_1[1],sum_2[1],a[1],b[1],bit_carry_1[0]);
ADD_full adder_1_3(bit_carry_1[2],sum_2[2],a[2],b[2],bit_carry_1[1]);
ADD_full adder_1_4(bit_carry_1[3],sum_2[3],a[3],b[3],bit_carry_1[2]);
ADD_full adder_1_5(bit_carry_1[4],sum_2[4],a[4],b[4],bit_carry_1[3]);
ADD_full adder_1_6(bit_carry_1[5],sum_2[5],a[5],b[5],bit_carry_1[4]);
ADD_full adder_1_7(bit_carry_1[6],sum_2[6],a[6],b[6],bit_carry_1[5]);
ADD_full adder_1_8(bit_carry_1[7],sum_2[7],a[7],b[7],bit_carry_1[6]);
ADD_full adder_1_9(bit_carry_1[8],sum_2[8],a[8],b[8],bit_carry_1[7]);
ADD_full adder_1_10(bit_carry_1[9],sum_2[9],a[9],b[9],bit_carry_1[8]);
ADD_full adder_1_11(bit_carry_1[10],sum_2[10],a[10],b[10],bit_carry_1[9]);
ADD_full adder_1_12(bit_carry_1[11],sum_2[11],a[11],b[11],bit_carry_1[10]);
ADD_full adder_1_13(bit_carry_1[12],sum_2[12],a[12],b[12],bit_carry_1[11]);
ADD_full adder_1_14(bit_carry_1[13],sum_2[13],a[13],b[13],bit_carry_1[12]);
ADD_full adder_1_15(bit_carry_1[14],sum_2[14],a[14],b[14],bit_carry_1[13]);
ADD_full adder_1_16(bit_carry_1[15],sum_2[15],a[15],b[15],bit_carry_1[14]);

// multiplexer_16_bit mul_16(sum_1,sum_2,cin,sum);
multiplexer mul_sum_0 (sum_1[0],sum_2[0],cin,sum[0]);
multiplexer mul_sum_1 (sum_1[1],sum_2[1],cin,sum[1]);
multiplexer mul_sum_2 (sum_1[2],sum_2[2],cin,sum[2]);
multiplexer mul_sum_3 (sum_1[3],sum_2[3],cin,sum[3]);
multiplexer mul_sum_4 (sum_1[4],sum_2[4],cin,sum[4]);
multiplexer mul_sum_5 (sum_1[5],sum_2[5],cin,sum[5]);
multiplexer mul_sum_6 (sum_1[6],sum_2[6],cin,sum[6]);
multiplexer mul_sum_7 (sum_1[7],sum_2[7],cin,sum[7]);
multiplexer mul_sum_8 (sum_1[8],sum_2[8],cin,sum[8]);
multiplexer mul_sum_9 (sum_1[9],sum_2[9],cin,sum[9]);
multiplexer mul_sum_10 (sum_1[10],sum_2[10],cin,sum[10]);
multiplexer mul_sum_11 (sum_1[11],sum_2[11],cin,sum[11]);
multiplexer mul_sum_12 (sum_1[12],sum_2[12],cin,sum[12]);
multiplexer mul_sum_13 (sum_1[13],sum_2[13],cin,sum[13]);
multiplexer mul_sum_14 (sum_1[14],sum_2[14],cin,sum[14]);
multiplexer mul_sum_15 (sum_1[15],sum_2[15],cin,sum[15]);

multiplexer mul_1(bit_carry[15],bit_carry_1[15],cin,cout);

endmodule //CSelectAdder_4bit

module CSelectAdder_8bit ( a,b,cin,sum,cout);
input [7:0]a,b;
input cin;
output [7:0]sum;
output cout;

wire [7:0]bit_carry,bit_carry_1;
wire [7:0]sum_1,sum_2;
// cin==1
ADD_full adder1(bit_carry[0],sum_1[0],a[0],b[0],1'b1);
ADD_full adder2(bit_carry[1],sum_1[1],a[1],b[1],bit_carry[0]);
ADD_full adder3(bit_carry[2],sum_1[2],a[2],b[2],bit_carry[1]);
ADD_full adder4(bit_carry[3],sum_1[3],a[3],b[3],bit_carry[2]);
ADD_full adder5(bit_carry[4],sum_1[4],a[4],b[4],bit_carry[3]);
ADD_full adder6(bit_carry[5],sum_1[5],a[5],b[5],bit_carry[4]);
ADD_full adder7(bit_carry[6],sum_1[6],a[6],b[6],bit_carry[5]);
ADD_full adder8(bit_carry[7],sum_1[7],a[7],b[7],bit_carry[6]);
//cin==0
ADD_full adder_1_1(bit_carry_1[0],sum_2[0],a[0],b[0],1'b0);
ADD_full adder_1_2(bit_carry_1[1],sum_2[1],a[1],b[1],bit_carry_1[0]);
ADD_full adder_1_3(bit_carry_1[2],sum_2[2],a[2],b[2],bit_carry_1[1]);
ADD_full adder_1_4(bit_carry_1[3],sum_2[3],a[3],b[3],bit_carry_1[2]);
ADD_full adder_1_5(bit_carry_1[4],sum_2[4],a[4],b[4],bit_carry_1[3]);
ADD_full adder_1_6(bit_carry_1[5],sum_2[5],a[5],b[5],bit_carry_1[4]);
ADD_full adder_1_7(bit_carry_1[6],sum_2[6],a[6],b[6],bit_carry_1[5]);
ADD_full adder_1_8(bit_carry_1[7],sum_2[7],a[7],b[7],bit_carry_1[6]);

// multiplexer_8_bit mul_8(sum_1,sum_2,cin,sum);
multiplexer mul_sum_0 (sum_1[0],sum_2[0],cin,sum[0]);
multiplexer mul_sum_1 (sum_1[1],sum_2[1],cin,sum[1]);
multiplexer mul_sum_2 (sum_1[2],sum_2[2],cin,sum[2]);
multiplexer mul_sum_3 (sum_1[3],sum_2[3],cin,sum[3]);
multiplexer mul_sum_4 (sum_1[4],sum_2[4],cin,sum[4]);
multiplexer mul_sum_5 (sum_1[5],sum_2[5],cin,sum[5]);
multiplexer mul_sum_6 (sum_1[6],sum_2[6],cin,sum[6]);
multiplexer mul_sum_7 (sum_1[7],sum_2[7],cin,sum[7]);

multiplexer mul_1(bit_carry[7],bit_carry_1[7],cin,cout);
endmodule //CSelectAdder_4bit

module ADD_full(output c_out,sum, input a,b,cin);
// wire w1, w2, w3;
assign sum=a^b^cin;
assign c_out=(a&b)|(cin&(a^b));
endmodule

module  multiplexer_8_bit (a,b,sel,out
);
input [7:0]a,b;
input sel;
output [7:0]out;
assign out= (sel)?a:b;
endmodule 

module multiplexer (a,b,sel,out);
input a,b;
input sel;
output out;
assign out = sel?a:b;
endmodule

module  multiplexer_16_bit (a,b,sel,out
);
input [15:0]a,b;
input sel;
output [15:0]out;
assign out= (sel)?a:b;
endmodule 

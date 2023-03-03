module CSelectAdder_8bit (
    a,b,cin,sum,cout
);

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

multiplexer_8_bit mul_8(sum_1,sum_2,cin,sum);


multiplexer mul_1(bit_carry[7],bit_carry_1[7],cin,cout);









endmodule //CSelectAdder_8bit




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
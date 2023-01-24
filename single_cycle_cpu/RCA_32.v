module RCA_32_bit_comb(
a,b,cin,cout,sum
);
input [31:0]a,b;
output [31:0]sum;
input cin;
output cout;
wire [2:0] bit_carry; 
no_clk_8_bit_adder u0(a[7:0],b[7:0],cin,bit_carry[0],sum[7:0]);
no_clk_8_bit_adder u1(a[15:8],b[15:8],bit_carry[0],bit_carry[1],sum[15:8]);
no_clk_8_bit_adder u2(a[23:16],b[23:16],bit_carry[1],bit_carry[2],sum[23:16]);
no_clk_8_bit_adder u3(a[31:24],b[31:24],bit_carry[2],cout,sum[31:24]);

endmodule

module no_clk_8_bit_adder (
 a,
 b,
 cin,
 cout,
 sum
);
input [7:0]a,b;
input cin;
output   cout;
output   [7:0]sum;
wire [6:0]bit_carry;

ADD_full u0(bit_carry[0],sum[0],a[0],b[0],cin);
ADD_full u1(bit_carry[1],sum[1],a[1],b[1],bit_carry[0]);
ADD_full u2(bit_carry[2],sum[2],a[2],b[2],bit_carry[1]);
ADD_full u3(bit_carry[3],sum[3],a[3],b[3],bit_carry[2]);
ADD_full u4(bit_carry[4],sum[4],a[4],b[4],bit_carry[3]);
ADD_full u5(bit_carry[5],sum[5],a[5],b[5],bit_carry[4]);
ADD_full u6(bit_carry[6],sum[6],a[6],b[6],bit_carry[5]);
ADD_full u7(cout,sum[7],a[7],b[7],bit_carry[6]);

endmodule 


module ADD_half_nogate(output cout,sum, input a,b);


assign      sum=a^b;
assign     cout=a&&b;


endmodule


module ADD_full(output c_out,sum, input a,b,cin);
wire w1, w2, w3;

ADD_half_nogate M1(w2,w1,a,b);
ADD_half_nogate M2(w3,sum,cin,w1);

assign c_out=w3||w2;
    
endmodule


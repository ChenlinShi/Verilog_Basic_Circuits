module eight_bit_adder (
 a,
 b,
 cin,
 cout,
 sum,
 clk,
 rst
);
input [7:0]a,b;
input cin,clk,rst;
output   cout;
output   [7:0]sum;
wire [6:0]bit_carry;

wire [7:0] a_d,b_d,a_d_bar,b_d_bar;

dff_8 d0(
    a_d,a_d_bar,a,clk,rst
);
dff_8 d1(
    b_d,b_d_bar,b,clk,rst
);

ADD_full u0(bit_carry[0],sum[0],a_d[0],b_d[0],cin);
ADD_full u1(bit_carry[1],sum[1],a_d[1],b_d[1],bit_carry[0]);
ADD_full u2(bit_carry[2],sum[2],a_d[2],b_d[2],bit_carry[1]);
ADD_full u3(bit_carry[3],sum[3],a_d[3],b_d[3],bit_carry[2]);
ADD_full u4(bit_carry[4],sum[4],a_d[4],b_d[4],bit_carry[3]);
ADD_full u5(bit_carry[5],sum[5],a_d[5],b_d[5],bit_carry[4]);
ADD_full u6(bit_carry[6],sum[6],a_d[6],b_d[6],bit_carry[5]);
ADD_full u7(cout,sum[7],a_d[7],b_d[7],bit_carry[6]);

endmodule //8_bit_adder

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

module dff_8 (
    q_e,q_e_bar,data,clk,rst
);
output reg [7:0] q_e;
output [7:0] q_e_bar;

input [7:0] data;
input clk,rst;

assign q_e_bar=~q_e;
always @(posedge clk or negedge rst )begin
     if (~rst) begin
     q_e<=0;   
    end
    else begin
      q_e<=data;  
    end
end


endmodule //8_bit_dff

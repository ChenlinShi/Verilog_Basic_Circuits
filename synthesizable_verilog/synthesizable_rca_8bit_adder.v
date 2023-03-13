module eight_bit_adder (
 a,
 b,
 cin,
 cout_r,
 sum_r,
 clk,
 rst
);
input [7:0]a,b;
input cin,clk,rst;
output  reg cout_r;
output   reg [7:0]sum_r;
wire [6:0]bit_carry;
reg cin_r;
wire cout;
wire [7:0] sum;
// wire [7:0] a,b,a_bar,b_bar;

// dff_8 d0(
//     a,a_bar,a,clk,rst
// );
// dff_8 d1(
//     b,b_bar,b,clk,rst
// );

ADD_full u0(bit_carry[0],sum[0],a[0],b[0],cin_r);
ADD_full u1(bit_carry[1],sum[1],a[1],b[1],bit_carry[0]);
ADD_full u2(bit_carry[2],sum[2],a[2],b[2],bit_carry[1]);
ADD_full u3(bit_carry[3],sum[3],a[3],b[3],bit_carry[2]);
ADD_full u4(bit_carry[4],sum[4],a[4],b[4],bit_carry[3]);
ADD_full u5(bit_carry[5],sum[5],a[5],b[5],bit_carry[4]);
ADD_full u6(bit_carry[6],sum[6],a[6],b[6],bit_carry[5]);
ADD_full u7(cout,sum[7],a[7],b[7],bit_carry[6]);

always @(posedge clk or negedge rst) begin
    if (~rst)begin
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

endmodule //8_bit_adder

// module ADD_half_nogate(output cout,sum, input a,b);


// assign      sum=a^b;
// assign     cout=a&&b;


// endmodule

module ADD_full(output c_out,sum, input a,b,cin);
// wire w1, w2, w3;

assign sum=a^b^cin;

assign c_out=(a&b)|(cin&(a^b));
    
endmodule



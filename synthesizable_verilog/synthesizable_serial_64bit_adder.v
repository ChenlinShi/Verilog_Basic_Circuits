module serial_adder_64bit (
    a,b,cin,cout,sum,clk,rst
);
input [63:0]a,b;
input cin,clk,rst;
output reg cout_r;
output reg [63:0]sum_r;
wire   cout;
wire    [63:0]sum;
wire [6:0] bit_carry;

serial_8_bit_adder u0(a[7:0],b[7:0],cin,bit_carry[0],sum[7:0]);
serial_8_bit_adder u1(a[15:8],b[15:8],bit_carry[0],bit_carry[1],sum[15:8]);
serial_8_bit_adder u2(a[23:16],b[23:16],bit_carry[1],bit_carry[2],sum[23:16]);
serial_8_bit_adder u3(a[31:24],b[31:24],bit_carry[2],bit_carry[3],sum[31:24]);
serial_8_bit_adder u4(a[39:32],b[39:32],bit_carry[3],bit_carry[4],sum[39:32]);
serial_8_bit_adder u5(a[47:40],b[47:40],bit_carry[4],bit_carry[5],sum[47:40]);
serial_8_bit_adder u6(a[55:48],b[55:48],bit_carry[5],bit_carry[6],sum[55:48]);
serial_8_bit_adder u7(a[63:56],b[63:56],bit_carry[6],cout,sum[63:56]);

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        sum_r<=0;
        cout_r<=0;
    end
    else begin
        sum_r<=sum;
        cout_r<=cout;
end

endmodule //serial_adder_64bit


module serial_8_bit_adder (
 a,
 b,
 cin,
 cout,
 sum
);
input [7:0]a,b;
input cin;
output  cout;
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

endmodule //8_bit_adder

module ADD_full(output c_out,sum, input a,b,cin);
// wire w1, w2, w3;

assign sum=a^b^cin;

assign c_out=(a&b)|(cin&(a^b));
    
endmodule
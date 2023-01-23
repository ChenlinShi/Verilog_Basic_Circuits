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
output  reg cout;
output  reg [7:0]sum;
reg [6:0]bit_carry;
always@(posedge clk or negedge rst) begin
    if (~rst) begin
    cout<=0;
    sum<=0;
    end
    else begin
    {bit_carry[0],sum[0]}<=a[0]+b[0]+cin;
    {bit_carry[1],sum[1]}<=a[1]+b[1]+bit_carry[0];
    {bit_carry[2],sum[2]}<=a[2]+b[2]+bit_carry[1];
    {bit_carry[3],sum[3]}<=a[3]+b[3]+bit_carry[2];
    {bit_carry[4],sum[4]}<=a[4]+b[4]+bit_carry[3];
    {bit_carry[5],sum[5]}<=a[5]+b[5]+bit_carry[4];
    {bit_carry[6],sum[6]}<=a[6]+b[6]+bit_carry[5];
    {cout,sum[7]}<=a[7]+b[7]+bit_carry[6];
    end
end
endmodule //8_bit_adder


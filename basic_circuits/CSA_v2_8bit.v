module CSA_8bit (
    a,b,cin,sum,cout,clk,rst
);
input [7:0] a,b;
output reg [7:0] sum;
input cin;
input clk,rst;
output reg cout;

wire [7:0]c1,c2;

wire [7:0]s1,s2;

ADD_full add1(c1[0],s1[0],a[0],b[0],cin);//first bit of sum and carry
ADD_full add2(c1[1],s1[1],a[1],b[1],1'b0); // 2nd carry
ADD_full add3(c1[2],s1[2],a[2],b[2],1'b0);  // 3rd carry
ADD_full add4(c1[3],s1[3],a[3],b[3],1'b0);  // 4th carry
ADD_full add5(c1[4],s1[4],a[4],b[4],1'b0);  // 5th carry
ADD_full add6(c1[5],s1[5],a[5],b[5],1'b0);  // 6th carry
ADD_full add7(c1[6],s1[6],a[6],b[6],1'b0);  // 7th carry
ADD_full add8(c1[7],s1[7],a[7],b[7],1'b0);  // 8th carry

ADD_full add9(c2[0],s2[1],s1[1],c1[0],1'b0); // 2nd sum
ADD_full add10(c2[1],s2[2],s1[2],c1[1],c2[0]); // 3rd sum
ADD_full add11(c2[2],s2[3],s1[3],c1[2],c2[1]); // 4th sum
ADD_full add12(c2[3],s2[4],s1[4],c1[3],c2[2]); // 5th sum
ADD_full add13(c2[4],s2[5],s1[5],c1[4],c2[3]); // 6th sum
ADD_full add14(c2[5],s2[6],s1[6],c1[5],c2[4]); // 7th sum
ADD_full add15(c2[6],s2[7],s1[7],c1[6],c2[5]); // 8th sum

assign s2[0]=s1[0];

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        sum<=8'b0;
        cout<=1'b0;
    end
    else begin
        sum<=s2;
        cout<=c2[6]|c1[7];
end
end
endmodule //CSA_8bit





module ADD_full(output c_out,sum, input a,b,cin);
// wire w1, w2, w3;

assign sum=a^b^cin;

assign c_out=(a&b)|(cin&(a^b));
   
endmodule
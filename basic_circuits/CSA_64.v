module CSA_64 (
    a,b,cin,sum,cout,clk,rst
);

input [63:0] a,b;
output reg [63:0] sum;
input cin;
input clk,rst;
output reg cout;
wire [63:0] s1;
wire [63:0] s2;
wire [63:0] c1;
wire [62:0] c2;

ADD_full add1(c1[0],s1[0],a[0],b[0],cin);//first bit of sum and carry

sum_and_carry_l1 scl1_1 (a[8:1],b[8:1],s1[8:1],c1[8:1]);
sum_and_carry_l1 scl1_2 (a[16:9],b[16:9],s1[16:9],c1[16:9]);
sum_and_carry_l1 scl1_3 (a[24:17],b[24:17],s1[24:17],c1[24:17]);
sum_and_carry_l1 scl1_4 (a[32:25],b[32:25],s1[32:25],c1[32:25]);
sum_and_carry_l1 scl1_5 (a[40:33],b[40:33],s1[40:33],c1[40:33]);
sum_and_carry_l1 scl1_6 (a[48:41],b[48:41],s1[48:41],c1[48:41]);
sum_and_carry_l1 scl1_7 (a[56:49],b[56:49],s1[56:49],c1[56:49]);
ADD_full add2(c1[57],s1[57],a[57],b[57],1'b0);  // 8th carry
ADD_full add3(c1[58],s1[58],a[58],b[58],1'b0);  // 9th carry
ADD_full add4(c1[59],s1[59],a[59],b[59],1'b0);  // 10th carry
ADD_full add5(c1[60],s1[60],a[60],b[60],1'b0);  // 11th carry
ADD_full add6(c1[61],s1[61],a[61],b[61],1'b0);  // 12th carry
ADD_full add7(c1[62],s1[62],a[62],b[62],1'b0);  // 13th carry
ADD_full add8(c1[63],s1[63],a[63],b[63],1'b0);  // 14th carry

assign s2[0]=s1[0];

ADD_full add9(c2[0],s2[1],s1[1],c1[0],1'b0); // 2nd sum
sum_and_carry_l2 scl2_1 (s1[9:2],c1[8:1],c2[7:0],s2[9:2],c2[8:1]);
sum_and_carry_l2 scl2_2 (s1[17:10],c1[16:9],c2[15:8],s2[17:10],c2[16:9]);
sum_and_carry_l2 scl2_3 (s1[25:18],c1[24:17],c2[23:16],s2[25:18],c2[24:17]);
sum_and_carry_l2 scl2_4 (s1[33:26],c1[32:25],c2[31:24],s2[33:26],c2[32:25]);
sum_and_carry_l2 scl2_5 (s1[41:34],c1[40:33],c2[39:32],s2[41:34],c2[40:33]);
sum_and_carry_l2 scl2_6 (s1[49:42],c1[48:41],c2[47:40],s2[49:42],c2[48:41]);
sum_and_carry_l2 scl2_7 (s1[57:50],c1[56:49],c2[55:48],s2[57:50],c2[56:49]);

ADD_full add10(c2[57],s2[58],s1[58],c1[57],c2[56]);
ADD_full add11(c2[58],s2[59],s1[59],c1[58],c2[57]);
ADD_full add12(c2[59],s2[60],s1[60],c1[59],c2[58]);
ADD_full add13(c2[60],s2[61],s1[61],c1[60],c2[59]);
ADD_full add14(c2[61],s2[62],s1[62],c1[61],c2[60]);
ADD_full add15(c2[62],s2[63],s1[63],c1[62],c2[61]);


always @(posedge clk or negedge rst) begin
    if (!rst) begin
        sum <= 64'b0;
        cout <= 1'b0;
    end
    else begin
        sum <= s2;
        cout <= c2[62];
    end
end

endmodule //CSA_64


module  sum_and_carry_l1(
    a,b,sum,cout
);
input [7:0] a,b;
output  [7:0] sum;
output [7:0]cout;


ADD_full add1(cout[0],sum[0],a[0],b[0],1'b0);//first bit of sum and carry
ADD_full add2(cout[1],sum[1],a[1],b[1],1'b0); // 2nd carry
ADD_full add3(cout[2],sum[2],a[2],b[2],1'b0);  // 3rd carry
ADD_full add4(cout[3],sum[3],a[3],b[3],1'b0);  // 4th carry
ADD_full add5(cout[4],sum[4],a[4],b[4],1'b0);  // 5th carry
ADD_full add6(cout[5],sum[5],a[5],b[5],1'b0);  // 6th carry
ADD_full add7(cout[6],sum[6],a[6],b[6],1'b0);  // 7th carry
ADD_full add8(cout[7],sum[7],a[7],b[7],1'b0);  // 8th carry

endmodule //CSA_8bit

module  sum_and_carry_l2(
    a,b,cin,sum,cout
);
input [7:0] a,b,cin;
output  [7:0] sum;
output [7:0]cout;

ADD_full add1(cout[0],sum[0],a[0],b[0],cin[0]);
ADD_full add2(cout[1],sum[1],a[1],b[1],cin[1]);
ADD_full add3(cout[2],sum[2],a[2],b[2],cin[2]);
ADD_full add4(cout[3],sum[3],a[3],b[3],cin[3]);
ADD_full add5(cout[4],sum[4],a[4],b[4],cin[4]);
ADD_full add6(cout[5],sum[5],a[5],b[5],cin[5]);
ADD_full add7(cout[6],sum[6],a[6],b[6],cin[6]);
ADD_full add8(cout[7],sum[7],a[7],b[7],cin[7]);

endmodule //CSA_8bit




module ADD_full(output c_out,sum, input a,b,cin);
// wire w1, w2, w3;

assign sum=a^b^cin;

assign c_out=(a&b)|(cin&(a^b));
   
endmodule
module top_4_64 (
    a,b,cin,sum_r,cout_r,clk,rst
);
input [63:0]a,b;
input cin,clk,rst;
output reg [63:0]sum_r;
output reg cout_r;
reg cin_r;

wire [63:0]sum;
wire cout;

wire [14:0]bit_carry;
CSA_4bit csa (a[3:0],b[3:0],cin_r,sum[3:0],bit_carry[0]);
CSA_4bit csa1 (a[7:4],b[7:4],bit_carry[0],sum[7:4],bit_carry[1]);
CSA_4bit csa2 (a[11:8],b[11:8],bit_carry[1],sum[11:8],bit_carry[2]);
CSA_4bit csa3 (a[15:12],b[15:12],bit_carry[2],sum[15:12],bit_carry[3]);
CSA_4bit csa4 (a[19:16],b[19:16],bit_carry[3],sum[19:16],bit_carry[4]);
CSA_4bit csa5 (a[23:20],b[23:20],bit_carry[4],sum[23:20],bit_carry[5]);
CSA_4bit csa6 (a[27:24],b[27:24],bit_carry[5],sum[27:24],bit_carry[6]);
CSA_4bit csa7 (a[31:28],b[31:28],bit_carry[6],sum[31:28],bit_carry[7]);
CSA_4bit csa8 (a[35:32],b[35:32],bit_carry[7],sum[35:32],bit_carry[8]);
CSA_4bit csa9 (a[39:36],b[39:36],bit_carry[8],sum[39:36],bit_carry[9]);
CSA_4bit csa10 (a[43:40],b[43:40],bit_carry[9],sum[43:40],bit_carry[10]);
CSA_4bit csa11 (a[47:44],b[47:44],bit_carry[10],sum[47:44],bit_carry[11]);
CSA_4bit csa12 (a[51:48],b[51:48],bit_carry[11],sum[51:48],bit_carry[12]);
CSA_4bit csa13 (a[55:52],b[55:52],bit_carry[12],sum[55:52],bit_carry[13]);
CSA_4bit csa14 (a[59:56],b[59:56],bit_carry[13],sum[59:56],bit_carry[14]);
CSA_4bit csa15 (a[63:60],b[63:60],bit_carry[14],sum[63:60],cout);

always @(posedge clk )  begin
    if(rst)
    begin
        sum_r <= 0;
        cout_r <= 1'b0;
        cin_r <= 1'b0;
    end
    else
    begin
        sum_r <= sum;
        cout_r <= cout;
        cin_r <= cin;
    end
end

endmodule

module top_8_64 (
    a,b,cin,sum_r,cout_r,clk,rst
);
input [63:0]a,b;
input cin,clk,rst;
output reg [63:0]sum_r;
output reg cout_r;
reg cin_r;

wire [63:0]sum;
wire cout;
wire [6:0]bit_carry;

CSA_8bit csa (a[7:0],b[7:0],cin_r,sum[7:0],bit_carry[0]);
CSA_8bit csa1 (a[15:8],b[15:8],bit_carry[0],sum[15:8],bit_carry[1]);
CSA_8bit csa2 (a[23:16],b[23:16],bit_carry[1],sum[23:16],bit_carry[2]);
CSA_8bit csa3 (a[31:24],b[31:24],bit_carry[2],sum[31:24],bit_carry[3]);
CSA_8bit csa4 (a[39:32],b[39:32],bit_carry[3],sum[39:32],bit_carry[4]);
CSA_8bit csa5 (a[47:40],b[47:40],bit_carry[4],sum[47:40],bit_carry[5]);
CSA_8bit csa6 (a[55:48],b[55:48],bit_carry[5],sum[55:48],bit_carry[6]);
CSA_8bit csa7 (a[63:56],b[63:56],bit_carry[6],sum[63:56],cout);

always @(posedge clk )  begin
    if(rst)
    begin
        sum_r <= 64'b0;
        cout_r <= 1'b0;
        cin_r <= 1'b0;
    end
    else
    begin
        sum_r <= sum;
        cout_r <= cout;
        cin_r <= cin;
    end
end

endmodule

module top_16_64 (
    a,b,cin,sum_r,cout_r,clk,rst
);
input [63:0]a,b;
input cin,clk,rst;
output reg [63:0]sum_r;
output reg cout_r;
reg cin_r;

wire [63:0]sum;
wire cout;
wire [2:0]bit_carry;

CSA_16bit csa (a[15:0],b[15:0],cin_r,sum[15:0],bit_carry[0]);
CSA_16bit csa1 (a[31:16],b[31:16],bit_carry[0],sum[31:16],bit_carry[1]);
CSA_16bit csa2 (a[47:32],b[47:32],bit_carry[1],sum[47:32],bit_carry[2]);
CSA_16bit csa3 (a[63:48],b[63:48],bit_carry[2],sum[63:48],cout);

always @(posedge clk )  begin
    if(rst)
    begin
        sum_r <= 64'b0;
        cout_r <= 1'b0;
        cin_r <= 1'b0;
    end
    else
    begin
        sum_r <= sum;
        cout_r <= cout;
        cin_r <= cin;
    end
end
endmodule

module CSA_16bit (
    a,b,cin,sum,cout
);
input [15:0] a,b;
output [15:0] sum;
input cin;
output cout;

wire [15:0]c1;
wire [14:0]c2;
wire [15:0]s1,s2;

ADD_full add1(c1[0],s1[0],a[0],b[0],cin);//first bit of sum and carry
ADD_full add2(c1[1],s1[1],a[1],b[1],1'b0); // 2nd carry
ADD_full add3(c1[2],s1[2],a[2],b[2],1'b0);  // 3rd carry
ADD_full add4(c1[3],s1[3],a[3],b[3],1'b0);  // 4th carry
ADD_full add5(c1[4],s1[4],a[4],b[4],1'b0);  // 5th carry
ADD_full add6(c1[5],s1[5],a[5],b[5],1'b0);  // 6th carry
ADD_full add7(c1[6],s1[6],a[6],b[6],1'b0);  // 7th carry
ADD_full add8(c1[7],s1[7],a[7],b[7],1'b0);  // 8th carry
ADD_full add9(c1[8],s1[8],a[8],b[8],1'b0);  // 9th carry
ADD_full add10(c1[9],s1[9],a[9],b[9],1'b0);  // 10th carry
ADD_full add11(c1[10],s1[10],a[10],b[10],1'b0);  // 11th carry
ADD_full add12(c1[11],s1[11],a[11],b[11],1'b0);  // 12th carry
ADD_full add13(c1[12],s1[12],a[12],b[12],1'b0);  // 13th carry
ADD_full add14(c1[13],s1[13],a[13],b[13],1'b0);  // 14th carry
ADD_full add15(c1[14],s1[14],a[14],b[14],1'b0);  // 15th carry
ADD_full add16(c1[15],s1[15],a[15],b[15],1'b0);  // 16th carry

ADD_full add17(c2[0],s2[1],s1[1],c1[0],1'b0); // 2nd sum
ADD_full add18(c2[1],s2[2],s1[2],c1[1],c2[0]); // 3rd sum
ADD_full add19(c2[2],s2[3],s1[3],c1[2],c2[1]); // 4th sum
ADD_full add20(c2[3],s2[4],s1[4],c1[3],c2[2]); // 5th sum
ADD_full add21(c2[4],s2[5],s1[5],c1[4],c2[3]); // 6th sum
ADD_full add22(c2[5],s2[6],s1[6],c1[5],c2[4]); // 7th sum
ADD_full add23(c2[6],s2[7],s1[7],c1[6],c2[5]); // 8th sum
ADD_full add24(c2[7],s2[8],s1[8],c1[7],c2[6]); // 9th sum
ADD_full add25(c2[8],s2[9],s1[9],c1[8],c2[7]); // 10th sum
ADD_full add26(c2[9],s2[10],s1[10],c1[9],c2[8]); // 11th sum
ADD_full add27(c2[10],s2[11],s1[11],c1[10],c2[9]); // 12th sum
ADD_full add28(c2[11],s2[12],s1[12],c1[11],c2[10]); // 13th sum
ADD_full add29(c2[12],s2[13],s1[13],c1[12],c2[11]); // 14th sum
ADD_full add30(c2[13],s2[14],s1[14],c1[13],c2[12]); // 15th sum
ADD_full add31(c2[14],s2[15],s1[15],c1[14],c2[13]); // 16th sum

assign s2[0]=s1[0];
assign sum = s2;
assign cout = c2[14]|c1[15];
endmodule

module CSA_8bit (
    a,b,cin,sum,cout
);
input [7:0] a,b;
output [7:0] sum;
input cin;
output cout;

wire [7:0]c1;
wire [6:0]c2;

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

assign sum  = s2;
assign cout = c2[6]|c1[7];

endmodule //CSA_8bit


module CSA_4bit (
    a,b,cin,sum,cout
);
input [3:0] a,b;
output [3:0] sum;
input cin;
output cout;

wire [3:0]c1;
wire [2:0]c2;
wire [3:0]s1,s2;

ADD_full add1(c1[0],s1[0],a[0],b[0],cin);//first bit of sum and carry
ADD_full add2(c1[1],s1[1],a[1],b[1],1'b0); // 2nd carry
ADD_full add3(c1[2],s1[2],a[2],b[2],1'b0);  // 3rd carry
ADD_full add4(c1[3],s1[3],a[3],b[3],1'b0);  // 4th carry

ADD_full add9(c2[0],s2[1],s1[1],c1[0],1'b0); // 2nd sum
ADD_full add10(c2[1],s2[2],s1[2],c1[1],c2[0]); // 3rd sum
ADD_full add11(c2[2],s2[3],s1[3],c1[2],c2[1]); // 4th sum

assign s2[0]=s1[0];
assign sum = s2;
assign cout = c2[2]|c1[3];

endmodule

module ADD_full(output c_out,sum, input a,b,cin);
// wire w1, w2, w3;

assign sum=a^b^cin;

assign c_out=(a&b)|(cin&(a^b));
   
endmodule
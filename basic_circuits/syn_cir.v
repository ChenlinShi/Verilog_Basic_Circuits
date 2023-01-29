`include "/home/shi/verilog/pipelineadder.v"
`include "/home/shi/verilog/8_bit_adder.v"

module syn_cir (clk1,clk2,a,b,c,d,cin,rst,cout,sum    
);
output  cout;
output [7:0] sum;
input  clk1,clk2,cin,rst;
input [7:0] a,b,c,d;

wire [7:0] sum1,sum2;
wire cout1,cout2;

pipeline_8bit_adder m1(clk1,rst,a,b,cin,cout1,sum1);
pipeline_8bit_adder m2(clk1,rst,c,d,cin,cout2,sum2);
eight_bit_adder m3(sum1,sum2,cin,cout,sum,clk2,rst);



endmodule //syn_cir



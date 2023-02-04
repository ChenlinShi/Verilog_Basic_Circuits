module pipeline_8_bit_multiplier (
clk,rstn,a,b,out
);
input clk,rstn;
input [7:0] a,b;
output  [15:0]out;

//first stage
reg [15:0] mul_result_0;
reg [15:0] mul_result_1;
reg [15:0] mul_result_2;
reg [15:0] mul_result_3;
reg [15:0] mul_result_4;
reg [15:0] mul_result_5;
reg [15:0] mul_result_6;
reg [15:0] mul_result_7;

//second stage
reg [15:0] add_result_0_1;
reg [15:0] add_result_2_3;
reg [15:0] add_result_4_5;
reg [15:0] add_result_6_7;

// third stage
reg [15:0] add_result_0_1_2_3;
reg [15:0] add_result_4_5_6_7;



always @(posedge clk or negedge rstn) begin
    if(~rstn)begin
       mul_result_0<=0;
       mul_result_1<=0;
       mul_result_2<=0;
       mul_result_3<=0;
       mul_result_4<=0;
       mul_result_5<=0;
       mul_result_6<=0;
       mul_result_7<=0;
       add_result_0_1<=0;
       add_result_2_3<=0;
       add_result_4_5<=0;
       add_result_6_7<=0;
       add_result_0_1_2_3<=0;
       add_result_4_5_6_7<=0;
    end
    else begin
        // first stage
       mul_result_0<= (a[0])?b:0;
       mul_result_1<= (a[1])?{b,1'b0}:0;
       mul_result_2<= (a[2])?{b,2'b0}:0;
       mul_result_3<= (a[3])?{b,3'b0}:0;
       mul_result_4<= (a[4])?{b,4'b0}:0;
       mul_result_5<= (a[5])?{b,5'b0}:0;
       mul_result_6<= (a[6])?{b,6'b0}:0;
       mul_result_7<= (a[7])?{b,7'b0}:0;
        // second stage
       add_result_0_1<=mul_result_0+mul_result_1;
       add_result_2_3<=mul_result_2+mul_result_3;
       add_result_4_5<=mul_result_4+mul_result_5;
       add_result_6_7<=mul_result_6+mul_result_7;
        // third  stage 
       add_result_0_1_2_3<=add_result_0_1+add_result_2_3;
       add_result_4_5_6_7<=add_result_4_5+add_result_6_7;
    end
end


assign out = add_result_0_1_2_3+add_result_4_5_6_7;


endmodule //pipeline_8_bit_multiplier
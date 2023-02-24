module pipeline_8bit_adder (enable,rst,a,b,cin,cout,sum);

input [7:0] a,b;
output reg[7:0] sum;
output reg cout;
input cin,rst,enable;
reg[3:0] temp_a;
reg[3:0] temp_b;

reg temp_cin;
reg[3:0]low_bit_sum;
reg[3:0]high_bit_sum;
always @(posedge enable  or negedge rst) begin
    if (~rst) begin
     sum<=0;
     cout<=0;   
    end
    else begin
    {temp_cin,low_bit_sum}<=a[3:0]+b[3:0]+cin; 
    temp_a <= a[7:4];
    temp_b <= b[7:4];
    // {cout,sum[7:4]}<=temp_a+temp_b+temp_cin;
    // {cout,high_bit_sum}<=temp_a+temp_b+temp_cin;
    // sum[3:0]<=low_bit_sum; 
    end
end
always @( posedge  enable or negedge rst) begin
    if (~rst) begin
     sum<=0;
     cout<=0;   
    end
    else begin
    {cout,sum[7:4]}<=temp_a+temp_b+temp_cin;
    {cout,high_bit_sum}<=temp_a+temp_b+temp_cin;
    sum[3:0]<=low_bit_sum; 
    end
end

endmodule
module regfile_v2 (
 rs,rt,rd,input_data,write,rs_data,rt_data,rst,clk
);

input [4:0]rs,rt,rd;
input [31:0]input_data;

input write,rst,clk;
integer i;
output [31:0]rs_data, rt_data;
reg [31:0] regarray [31:0];
assign rs_data=regarray[rs];
assign rt_data=regarray[rt];

always @(posedge clk) begin

    if(~rst)begin
        for ( i=0 ;i<32 ;i++ ) begin
            regarray[i]=0;
        end
    end
    else  if(write) begin
    regarray[rd]<= input_data;
    end 
    end



endmodule //regfile_v2
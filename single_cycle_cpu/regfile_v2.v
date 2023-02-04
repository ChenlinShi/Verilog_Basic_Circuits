module regfile_v2 (
 rs,rt,rd,input_data,write,rs_data,rt_data,rst,clk,write_finish
);

input [4:0]rs,rt,rd;
input [31:0]input_data;

input write,rst,clk;
integer i;
output [31:0]rs_data, rt_data;
output reg write_finish;
reg [31:0] regarray [31:0];
assign rs_data=regarray[rs];
assign rt_data=regarray[rt];

always @(*) begin
always @(*) begin

    if(~rst)begin
        for ( i=0 ;i<32 ;i=i+1 ) begin
            regarray[i]<=0;
        end
        write_finish<=0;
    end
    else  if(write) begin
    regarray[rd]<= input_data;
    write_finish<=1;
    end 
    else begin
      write_finish<=0;
    end
    end

endmodule //regfile_v2

module regfile (
    rs,rt,rd,input_data,clk,rst,write,rs_data,rt_data
);

input [4:0] rs,rt,rd;
input clk, rst;
// input  rst;
input write;
input [31:0]input_data;
output reg [31:0]rs_data,rt_data;
reg[31:0] regarray [31:0] ;
integer i;

always @(posedge clk or negedge rst) begin
// always @(*) begin
    if(~rst)begin
        for ( i=0 ;i<32 ;i++ ) begin
            regarray[i]<=0;
        end
    end
    else if (write)begin
         regarray[rd]<=input_data;
         rs_data<=regarray[rs];
         rt_data<=regarray[rt];
    end
    else   begin
        rs_data<=regarray[rs];
        rt_data<=regarray[rt];
    end   
end

endmodule //regfile
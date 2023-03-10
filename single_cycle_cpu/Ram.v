module Ram (write, load,ram_addr,clk,output_data,input_data,ram_write_finish
);
input clk, write,load;
input [31:0] ram_addr,input_data;
output [31:0] output_data;
output reg ram_write_finish;
reg [31:0] ram [255:0];

assign output_data=(load)?ram[ram_addr]:32'hzzzz;

always @(*) begin
    if (write) begin
        ram[ram_addr]<=input_data;
        ram_write_finish<=1;
    end
end


endmodule //data_mem

module Ram (write, read,ram_addr,clk,output_data,input_data
);
input clk, write,read;
input [31:0] ram_addr,input_data;
output [31:0] output_data;
reg [31:0] ram [255:0];

assign output_data=(read)?ram[ram_addr]:32'hzzzz;

always @(posedge clk) begin
    if (write) begin
        ram[ram_addr]<=input_data;
    end
end


endmodule //data_mem
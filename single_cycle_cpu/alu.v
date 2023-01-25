module alu (
    a,b,alu_func,data_out // This is derived from https://github.com/freemso/cpu-verilog/blob/master/cpu/cpu.srcs/sources_1/new/cpu.v
);

input [31:0] a,b;
input [2:0]  alu_func;
output reg [31:0] data_out;

always@(*) begin
    case (alu_func)
    3'b001 : data_out<=a+b;
    3'b010 : data_out<=a-b;
    3'b011 : data_out<=a&b;
    3'b100 : data_out<=a|b;
    3'b101 : data_out<=(a[31]==b[31])?(a<b):(a[31]==1);
    default: data_out<=0;
    endcase
end

endmodule //alu
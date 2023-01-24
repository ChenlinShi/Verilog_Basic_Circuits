`include "./RCA_32.v"

module program_counter_add (current_addr_pc,next_addr_pc
);
input [31:0] current_addr_pc;
output [31:0] next_addr_pc;

wire [31:0] b;

wire cin;

assign cin=0; //in this function, cin is useless.
assign b=1; 
assign cout=0; //cout is forever zero.

RCA_32_bit_comb pc_adder(current_addr_pc,b,cin,cout,next_addr_pc);

endmodule //program_counter_add
`include "./RCA_32.v"
module program_counter_next_addr (current_addr_pc,next_addr_pc,jump_offset,jump
);
input [31:0] current_addr_pc;

input [15:0]jump_offset;
input jump;
output [31:0] next_addr_pc;

wire [31:0] tmp_jump_offset,tmp_next_addr;
wire [31:0] b;
wire cin;
wire [31:0]shift_jump;
ext ext_for_jump (jump_offset,tmp_jump_offset);

assign shift_jump={tmp_jump_offset[29:0],2'b0};
assign cin=0; //in this function, cin is useless.

assign b=1;

assign cout=0; //cout is forever zero.

RCA_32_bit_comb pc_adder(current_addr_pc,b,cin,cout,tmp_next_addr);

assign next_addr_pc=(jump)?shift_jump:tmp_next_addr; // jump or next

endmodule //program_counter_add
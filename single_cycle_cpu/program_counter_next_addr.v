`include "./RCA_32.v"
`include "ext.v"
module program_counter_next_addr (current_addr_pc,next_addr_pc,jump_offset
);
input [31:0] current_addr_pc;

input [15:0]jump_offset;

output [31:0] next_addr_pc;

wire [31:0] tmp_jump_offset;
wire [31:0] b;
wire cin;
wire [31:0] jump_value,tmp_jump_value;
ext ext_for_jump (jump_offset,tmp_jump_offset);


assign cin=0; //in this function, cin is useless.
assign tmp_jump_value=tmp_jump_offset+1; //will be used if jump_offset >0;
assign jump_value=(tmp_jump_offset[31])?tmp_jump_offset:tmp_jump_value; // if jump_offset <0 , use original data , otherwise use tmp_jump_value

assign b=(jump_offset)?jump_value:1 ; 

assign cout=0; //cout is forever zero.

RCA_32_bit_comb pc_adder(current_addr_pc,b,cin,cout,next_addr_pc);

// assign next_addr_pc= b + current_addr_pc;

endmodule //program_counter_add
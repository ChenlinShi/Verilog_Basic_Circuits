//Use this file for instruction memory, derived from https://github.com/freemso/cpu-verilog/blob/master/cpu/cpu.srcs/sources_1/new/cpu.v

module Instruction_mem(
    // input rst,
    input [31:0] current_addr_pc,
    output [31:0] inst
    );
    
      wire [31:0] inst_mem [15:0]; // 32 bit for single instruction, 16 instructions is maximum for this memory.
      assign   inst_mem[0 ] = {6'b001000,5'd0,5'd1,16'd1};// addi, rs=0, rd=1, imm=1          => R[1]=1
      assign   inst_mem[1 ] = {6'b000000,5'd0,5'd1,5'd2,5'd0,6'b100000}; // add, rs=0, rt=1, rd=2            => R[2]=1
      assign   inst_mem[2 ] = {6'b000000,5'd0,5'd1,5'd3,5'd0,6'b100010}; // sub, rs=0, rt=1, rd=3            => R[3]=-1
      assign   inst_mem[3 ] = {6'b001101,5'd1,5'd4,16'd2};   // ori, rs=1, rt=4, imm=2           => R[4]=3
      assign   inst_mem[4 ] = {6'b001100,5'd1,5'd5,16'd1};// andi, rs=1, rt=5, imm=1          => R[5]=1
      assign   inst_mem[5 ] = {6'b000000,5'd1,5'd4,5'd6,5'd0,6'b100101}; // or, rs=1, rt=4, rd=6             => R[6]=3
      assign   inst_mem[6 ] = {6'b000000,5'd1,5'd4,5'd7,5'd0,6'b100100};// and, rs=1, rt=4, rd=7            => R[7]=1
      assign   inst_mem[7 ] = {6'b000000,5'd4,5'd1,5'd8,5'd0,6'b101010};// slt, rs=4, rt=1, rd=8            => R[8]=0
      assign   inst_mem[8 ] = {6'b001010,5'd3,5'd9,16'd1};// slti, rs=3, rt=9, imm=1          => R[9]=1
      assign   inst_mem[9 ] = {6'b101011,5'd1,5'd4,16'd1};// sw, base=D[1], rt=4, offset=1    => Data[2]=3
      assign   inst_mem[10] = {6'b000010,26'd3};  // j, address=3 << 2=12
      assign   inst_mem[11] = {6'b000000,5'd0,5'd1,5'd11,5'd0,6'b100000};// add, rs=0, rt=1, rd=11           => R[11]=1 will not execute
      assign   inst_mem[12] = {6'b100011,5'd1,5'd10,16'd1};// lw, base=D[1], rt=10, offset=1   => R[10]=3
      assign   inst_mem[13] = {32'h00000000};// nothing  1
      assign   inst_mem[14] = {32'h00000000};// nothing  2
      assign   inst_mem[15] = {32'h00000000};// nothing  3
      assign   inst = inst_mem[current_addr_pc]; 

endmodule



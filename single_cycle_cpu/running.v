`include "control_unit.v"
`include "program_counter.v"
`include "program_counter_next_addr.v"
`include "Instruction_mem.v"
`include "alu.v"
`include "regfile.v"
`include "regfile_v2.v"
`include "Ram.v"
module running (
clk,rst
);
input clk ,rst;
wire [31:0] a,b;
wire [31:0] data_out,rs_data,rt_data;//alu result
wire [31:0] inst; 
reg [31:0]current_addr_pc;
reg [31:0] instruction;
wire [31:0] ram_addr; 
wire [15:0] jump_offset;
wire jump,signal_extension,ram_load,ram_write;
wire [31:0]imm;
wire [2:0]alu_func;
wire [31:0] results_addr,next_addr_pc;
wire [4:0] rs,rt,rd;
wire [4:0]tmp_rd;
wire write;
wire [31:0]data_tmp;
wire [31:0]output_data;
program_counter pc (current_addr_pc,results_addr, clk,rst);
Instruction_mem inst_mem( results_addr,inst );
control_unit cu1 (inst, jump,alu_func, rs,rt,rd,imm,ram_load,ram_write,signal_extension, ram_addr,jump_offset);

assign write = (alu_func||ram_load)?1:0;
assign tmp_rd = (signal_extension||ram_load)?rt:rd;
regfile_v2 regfile (rs,rt,tmp_rd,data_out,write,rs_data,rt_data,rst,clk);

alu alu (a,b,alu_func,data_tmp);// need be judged between ram output. loadword or alu  

assign data_out=(ram_load)?output_data:data_tmp;//if load word chose ram data, or alu output
assign a=rs_data;
assign b=(signal_extension)?imm:rt_data;//imm or rt value

Ram ram (ram_write, ram_load,ram_addr,clk,output_data,rt_data);

program_counter_next_addr pcna (results_addr,next_addr_pc,jump_offset,jump);

always@(*)begin
    if(next_addr_pc)begin
        current_addr_pc <= next_addr_pc;
    end
end


endmodule //running
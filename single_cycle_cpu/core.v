`include "control_unit.v"
`include "program_counter.v"
`include "program_counter_next_addr.v"
`include "Instruction_mem.v"
`include "alu.v"

`include "regfile_v2.v"
`include "Ram.v"
module core (
clk,rst,write_finish,ram_write_finish,jump,data_out,inst
);
input clk ,rst;
output write_finish, ram_write_finish,jump;
output [31:0]data_out,inst;
wire [31:0] a,b;
wire [31:0] rs_data,rt_data;//alu result //move data_out from here to output
// wire [31:0] inst; 
reg [31:0]current_addr_pc;
reg [31:0] instruction;
wire [31:0] ram_addr; 
wire [15:0] jump_offset;
wire signal_extension,ram_load,ram_write;//move jump from here to output
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
regfile_v2 regfile (rs,rt,tmp_rd,data_out,write,rs_data,rt_data,rst,clk,write_finish);

alu alu (a,b,alu_func,data_tmp);// need be judged between ram output. loadword or alu  

assign data_out=(ram_load)?output_data:data_tmp;//if load word , chose ram data, or alu output
assign a=rs_data;
assign b=(signal_extension)?imm:rt_data;//imm or rt value

Ram ram (ram_write, ram_load,ram_addr,clk,output_data,rt_data,ram_write_finish);

program_counter_next_addr pcna (results_addr,next_addr_pc,jump_offset,jump);

always@(*)begin
    if(next_addr_pc)begin
        current_addr_pc <= next_addr_pc;
    end
end


endmodule //running

// module control_unit (
//  instruction, 
//  jump,
//  alu_func,
//  rs,rt,rd,imm,
//  ram_load,
//  ram_write,
//  signal_extension,
//  ram_addr,
//  jump_offset
// //  regload
// );
// input [31:0] instruction;
// output reg [31:0]ram_addr; 
// output reg [15:0] jump_offset;
// output jump,signal_extension,ram_load,ram_write;
// // output reg regload;
// output reg [31:0]imm;
// output [2:0]alu_func;

// // todo : rs rt rd  ram_addr, 

// output reg [4:0] rs,rt,rd;
// wire [3:0] case_test;
// wire [31:0] temp_imm;
// wire [2:0]tmp;



// assign case_test={ram_load,ram_write,jump,signal_extension};
// decoder dec(instruction[31:26],instruction[3:0],tmp,ram_load,ram_write,jump,signal_extension);
// ext ext_for_control_unit (instruction[15:0],temp_imm);
// // when ram_load or ram_write is true, assign ram_addr ,rt
// // when signal_extension is ture, assign imm,rs rt 
// // when jump is true, assign jump
// assign alu_func=(instruction)?tmp:0;
// always @(*) begin
//    jump_offset<= 0 ; 
//       //  regload<= 1 ;//always need get data from REGFILE
//            rs <= 0 ;
//            rt <= 0 ;
//            rd <= 0 ;// Other values do not affect the running
//   if( alu_func && ~signal_extension) begin
//      rs <= instruction[25:21];
//      rt <= instruction[20:16];
//      rd <= instruction[15:11];
//     //  regload<=1;
//   end
//   else begin
//     case (case_test)
//     4'b1000     :  {ram_addr,rt}<={{27'd0,instruction[25:21]}+{16'd0,instruction[15:0]},instruction[20:16]};// make ram addr 32bit, and then plus offset 
//     4'b0100     :  {ram_addr,rt}<={{27'd0,instruction[25:21]}+{16'd0,instruction[15:0]},instruction[20:16]};// make ram addr 32bit, and then plus offset 
//     4'b0010     :   jump_offset <= instruction[15:0];                                                       // jump addr offset 
//     4'b0001     :  {rs,rt,imm}  <={instruction[25:21],instruction[20:16],temp_imm}    ;                      // set rs rt and 32bit imm 
//     endcase
// end       
    
// end

//To do 

// endmodule //control_unit
// module program_counter (
//     current_addr_pc,results_addr, clk,rst
// );
// input   [31:0] current_addr_pc;
// input clk, rst;
// output reg [31:0]results_addr;  //cannot use current_addr as a output.
// // always @(posedge clk or posedge rst) begin
// always @(posedge clk or negedge rst) begin

//     if (~rst) begin
//       results_addr<=0; // reset.
//     end
//     else begin
//         results_addr <=current_addr_pc; //output the instruction address.
//     end
// end

// endmodule //program_counter
// module decoder (
//     op,func,alu_func,ram_load,ram_write,jump,imm_enable
// );
// input [5:0]op;
// input [3:0]func;

// output reg [2:0]alu_func;
// output ram_write,ram_load,jump,imm_enable;
// reg ram_write_true, ram_load_true,jump_true,imm_enable_true;
// wire add,sub,and_op,or_op,slt,addi,andi,ori,slti,lw,sw,jump_op;
// wire alu_op_value;

// wire [6:0]case_test; 
// wire [4:0]r_case_test;

// assign add   =~func[3]&~func[2]&~func[1]&~func[0];//0000
// assign sub   =~func[3]&~func[2]& func[1]&~func[0];//0010
// assign and_op=~func[3]& func[2]&~func[1]&~func[0];//0100
// assign or_op =~func[3]& func[2]&~func[1]& func[0];//0101
// assign slt   = func[3]&~func[2]& func[1]&~func[0];//1010


// assign alu_op_value= ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]; //000000
// assign addi=~op[5]&~op[4]& op[3]&~op[2]&~op[1]&~op[0];//001000
// assign andi=~op[5]&~op[4]& op[3]& op[2]&~op[1]&~op[0];//001100
// assign ori =~op[5]&~op[4]& op[3]& op[2]&~op[1]& op[0];//001101
// assign slti=~op[5]&~op[4]& op[3]&~op[2]& op[1]&~op[0];//001010
// assign sw  = op[5]&~op[4]& op[3]&~op[2]& op[1]& op[0];//101011
// assign lw  = op[5]&~op[4]&~op[3]&~op[2]& op[1]& op[0];//100011
// assign jump_op  = ~op[5]&~op[4]&~op[3]&~op[2]&op[1]&~op[0];//000010


// assign r_case_test[4:0]={add,sub,and_op,or_op,slt};//for R type case
// assign case_test[6:0]={addi,andi,ori,slti,sw,lw,jump_op};//for other type case

// always @ (*) begin
//     ram_write_true <=0; // before every new loop, set everyone to zero.
//     jump_true      <=0; // before every new loop, set everyone to zero.
//     ram_load_true  <=0; // before every new loop, set everyone to zero.
//     alu_func       <=0; // before every new loop, set everyone to zero.
//     imm_enable_true<=0; // before every new loop, set everyone to zero.
//     if(alu_op_value)begin
//         case (r_case_test)
//         5'b10000  : alu_func <=3'b001 ;
//         5'b01000  : alu_func <=3'b010 ;
//         5'b00100  : alu_func <=3'b011 ;
//         5'b00010  : alu_func <=3'b100 ;
//         5'b00001  : alu_func <=3'b101 ;
//         endcase
//     end
//         else if(case_test[6:3]) begin
//         imm_enable_true     <=1;
//         case (case_test)
//         7'b1000000  : alu_func <=3'b001 ;
//         7'b0100000  : alu_func <=3'b011 ;
//         7'b0010000  : alu_func <=3'b100 ;
//         7'b0001000  : alu_func <=3'b101 ;
//         endcase
//     end 
//         else if(case_test[2:0]) begin 
//         case (case_test)
//         7'b0000100  : ram_write_true <=1 ;
//         7'b0000010  : ram_load_true  <=1 ;
//         7'b0000001  : jump_true      <=1 ;
//         endcase
//     end    
// end

// assign ram_load=(ram_load_true)?1:0; 
// assign ram_write=(ram_write_true)?1:0;
// assign jump=(jump_true)?1:0;
// assign imm_enable=(imm_enable_true)?1:0;


// endmodule //decoder
// module program_counter_next_addr (current_addr_pc,next_addr_pc,jump_offset,jump
// );
// input [31:0] current_addr_pc;

// input [15:0]jump_offset;
// input jump;
// output [31:0] next_addr_pc;

// wire [31:0] tmp_jump_offset,tmp_next_addr;
// wire [31:0] b;
// wire cin;
// wire [31:0]shift_jump;
// ext ext_for_jump (jump_offset,tmp_jump_offset);

// assign shift_jump={tmp_jump_offset[29:0],2'b0};
// assign cin=0; //in this function, cin is useless.

// assign b=1;

// assign cout=0; //cout is forever zero.

// RCA_32_bit_comb pc_adder(current_addr_pc,b,cin,cout,tmp_next_addr);

// assign next_addr_pc=(jump)?shift_jump:tmp_next_addr; // jump or next

// endmodule //program_counter_add

// module RCA_32_bit_comb(
// a,b,cin,cout,sum
// );
// input [31:0]a,b;
// output [31:0]sum;
// input cin;
// output cout;
// wire [2:0] bit_carry; 
// no_clk_8_bit_adder u0(a[7:0],b[7:0],cin,bit_carry[0],sum[7:0]);
// no_clk_8_bit_adder u1(a[15:8],b[15:8],bit_carry[0],bit_carry[1],sum[15:8]);
// no_clk_8_bit_adder u2(a[23:16],b[23:16],bit_carry[1],bit_carry[2],sum[23:16]);
// no_clk_8_bit_adder u3(a[31:24],b[31:24],bit_carry[2],cout,sum[31:24]);

// endmodule

// module no_clk_8_bit_adder (
//  a,
//  b,
//  cin,
//  cout,
//  sum
// );
// input [7:0]a,b;
// input cin;
// output   cout;
// output   [7:0]sum;
// wire [6:0]bit_carry;

// ADD_full u0(bit_carry[0],sum[0],a[0],b[0],cin);
// ADD_full u1(bit_carry[1],sum[1],a[1],b[1],bit_carry[0]);
// ADD_full u2(bit_carry[2],sum[2],a[2],b[2],bit_carry[1]);
// ADD_full u3(bit_carry[3],sum[3],a[3],b[3],bit_carry[2]);
// ADD_full u4(bit_carry[4],sum[4],a[4],b[4],bit_carry[3]);
// ADD_full u5(bit_carry[5],sum[5],a[5],b[5],bit_carry[4]);
// ADD_full u6(bit_carry[6],sum[6],a[6],b[6],bit_carry[5]);
// ADD_full u7(cout,sum[7],a[7],b[7],bit_carry[6]);

// endmodule 


// module ADD_half_nogate(output cout,sum, input a,b);


// assign      sum=a^b;
// assign     cout=a&&b;


// endmodule


// module ADD_full(output c_out,sum, input a,b,cin);
// wire w1, w2, w3;

// ADD_half_nogate M1(w2,w1,a,b);
// ADD_half_nogate M2(w3,sum,cin,w1);

// assign c_out=w3||w2;
    
// endmodule
// module alu (
//     a,b,alu_func,data_out // This is derived from https://github.com/freemso/cpu-verilog/blob/master/cpu/cpu.srcs/sources_1/new/cpu.v
// );

// input [31:0] a,b;
// input [2:0]  alu_func;
// output reg [31:0] data_out;

// always@(*) begin
//     case (alu_func)
//     3'b001 : data_out<=a+b;
//     3'b010 : data_out<=a-b;
//     3'b011 : data_out<=a&b;
//     3'b100 : data_out<=a|b;
//     3'b101 : data_out<=(a[31]==b[31])?(a<b):(a[31]==1);
//     default: data_out<=0;
//     endcase
// end

// endmodule //alu


// module Instruction_mem(
//     // input rst,
//     input [31:0] current_addr_pc,
//     output [31:0] inst
//     );
    
//       wire [31:0] inst_mem [15:0]; // 32 bit for single instruction, 16 instructions is maximum for this memory.
//       assign   inst_mem[0 ] = {6'b001000,5'd0,5'd1,16'd1};// addi, rs=0, rt=1, imm=1          => R[1]=1
//       assign   inst_mem[1 ] = {6'b000000,5'd0,5'd1,5'd2,5'd0,6'b100000}; // add, rs=0, rt=1, rd=2            => R[2]=1
//       assign   inst_mem[2 ] = {6'b000000,5'd0,5'd1,5'd3,5'd0,6'b100010}; // sub, rs=0, rt=1, rd=3            => R[3]=-1
//       assign   inst_mem[3 ] = {6'b001101,5'd1,5'd4,16'd2};   // ori, rs=1, rt=4, imm=2           => R[4]=3
//       assign   inst_mem[4 ] = {6'b001100,5'd1,5'd5,16'd1};// andi, rs=1, rt=5, imm=1          => R[5]=1
//       assign   inst_mem[5 ] = {6'b000000,5'd1,5'd4,5'd6,5'd0,6'b100101}; // or, rs=1, rt=4, rd=6             => R[6]=3
//       assign   inst_mem[6 ] = {6'b000000,5'd1,5'd4,5'd7,5'd0,6'b100100};// and, rs=1, rt=4, rd=7            => R[7]=1
//       assign   inst_mem[7 ] = {6'b000000,5'd4,5'd1,5'd8,5'd0,6'b101010};// slt, rs=4, rt=1, rd=8            => R[8]=0
//       assign   inst_mem[8 ] = {6'b001010,5'd3,5'd9,16'd1};// slti, rs=3, rt=9, imm=1          => R[9]=1
//       assign   inst_mem[9 ] = {6'b101011,5'd1,5'd4,16'd1};// sw, base=D[1], rt=4, offset=1    => Data[2]=3
//       assign   inst_mem[10] = {6'b000010,26'd3};  // j, address=3 << 2=12
//       assign   inst_mem[11] = {6'b000000,5'd0,5'd1,5'd11,5'd0,6'b100000};// add, rs=0, rt=1, rd=11           => R[11]=1 will not execute
//       assign   inst_mem[12] = {6'b100011,5'd1,5'd10,16'd1};// lw, base=D[1], rt=10, offset=1   => R[10]=3
//       assign   inst_mem[13] = {32'h00000000};// nothing  1
//       assign   inst_mem[14] = {32'h00000000};// nothing  2
//       assign   inst_mem[15] = {32'h00000000};// nothing  3
//       assign   inst = inst_mem[current_addr_pc]; 

// endmodule

// module regfile_v2 (
//  rs,rt,rd,input_data,write,rs_data,rt_data,rst,clk,write_finish
// );

// input [4:0]rs,rt,rd;
// input [31:0]input_data;

// input write,rst,clk;
// integer i;
// output [31:0]rs_data, rt_data;
// output reg write_finish;
// reg [31:0] regarray [31:0];
// assign rs_data=regarray[rs];
// assign rt_data=regarray[rt];

// always @(*) begin
//     if(~rst)begin
//         for ( i=0 ;i<32 ;i=i+1 ) begin
//             regarray[i]<=0;
//         end
//         write_finish<=0;
//     end
//     else  if(write) begin
//     regarray[rd]<= input_data;
//     write_finish<=1;
//     end 
//     else begin
//       write_finish<=0;
//     end
//     end

// endmodule //regfile_v2

// module Ram (write, load,ram_addr,clk,output_data,input_data,ram_write_finish
// );
// input clk, write,load;
// input [31:0] ram_addr,input_data;
// output [31:0] output_data;
// output reg ram_write_finish;
// reg [31:0] ram [255:0];

// assign output_data=(load)?ram[ram_addr]:32'hzzzz;

// always @(*) begin
//     if (write) begin
//         ram[ram_addr]<=input_data;
//         ram_write_finish<=1;
//     end
// end


// endmodule //data_mem

// module ext (
//     input_imm,output_imm
// );
// input [15:0] input_imm;
// output [31:0] output_imm;

// assign output_imm=(input_imm[15])?{16'hFFFF,input_imm}:{16'h0000,input_imm};

// endmodule //ext
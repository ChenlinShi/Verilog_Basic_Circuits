`include "decoder.v"
`include "ext.v"
module control_unit (
 instruction, 
 jump,
 alu_func,
 rs,rt,rd,imm,
 ram_load,
 ram_write,
 signal_extension,
 ram_addr,
 jump_offset
//  regload
);
input [31:0] instruction;
output reg [31:0]ram_addr; 
output reg [15:0] jump_offset;
output jump,signal_extension,ram_load,ram_write;
// output reg regload;
output reg [31:0]imm;
output [2:0]alu_func;

// todo : rs rt rd  ram_addr, 

output reg [4:0] rs,rt,rd;
wire [3:0] case_test;
wire [31:0] temp_imm;
wire [2:0]tmp;



assign case_test={ram_load,ram_write,jump,signal_extension};
decoder dec(instruction[31:26],instruction[3:0],tmp,ram_load,ram_write,jump,signal_extension);
ext ext_for_control_unit (instruction[15:0],temp_imm);
// when ram_load or ram_write is true, assign ram_addr ,rt
// when signal_extension is ture, assign imm,rs rt 
// when jump is true, assign jump
assign alu_func=(instruction)?tmp:0;
always @(*) begin
   jump_offset<= 0 ; 
      //  regload<= 1 ;//always need get data from REGFILE
           rs <= 0 ;
           rt <= 0 ;
           rd <= 0 ;// Other values do not affect the running
  if( alu_func && ~signal_extension) begin
     rs <= instruction[25:21];
     rt <= instruction[20:16];
     rd <= instruction[15:11];
    //  regload<=1;
  end
  else begin
    case (case_test)
    4'b1000     :  {ram_addr,rt}<={{27'd0,instruction[25:21]}+{16'd0,instruction[15:0]},instruction[20:16]};// make ram addr 32bit, and then plus offset 
    4'b0100     :  {ram_addr,rt}<={{27'd0,instruction[25:21]}+{16'd0,instruction[15:0]},instruction[20:16]};// make ram addr 32bit, and then plus offset 
    4'b0010     :   jump_offset <= instruction[15:0];                                                       // jump addr offset 
    4'b0001     :  {rs,rt,imm}  <={instruction[25:21],instruction[20:16],temp_imm}    ;                      // set rs rt and 32bit imm 
    endcase
end       
    
end

//To do 

endmodule //control_unit
module tb_control_unit (
    
);


reg [31:0] instruction;
wire [31:0]ram_addr; 
wire  [15:0] jump_offset;
wire jump,signal_extension,ram_load,ram_write;
wire  [31:0]imm;
wire [2:0]alu_func;
wire [4:0] rs,rt,rd;

control_unit cu ( instruction, jump,alu_func,rs,rt,rd,imm,ram_load, ram_write,signal_extension, ram_addr,jump_offset);



initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #100 $finish;
end
initial begin
    #10  instruction={6'b001000,5'd0,5'd1,16'd1};// addi, rs=0, rt=1, imm=1  
    #10  instruction={6'b000000,5'd0,5'd1,5'd2,5'd0,6'b100000};// add, rs=0, rt=1, rd=2
    #10  instruction={6'b001101,5'd1,5'd4,16'd2};// ori, rs=1, rt=4, imm=2 
    #10  instruction={6'b101011,5'd1,5'd4,16'd1}; //sw, base=D[1], rt=4, offset=1
    #10  instruction={6'b000010,26'd3};// j, address=3 << 2=12

end


endmodule //tb_control_unit
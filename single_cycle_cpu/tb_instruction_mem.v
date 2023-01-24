module tb_instruction_mem (
    
);

reg [31:0] current_addr_pc;
wire  [31:0] inst;

 Instruction_mem m1 (current_addr_pc,inst);
 initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #100 $finish;
end
initial begin
    #10 current_addr_pc=0;
    #10 current_addr_pc=12;
    #10 current_addr_pc=10;
end





endmodule //tb_instruction_mem
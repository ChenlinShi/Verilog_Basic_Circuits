module tb_pcna (
    
);


reg [31:0] current_addr_pc;

reg [15:0]jump_offset;

wire [31:0] next_addr_pc;
program_counter_next_addr pcna (current_addr_pc,next_addr_pc,jump_offset);
initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #100 $finish;
end
initial begin
    #10 current_addr_pc=0;jump_offset=0;
    #10 jump_offset=-1;
    #10 jump_offset= 1;
    #10 current_addr_pc=11;

end


endmodule //tb_pcna
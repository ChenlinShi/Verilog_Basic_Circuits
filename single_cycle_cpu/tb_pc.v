module tb_pc (
    
);

reg [31:0] current_addr_pc;
wire [31:0] results_addr;
reg clk, rst;

program_counter  pc1(current_addr_pc,results_addr, clk,rst);

initial begin
   clk=0;
    forever #10 clk = ~clk;  
end 

initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #100 $finish;
end
initial begin
    #10 current_addr_pc=0;rst=1;
    #10 current_addr_pc=12;
    #10 current_addr_pc=10;
    #10 current_addr_pc=13;
    #10 current_addr_pc=11;
    #10 current_addr_pc=15;rst=0;
end

endmodule //tb_pc
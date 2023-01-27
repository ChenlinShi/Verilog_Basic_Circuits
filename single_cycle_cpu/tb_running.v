module tb_running (
    
);

reg clk ,rst;


running m1(clk,rst);

initial begin
   clk=0;
    forever #10 clk = ~clk;  
end 
initial begin
    #10 rst=0;
    #10 rst=1;
end

initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #500 $finish;
end
endmodule //tb_running
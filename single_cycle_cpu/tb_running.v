module tb_running (
    
);

reg clk ,rst;


running m1(clk,rst);

initial begin
clk=1;
 forever #10 clk = ~clk;  
end 
initial begin
     rst=0;
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
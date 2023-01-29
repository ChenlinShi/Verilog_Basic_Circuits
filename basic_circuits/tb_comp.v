
module tb_comparator();
reg [7:0] a,b;
wire low, eq, high;

comparator M1(low,eq,high,a,b);

 initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #100 $finish;
end
initial begin
    #10 a=8'b0;b=8'b0;  
    #10 b=100;
    #10 a=90;
    #10 b=0;
end
endmodule
module t_shifter();
wire A;
reg E,clk,rst;
four_bit_shifter M1(A,E,clk,rst);
 initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
initial begin 
    #200 $finish;
end
initial begin
    #10 E=0;rst=0;
    #10 E=1;
    #10 E=1;
    #10 E=0;rst=0;
    #10 E=0;rst=0;
    #10 E=1;
    #10 E=1;
    #10 E=1;
    #10 E=0;
    #10 E=0;
    #10 E=0;
    #10 E=0;
    #10 E=1;
    #10 E=1;
    #10 E=0;
    #10 E=1;
    #10 E=0;rst=1;
    #10 E=0;rst=0;


end
endmodule
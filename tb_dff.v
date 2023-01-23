module tb_DFF();
reg data,clk;
wire q,q_bar;

dff dff(q,q_bar,data,clk);

initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
 initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #1000 $finish;
end
initial begin
    #100 data=0;
    #100 data=1;
    #100 data=1;
    #100 data=0;
    #100 data=0;
    #100 data=0;
    #100 data=1;
    #100 data=1;
end

endmodule 
module tb_syn_cir (
    
);

wire cout;
wire [7:0] sum;
reg  clk1,clk2,cin,rst;
reg [7:0] a,b,c,d;

syn_cir u1(clk1,clk2,a,b,c,d,cin,rst,cout,sum    
);



initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
end
initial begin
 clk2=0;
     forever #10 clk2 = ~clk2; 
      end 
initial begin
  clk1=0;
     forever #10 clk1 = ~clk1; 
end 
initial begin                                                  
#10 a=1;b=2;cin=1'b0; rst=1; c=3;d=4 ;              
#180 a=1;b=1;
// #20 a=20;b=20;cin=1;
// #20 a=75;b=75;cin=1;
// #20 a=128;b=128;cin=0;
// #20 a=200;b=200;cin=0;                                                                                 
end 
// initial begin
//   clk=0;
//      forever #10 clk = ~clk;  
// end 

initial begin 
    #1000 $finish;
end

endmodule //tb_syn_cir
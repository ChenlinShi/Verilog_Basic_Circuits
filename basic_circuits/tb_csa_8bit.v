module tb_csa_bitadder ();

reg [7:0] a,b;
output [7:0] sum;
output  cout;
reg rst,clk;
reg cin;
parameter delay=20; 
CSA_8bit  csa(
    a,b,cin,sum,cout,clk,rst
);
initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
end

initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
initial begin                                                  
#10   a=2;b=5;cin=1'b0;             
#delay a=1;b=1;
#delay a=20;b=20;cin=1;
#delay a=75;b=75;cin=1;
#delay a=128;b=128;cin=0;
#delay a=200;b=20;cin=0;                                                                                 
end 
// initial begin
//   clk=0;
//      forever #10 clk = ~clk;  
// end 


initial begin 
    #1000 $finish;
end


endmodule
module tb_csa_64bitadder ();

reg [63:0] a,b;
output [63:0] sum;
output  cout;
reg rst,clk;
reg cin;
parameter delay=20; 

CSA_64    csa(
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
#delay a=12;b=12;cin=1;
#delay a=12;b=12;cin=0;
#delay a=75;b=75;cin=1;
#delay a=1024;b=2048;cin=0;
#delay a=4096;b=8192;cin=0;    
#delay a=22000;b=2000;cin=0;    
#delay a=2223000;b=2021312300;cin=0; 
#delay a=9213123;b=99812398123;cin=0;                                                                                 



end 


initial begin 
    #1000 $finish;
end


endmodule
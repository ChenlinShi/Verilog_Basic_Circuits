module tb_8_bitadder ();

reg [7:0] a,b;
output [7:0] sum;
output  cout;
reg cin;
reg rst,enable;
parameter delay=80; 
pipeline_8bit_adder m1(enable,rst,a,b,cin,cout,sum);


initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
end

initial begin
  enable=0;
     forever #10 enable = ~enable;  
end 
initial begin                                                  
#10 a=8'b0;b=8'b0;cin=1'b0; rst=1;                
#20 a=1;b=1;
#20 a=20;b=20;cin=1;
#20 a=75;b=75;cin=1;
#20 a=128;b=128;cin=0;
#20 a=200;b=200;cin=0;                                                                                 
end 
// initial begin
//   clk=0;
//      forever #10 clk = ~clk;  
// end 


initial begin 
    #200 $finish;
end


endmodule
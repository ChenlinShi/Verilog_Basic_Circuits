module tb_mul_block_csa_64 (   
);

reg [63:0] a,b;
output [63:0] sum;
output  cout;
reg cin,clk,rst;
parameter delay=20; 

top_8block csa( a,b,cin,sum,cout,clk,rst
);
initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
end


initial begin                                                  
#10   a=2;b=5;cin=1'b0;             
#delay a=1;b=1;
#delay a=20;b=20;cin=1;
#delay a=75;b=75;cin=1;
#delay a=128;b=128;cin=0;
#delay a=128;b=128;cin=1;
#delay a=1228;b=1238;cin=0;
#delay a=1228;b=1238;cin=1;
#delay a=25623210;b=222340;cin=0;                                                                                 
end 

initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 


initial begin 
    #1000 $finish;
end



endmodule //tb_c_select_adder_8
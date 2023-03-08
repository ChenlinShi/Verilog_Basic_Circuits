module tb_CLAv2_8bit (
    
);

reg [7:0] a,b;
wire [7:0] sum;
wire  cout;

reg cin;
parameter delay=20; 
CLAv2_8bit cla (a,b,cin,sum,cout);


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
#delay a=200;b=20;cin=0;                                                                                 
end 

// initial begin
//   clk=0;
//      forever #10 clk = ~clk;  
// end 


initial begin 
    #1000 $finish;
end








endmodule //tb_CLAv2_8bit
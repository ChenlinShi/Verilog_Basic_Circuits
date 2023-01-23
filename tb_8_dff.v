
module tb_8_dff (
    
);

wire [7:0] q_e;
wire [7:0] q_e_bar;

reg [7:0] data;
reg clk,rst;

dff_8 u1(
    q_e,q_e_bar,data,clk,rst
);

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
    #100 data=0;rst=1;
    #100 data=23;
    #100 data=2;
    #100 data=11;
    #100 data=50;
    #100 data=60;
    #100 data=112;
    #100 data=1;
end




endmodule //tb_8_dff




module tb_regfile (
    
);

reg [4:0] rs,rt,rd;
reg clk, rst,write;
reg [31:0]input_data;
wire [31:0]rs_data,rt_data;

regfile  m1 (  rs,rt,rd,input_data,clk,rst,write,rs_data,rt_data);

initial begin
   clk=0;
    forever #10 clk = ~clk;  
end 

initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #100 $finish;
end
initial begin
    #10 rs=0;rt=1;rd=2;input_data=3;write=1;
    #20 rs=2;rt=0;rd=2;input_data=6;
    #10 rs=2;rt=0;rd=2;input_data=6;
    #20 rs=2;rt=2;rd=2;input_data=3;





end


endmodule //tb_regfile
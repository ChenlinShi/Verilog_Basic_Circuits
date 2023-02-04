module tb_pipeline_mul_8bit (
    
);
reg clk,rstn;
reg [7:0] a,b;
wire  [15:0]out;

 pipeline_8_bit_multiplier mulp (clk,rstn,a,b,out);


initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
end

initial begin
      clk=0;
     forever #10 clk = ~clk;  
end 
initial begin                                                  
#10 a=32;b=32;rstn=1;
#20 a=12;b=74;
#20 a=12;b=24;
#20 a=43;b=7;


#1000 rstn=0;                
                                                                               
end 
// initial begin
//   clk=0;
//      forever #10 clk = ~clk;  
// end 


initial begin 
    #1000 $finish;
end

endmodule //tb_pipeline_mul_8bit
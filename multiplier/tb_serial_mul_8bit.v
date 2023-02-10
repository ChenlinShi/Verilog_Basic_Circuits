module tb_serial_mul_8bit (
    
);
reg [7:0] a,b;
wire  [15:0]out;

 serial_multiplier mulp (a,b,out);


initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
end

initial begin                                                  
#10 a=255;b=32;
#20 a=12;b=74;
#20 a=12;b=24;
#20 a=43;b=7;
            
                                                                               
end 
// initial begin
//   clk=0;
//      forever #10 clk = ~clk;  
// end 


initial begin 
    #1000 $finish;
end

endmodule //tb_pipeline_mul_8bit
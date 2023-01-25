module tb_ram (
    
);
reg clk, write,read;
reg [31:0] ram_addr,input_data;
wire [31:0] output_data;
reg [31:0] ram [255:0];

Ram ram1(write, read,ram_addr,clk,output_data,input_data);

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
    #10 ram_addr=0;read=1;input_data=1;
    #10 ram_addr=12;
    #10 ram_addr=10;write=1;
    #10 ram_addr=13;input_data=23;
    #10 ram_addr=11;
    #10 ram_addr=15;
end

endmodule //tb_ram
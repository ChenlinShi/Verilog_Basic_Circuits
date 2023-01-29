module tb_drink (
    
);

reg  clk,rst; 
reg [1:0] coin;// 0 means 0 ,  1 means 1, 2 means 2.
wire [1:0] change ; //0 means 0, 1 means 1, 2 means 2;
wire drink;

drink_FSM drink_seller (coin,  change, drink,clk, rst);

initial begin
    clk=0;
    forever #10 clk = ~clk;  
end 

initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #200 $finish;
end
initial begin
        rst =0;
    #10 rst =1;
    #10 coin =2;

end





endmodule //tb_drink
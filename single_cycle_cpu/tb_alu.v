module tb_alu (
    
);

reg [31:0]a,b;
reg [2:0]alu_func;
wire [31:0] data_out;
alu m1 ( a,b,alu_func,data_out);


initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #100 $finish;
end
initial begin
    #10 a=25;b=24;alu_func=3'b001;
    #10 a=25;b=24;alu_func=3'b010;
    #10 a=25;b=24;alu_func=3'b011;
    #10 a=25;b=24;alu_func=3'b100;
    #10 a=25;b=24;alu_func=3'b101;
    #10 a=-25;b=24;alu_func=3'b101;

end


endmodule //tb_alu
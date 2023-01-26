module tb_decoder (
    
);
reg [5:0]op;
reg [3:0]func;
wire [2:0]alu_func;
wire ram_write,ram_load,jump;

decoder u1 (op,func,alu_func,ram_load,ram_write,jump);

initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end

initial begin 
    #100 $finish;
end

initial begin
    #10 op=6'b000000;func=4'b0000;
    #20 op=6'b000010;func=4'b0001;
    #10 op=6'b000000;func=4'b0010;
    #10 op=6'b001101;func=4'b1111;
    #10 op=6'b101011;func=4'b1011;
    #10 op=6'b100011;func=4'b1011;
    #10 op=6'b100011;func=4'b1011;






end

endmodule //tb_decoder
module tb_ext (
    
);

reg [15:0]input_imm;

wire [31:0] output_imm;
ext m1 (input_imm,output_imm);

initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end

initial begin 
    #100 $finish;
end
initial begin
    #10 input_imm=0;
    #10 input_imm=123;
    #10 input_imm=1123;
    #10 input_imm=2048;
    #10 input_imm=-1;

end
endmodule //tb_ext
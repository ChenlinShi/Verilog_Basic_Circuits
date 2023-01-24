module tb_cra_32 (
    
);

reg [31:0] a,b;
wire [31:0]sum;
reg cin ;
wire cout;

RCA_32_bit_comb m1(a,b,cin,cout,sum);


 initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #100 $finish;
end
initial begin
    #10 a=213;b=123;cin=1;  
    #10 b=100;
    #10 a=90;
    #10 b=0;cin=0;

end




endmodule //tb_cra_32
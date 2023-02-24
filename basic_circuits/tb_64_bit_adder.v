module tb_64_bit_adder (
    
);
reg [63:0]a,b;
reg cin;
wire cout;
wire [63:0]sum;

serial_adder_64bit u0(a,b,cin,cout,sum);

initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
end

initial begin                                                  
#10   a=2;b=5;cin=1'b0;             
#1   a=1234;b=1123;
#1    a=20;b=2012;cin=1;
#1    a=75;b=75123;cin=1;
#1   a=128;b=12890;cin=0;
#1    a=200;b=20123;cin=0;                                                                                 
end 

initial begin 
    #1000 $finish;
end



endmodule //tb_64_bit_adder
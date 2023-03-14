module t_mux();
wire out;
reg a, b,sel;
   mux_1bit_nand M1(sel,a,b,out);
 initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #100 $finish;
end
initial begin
    #10 a=0 ;b=1;sel=1;
    #10 sel=0;
    #10 a=1 ;b=0;sel=1;
    #10 sel=0;
 
end
endmodule
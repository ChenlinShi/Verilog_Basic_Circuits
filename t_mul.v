module t_mux();
wire mux_out;
reg a, b,sel;
  multiplexer M1(mux_out,sel,a,b);
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
 
end
endmodule
module sr_tb();
wire q,q_bar;
reg s,en,r;

latch_sr sr(en,s,r,q,q_bar);


 initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #200 $finish;
end
initial begin
    #10 en=0 ;s=0;r=0;
    #10 en=0 ;s=0;r=1;
    #10 en=0 ;s=1;r=0;
    #10 en=0 ;s=1;r=1;
    #10 en=1 ;s=0;r=0;
    #10 en=1 ;s=0;r=1;
    #10 en=1 ;s=1;r=0;   
    #10 en=0 ;s=1;r=0;
end
endmodule
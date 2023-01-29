// module ADD_full(output c_out,sum, input a,b,cin);
// wire w1, w2, w3;


// ADD_half_nogate(w2,w1,a,b);
// ADD_half_nogate(sum,w3,cin,w1);

// assign c_out=w3||w2;
    
// endmodule

module t_Add();
wire sum, c_out;
reg a, b,cin;
ADD_full M1(c_out,sum,a,b,cin);
 initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
 end
initial begin 
    #100 $finish;
end
initial begin
    #10 a=0 ;b=0;cin=1;
    #10 b=1;
    #10 a=1;
    #10 b=0;
end
endmodule

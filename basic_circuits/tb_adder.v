module t_Add_half();
wire sum, cout;
reg a, b;
ADD_half M1(cout,sum,a,b);
initial begin 
    #100 $finish;
end
initial begin
    #10 a=0 ;b=0;
    #10 b=1;
    #10 a=1;
    #10 b=0;
end
endmodule

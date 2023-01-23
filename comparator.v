module comparator (
 lower_isture,
 eq_isture,   
 higher_isture,   
 a,
 b
);
input [7:0] a,b ;
output  reg lower_isture,eq_isture,higher_isture;

always @ (a,b) begin
    lower_isture <=0;
    eq_isture <=0;
    higher_isture <=0;
    if (a>b) higher_isture <=1;
    else if(a==b) eq_isture <=1;
    else lower_isture <=1;
end

endmodule //comparator
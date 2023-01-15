module ADD_half(output c_out, sum,  input a,b );

    xor (sum,a,b);
    and (c_out,a,b);

endmodule

// module ADD_full(output c_out,sum, input a,b,cin);
// wire w1, w2, w3;


// ADD_half m1(w2,w1,a,b);
// ADD_half m2(w3,sum,cin,w1);

// or(c_out,w3,w2);
    
// endmodule

module ADD_half_nogate(output cout,sum, input a,b);


assign      sum=a^b;
assign     cout=a&&b;


endmodule

module ADD_full(output c_out,sum, input a,b,cin);
wire w1, w2, w3;

ADD_half_nogate M1(w2,w1,a,b);
ADD_half_nogate M2(w3,sum,cin,w1);

assign c_out=w3||w2;
    
endmodule

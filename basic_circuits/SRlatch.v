module latch_sr (en,s,r,q,q_bar);
output q,q_bar;
input s,en,r;

assign q_bar=!q ;
assign q=~en?0:r?0:s?1:q ;

endmodule
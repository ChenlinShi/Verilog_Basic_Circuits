module CLAv2_8bit (
    a,b,cin,sum,cout
    );

input [7:0]a,b;
input cin;
output [7:0]sum;
output cout;

wire cin_first;
CLA_4_bit_block u0 (a[3:0],b[3:0],cin,sum[3:0],cin_first);
CLA_4_bit_block u1 (a[7:4],b[7:4],cin_first,sum[7:4],cout);

endmodule //CLAv2_8bit


    
module CLA_4_bit_block(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;

wire [3:0] p,g,c;

pg_gen u0 (a,b,p,g);

assign c[0]=cin;
assign c[1]= g[0]|(p[0]&c[0]);
assign c[2]= g[1]|(p[1]&c[1]);
assign c[3]= g[2]|(p[2]&c[2]);
assign cout= g[3]|(p[3]&c[3]);
assign sum[0]=p[0]^c[0];
assign sum[3:1]=p[3:1]^c[3:1];

endmodule

module pg_gen (
    a,b,p,g    
);
input [3:0]a,b;
output [3:0]p,g;

assign p=a^b;
assign g=a&b;

endmodule 
module LCA_8bit (
    a,b,cin,cout,sum
);
input [7:0]a,b;
input cin;

output [7:0]sum;
output cout;

wire [7:0] p;
wire [7:0] g;

wire [7:0] c;

pg_gen pg0 (.a(a[0]),.b(b[0]),.p(p[0]),.g(g[0]));
pg_gen pg1 (.a(a[1]),.b(b[1]),.p(p[1]),.g(g[1]));
pg_gen pg2 (.a(a[2]),.b(b[2]),.p(p[2]),.g(g[2]));
pg_gen pg3 (.a(a[3]),.b(b[3]),.p(p[3]),.g(g[3]));
pg_gen pg4 (.a(a[4]),.b(b[4]),.p(p[4]),.g(g[4]));
pg_gen pg5 (.a(a[5]),.b(b[5]),.p(p[5]),.g(g[5]));
pg_gen pg6 (.a(a[6]),.b(b[6]),.p(p[6]),.g(g[6]));
pg_gen pg7 (.a(a[7]),.b(b[7]),.p(p[7]),.g(g[7]));

assign c[0]=cin;  //cin 0th bit

                 
assign c[1]=g[0]|(p[0]&c[0]); //cin 1st bit
assign c[2]=g[1]|(p[1]&c[1]); //cin 2nd bit
assign c[3]=g[2]|(p[2]&c[2]); //cin 3rd bit
assign c[4]=g[3]|(p[3]&c[3]); // cin 4th bit
assign c[5]=g[4]|(p[4]&c[4]); //cin 5th bit
assign c[6]=g[5]|(p[5]&c[5]); //cin 6th bit
assign c[7]=g[6]|(p[6]&c[6]);  //cin 7th bit
assign cout=g[7]|(p[7]&c[7]); //cin 8th bit


assign sum[0] = p[0]^c[0]; //sum 0th bit
assign sum[1] = p[1]^c[1]; //sum 1st bit
assign sum[2] = p[2]^c[2]; //sum 2nd bit
assign sum[3] = p[3]^c[3]; //sum 3rd bit
assign sum[4] = p[4]^c[4]; //sum 4th bit
assign sum[5] = p[5]^c[5]; //sum 5th bit
assign sum[6] = p[6]^c[6]; //sum 6th bit
assign sum[7] = p[7]^c[7]; //sum 7th bit

endmodule //LCA_8bit

module pg_gen (
    a,b,p,g    
);
input a,b;
output p,g;

assign p=a^b;
assign g=a&b;

endmodule //LCA_8bit
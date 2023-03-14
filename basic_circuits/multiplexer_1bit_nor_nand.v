module mux_1bit_nand(input sel, input a, input b, output out);

wire s_inv;
wire out_1;
wire out_2;
not (s_inv, sel);
nand (out_1,a,s_inv);
nand (out_2,sel,b);

nand (out,out_1,out_2);




endmodule

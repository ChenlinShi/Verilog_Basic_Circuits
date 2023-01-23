/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP4
// Date      : Mon Jan 23 19:49:06 2023
/////////////////////////////////////////////////////////////


module eight_bit_adder ( a, b, cin, cout, sum, clk, rst );
  input [7:0] a;
  input [7:0] b;
  output [7:0] sum;
  input cin, clk, rst;
  output cout;
  wire   N3, N7, N11, N15, N19, N23, N27, N31, n33, n35, n37, n39, n41, n43,
         n45, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71;
  wire   [6:0] bit_carry;

  DFFRNQ_X1 \sum_reg[0]  ( .D(N3), .CLK(clk), .RN(rst), .Q(sum[0]) );
  DFFSNQ_X1 \bit_carry_reg[0]  ( .D(n45), .CLK(clk), .SN(1'b1), .Q(
        bit_carry[0]) );
  DFFRNQ_X1 \sum_reg[1]  ( .D(N7), .CLK(clk), .RN(rst), .Q(sum[1]) );
  DFFSNQ_X1 \bit_carry_reg[1]  ( .D(n43), .CLK(clk), .SN(1'b1), .Q(
        bit_carry[1]) );
  DFFRNQ_X1 \sum_reg[2]  ( .D(N11), .CLK(clk), .RN(rst), .Q(sum[2]) );
  DFFSNQ_X1 \bit_carry_reg[2]  ( .D(n41), .CLK(clk), .SN(1'b1), .Q(
        bit_carry[2]) );
  DFFRNQ_X1 \sum_reg[3]  ( .D(N15), .CLK(clk), .RN(rst), .Q(sum[3]) );
  DFFSNQ_X1 \bit_carry_reg[3]  ( .D(n39), .CLK(clk), .SN(1'b1), .Q(
        bit_carry[3]) );
  DFFRNQ_X1 \sum_reg[4]  ( .D(N19), .CLK(clk), .RN(rst), .Q(sum[4]) );
  DFFSNQ_X1 \bit_carry_reg[4]  ( .D(n37), .CLK(clk), .SN(1'b1), .Q(
        bit_carry[4]) );
  DFFRNQ_X1 \sum_reg[5]  ( .D(N23), .CLK(clk), .RN(rst), .Q(sum[5]) );
  DFFSNQ_X1 \bit_carry_reg[5]  ( .D(n35), .CLK(clk), .SN(1'b1), .Q(
        bit_carry[5]) );
  DFFRNQ_X1 \sum_reg[6]  ( .D(N27), .CLK(clk), .RN(rst), .Q(sum[6]) );
  DFFSNQ_X1 \bit_carry_reg[6]  ( .D(n33), .CLK(clk), .SN(1'b1), .Q(
        bit_carry[6]) );
  DFFRNQ_X1 \sum_reg[7]  ( .D(N31), .CLK(clk), .RN(rst), .Q(sum[7]) );
  DFFRNQ_X1 cout_reg ( .D(n47), .CLK(clk), .RN(rst), .Q(cout) );
  AOI22_X2 U57 ( .A1(b[7]), .A2(a[7]), .B1(n57), .B2(bit_carry[6]), .ZN(n56)
         );
  OAI22_X2 U58 ( .A1(rst), .A2(n49), .B1(n58), .B2(n48), .ZN(n45) );
  AOI22_X2 U59 ( .A1(cin), .A2(n59), .B1(a[0]), .B2(b[0]), .ZN(n58) );
  OAI22_X2 U60 ( .A1(rst), .A2(n50), .B1(n60), .B2(n48), .ZN(n43) );
  AOI22_X2 U61 ( .A1(bit_carry[0]), .A2(n61), .B1(a[1]), .B2(b[1]), .ZN(n60)
         );
  OAI22_X2 U62 ( .A1(rst), .A2(n51), .B1(n62), .B2(n48), .ZN(n41) );
  AOI22_X2 U63 ( .A1(bit_carry[1]), .A2(n63), .B1(a[2]), .B2(b[2]), .ZN(n62)
         );
  OAI22_X2 U64 ( .A1(rst), .A2(n52), .B1(n64), .B2(n48), .ZN(n39) );
  AOI22_X2 U65 ( .A1(bit_carry[2]), .A2(n65), .B1(a[3]), .B2(b[3]), .ZN(n64)
         );
  OAI22_X2 U66 ( .A1(rst), .A2(n53), .B1(n66), .B2(n48), .ZN(n37) );
  AOI22_X2 U67 ( .A1(bit_carry[3]), .A2(n67), .B1(a[4]), .B2(b[4]), .ZN(n66)
         );
  OAI22_X2 U68 ( .A1(rst), .A2(n54), .B1(n68), .B2(n48), .ZN(n35) );
  AOI22_X2 U69 ( .A1(bit_carry[4]), .A2(n69), .B1(a[5]), .B2(b[5]), .ZN(n68)
         );
  OAI22_X2 U70 ( .A1(rst), .A2(n55), .B1(n70), .B2(n48), .ZN(n33) );
  AOI22_X2 U71 ( .A1(bit_carry[5]), .A2(n71), .B1(a[6]), .B2(b[6]), .ZN(n70)
         );
  INV_X2 U72 ( .I(n56), .ZN(n47) );
  INV_X2 U73 ( .I(rst), .ZN(n48) );
  INV_X2 U74 ( .I(bit_carry[0]), .ZN(n49) );
  INV_X2 U75 ( .I(bit_carry[1]), .ZN(n50) );
  INV_X2 U76 ( .I(bit_carry[2]), .ZN(n51) );
  INV_X2 U77 ( .I(bit_carry[3]), .ZN(n52) );
  INV_X2 U78 ( .I(bit_carry[4]), .ZN(n53) );
  INV_X2 U79 ( .I(bit_carry[5]), .ZN(n54) );
  INV_X2 U80 ( .I(bit_carry[6]), .ZN(n55) );
  XOR2_X1 U81 ( .A1(bit_carry[0]), .A2(n61), .Z(N7) );
  XOR2_X1 U82 ( .A1(a[1]), .A2(b[1]), .Z(n61) );
  XOR2_X1 U83 ( .A1(bit_carry[6]), .A2(n57), .Z(N31) );
  XOR2_X1 U84 ( .A1(a[7]), .A2(b[7]), .Z(n57) );
  XOR2_X1 U85 ( .A1(cin), .A2(n59), .Z(N3) );
  XOR2_X1 U86 ( .A1(a[0]), .A2(b[0]), .Z(n59) );
  XOR2_X1 U87 ( .A1(bit_carry[5]), .A2(n71), .Z(N27) );
  XOR2_X1 U88 ( .A1(a[6]), .A2(b[6]), .Z(n71) );
  XOR2_X1 U89 ( .A1(bit_carry[4]), .A2(n69), .Z(N23) );
  XOR2_X1 U90 ( .A1(a[5]), .A2(b[5]), .Z(n69) );
  XOR2_X1 U91 ( .A1(bit_carry[3]), .A2(n67), .Z(N19) );
  XOR2_X1 U92 ( .A1(a[4]), .A2(b[4]), .Z(n67) );
  XOR2_X1 U93 ( .A1(bit_carry[2]), .A2(n65), .Z(N15) );
  XOR2_X1 U94 ( .A1(a[3]), .A2(b[3]), .Z(n65) );
  XOR2_X1 U95 ( .A1(bit_carry[1]), .A2(n63), .Z(N11) );
  XOR2_X1 U96 ( .A1(a[2]), .A2(b[2]), .Z(n63) );
endmodule
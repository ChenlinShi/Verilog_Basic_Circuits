/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP4
// Date      : Mon Jan 23 23:04:10 2023
/////////////////////////////////////////////////////////////


module eight_bit_adder ( a, b, cin, cout, sum, clk, rst );
  input [7:0] a;
  input [7:0] b;
  output [7:0] sum;
  input cin, clk, rst;
  output cout;
  wire   n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48;
  wire   [7:0] a_d;
  wire   [7:0] b_d;
  DFFRNQ_X1 \d0/q_e_reg[0]  ( .D(a[0]), .CLK(clk), .RN(rst), .Q(a_d[0]) );
  DFFRNQ_X1 \d0/q_e_reg[1]  ( .D(a[1]), .CLK(clk), .RN(rst), .Q(a_d[1]) );
  DFFRNQ_X1 \d0/q_e_reg[2]  ( .D(a[2]), .CLK(clk), .RN(rst), .Q(a_d[2]) );
  DFFRNQ_X1 \d0/q_e_reg[3]  ( .D(a[3]), .CLK(clk), .RN(rst), .Q(a_d[3]) );
  DFFRNQ_X1 \d0/q_e_reg[4]  ( .D(a[4]), .CLK(clk), .RN(rst), .Q(a_d[4]) );
  DFFRNQ_X1 \d0/q_e_reg[5]  ( .D(a[5]), .CLK(clk), .RN(rst), .Q(a_d[5]) );
  DFFRNQ_X1 \d0/q_e_reg[6]  ( .D(a[6]), .CLK(clk), .RN(rst), .Q(a_d[6]) );
  DFFRNQ_X1 \d0/q_e_reg[7]  ( .D(a[7]), .CLK(clk), .RN(rst), .Q(a_d[7]) );
  DFFRNQ_X1 \d1/q_e_reg[0]  ( .D(b[0]), .CLK(clk), .RN(rst), .Q(b_d[0]) );
  DFFRNQ_X1 \d1/q_e_reg[1]  ( .D(b[1]), .CLK(clk), .RN(rst), .Q(b_d[1]) );
  DFFRNQ_X1 \d1/q_e_reg[2]  ( .D(b[2]), .CLK(clk), .RN(rst), .Q(b_d[2]) );
  DFFRNQ_X1 \d1/q_e_reg[3]  ( .D(b[3]), .CLK(clk), .RN(rst), .Q(b_d[3]) );
  DFFRNQ_X1 \d1/q_e_reg[4]  ( .D(b[4]), .CLK(clk), .RN(rst), .Q(b_d[4]) );
  DFFRNQ_X1 \d1/q_e_reg[5]  ( .D(b[5]), .CLK(clk), .RN(rst), .Q(b_d[5]) );
  DFFRNQ_X1 \d1/q_e_reg[6]  ( .D(b[6]), .CLK(clk), .RN(rst), .Q(b_d[6]) );
  DFFRNQ_X1 \d1/q_e_reg[7]  ( .D(b[7]), .CLK(clk), .RN(rst), .Q(b_d[7]) );
  AOI22_X2 U33 ( .A1(b_d[7]), .A2(a_d[7]), .B1(n26), .B2(n33), .ZN(n41) );
  AOI22_X2 U34 ( .A1(b_d[6]), .A2(a_d[6]), .B1(n27), .B2(n34), .ZN(n42) );
  AOI22_X2 U35 ( .A1(b_d[5]), .A2(a_d[5]), .B1(n28), .B2(n35), .ZN(n43) );
  AOI22_X2 U36 ( .A1(b_d[4]), .A2(a_d[4]), .B1(n29), .B2(n36), .ZN(n44) );
  AOI22_X2 U37 ( .A1(b_d[3]), .A2(a_d[3]), .B1(n30), .B2(n37), .ZN(n45) );
  AOI22_X2 U38 ( .A1(b_d[2]), .A2(a_d[2]), .B1(n31), .B2(n38), .ZN(n46) );
  AOI22_X2 U39 ( .A1(b_d[1]), .A2(a_d[1]), .B1(n32), .B2(n39), .ZN(n47) );
  AOI22_X2 U40 ( .A1(n40), .A2(cin), .B1(a_d[0]), .B2(b_d[0]), .ZN(n48) );
  INV_X2 U41 ( .I(n41), .ZN(cout) );
  INV_X2 U42 ( .I(n42), .ZN(n26) );
  INV_X2 U43 ( .I(n43), .ZN(n27) );
  INV_X2 U44 ( .I(n44), .ZN(n28) );
  INV_X2 U45 ( .I(n45), .ZN(n29) );
  INV_X2 U46 ( .I(n46), .ZN(n30) );
  INV_X2 U47 ( .I(n47), .ZN(n31) );
  INV_X2 U48 ( .I(n48), .ZN(n32) );
  XOR2_X1 U49 ( .A1(n26), .A2(n33), .Z(sum[7]) );
  XOR2_X1 U50 ( .A1(n27), .A2(n34), .Z(sum[6]) );
  XOR2_X1 U51 ( .A1(n28), .A2(n35), .Z(sum[5]) );
  XOR2_X1 U52 ( .A1(n29), .A2(n36), .Z(sum[4]) );
  XOR2_X1 U53 ( .A1(n30), .A2(n37), .Z(sum[3]) );
  XOR2_X1 U54 ( .A1(n31), .A2(n38), .Z(sum[2]) );
  XOR2_X1 U55 ( .A1(n32), .A2(n39), .Z(sum[1]) );
  XOR2_X1 U56 ( .A1(cin), .A2(n40), .Z(sum[0]) );
  XOR2_X1 U57 ( .A1(a_d[7]), .A2(b_d[7]), .Z(n33) );
  XOR2_X1 U58 ( .A1(a_d[6]), .A2(b_d[6]), .Z(n34) );
  XOR2_X1 U59 ( .A1(a_d[5]), .A2(b_d[5]), .Z(n35) );
  XOR2_X1 U60 ( .A1(a_d[4]), .A2(b_d[4]), .Z(n36) );
  XOR2_X1 U61 ( .A1(a_d[3]), .A2(b_d[3]), .Z(n37) );
  XOR2_X1 U62 ( .A1(a_d[2]), .A2(b_d[2]), .Z(n38) );
  XOR2_X1 U63 ( .A1(a_d[1]), .A2(b_d[1]), .Z(n39) );
  XOR2_X1 U64 ( .A1(a_d[0]), .A2(b_d[0]), .Z(n40) );
endmodule


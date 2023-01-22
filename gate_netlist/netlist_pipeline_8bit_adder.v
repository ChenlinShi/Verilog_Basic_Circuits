/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP4
// Date      : Sun Jan 22 23:03:23 2023
/////////////////////////////////////////////////////////////


module pipeline_8bit_adder ( enable, rst, a, b, cin, cout, sum );
  input [7:0] a;
  input [7:0] b;
  output [7:0] sum;
  input enable, rst, cin;
  output cout;
  wire   temp_cin, N15, N16, N17, N18, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153;
  wire   [3:0] temp_a;
  wire   [3:0] temp_b;
  wire   [3:0] low_bit_sum;

  DFFSNQ_X1 temp_cin_reg ( .D(n150), .CLK(enable), .SN(1'b1), .Q(temp_cin) );
  DFFSNQ_X1 \temp_b_reg[3]  ( .D(n149), .CLK(enable), .SN(1'b1), .Q(temp_b[3])
         );
  DFFSNQ_X1 \temp_b_reg[2]  ( .D(n148), .CLK(enable), .SN(1'b1), .Q(temp_b[2])
         );
  DFFSNQ_X1 \temp_b_reg[1]  ( .D(n147), .CLK(enable), .SN(1'b1), .Q(temp_b[1])
         );
  DFFSNQ_X1 \temp_b_reg[0]  ( .D(n146), .CLK(enable), .SN(1'b1), .Q(temp_b[0])
         );
  DFFSNQ_X1 \low_bit_sum_reg[3]  ( .D(n145), .CLK(enable), .SN(1'b1), .Q(
        low_bit_sum[3]) );
  DFFSNQ_X1 \low_bit_sum_reg[2]  ( .D(n144), .CLK(enable), .SN(1'b1), .Q(
        low_bit_sum[2]) );
  DFFSNQ_X1 \low_bit_sum_reg[1]  ( .D(n143), .CLK(enable), .SN(1'b1), .Q(
        low_bit_sum[1]) );
  DFFSNQ_X1 \low_bit_sum_reg[0]  ( .D(n142), .CLK(enable), .SN(1'b1), .Q(
        low_bit_sum[0]) );
  DFFSNQ_X1 \temp_a_reg[3]  ( .D(n141), .CLK(enable), .SN(1'b1), .Q(temp_a[3])
         );
  DFFSNQ_X1 \temp_a_reg[2]  ( .D(n140), .CLK(enable), .SN(1'b1), .Q(temp_a[2])
         );
  DFFSNQ_X1 \temp_a_reg[1]  ( .D(n139), .CLK(enable), .SN(1'b1), .Q(temp_a[1])
         );
  DFFSNQ_X1 \temp_a_reg[0]  ( .D(n151), .CLK(enable), .SN(1'b1), .Q(temp_a[0])
         );
  DFFRNQ_X1 cout_reg ( .D(n152), .CLK(enable), .RN(rst), .Q(cout) );
  DFFRNQ_X1 \sum_reg[7]  ( .D(N18), .CLK(enable), .RN(rst), .Q(sum[7]) );
  DFFRNQ_X1 \sum_reg[6]  ( .D(N17), .CLK(enable), .RN(rst), .Q(sum[6]) );
  DFFRNQ_X1 \sum_reg[5]  ( .D(N16), .CLK(enable), .RN(rst), .Q(sum[5]) );
  DFFRNQ_X1 \sum_reg[4]  ( .D(N15), .CLK(enable), .RN(rst), .Q(sum[4]) );
  DFFRNQ_X1 \sum_reg[3]  ( .D(low_bit_sum[3]), .CLK(enable), .RN(rst), .Q(
        sum[3]) );
  DFFRNQ_X1 \sum_reg[2]  ( .D(low_bit_sum[2]), .CLK(enable), .RN(rst), .Q(
        sum[2]) );
  DFFRNQ_X1 \sum_reg[1]  ( .D(low_bit_sum[1]), .CLK(enable), .RN(rst), .Q(
        sum[1]) );
  DFFRNQ_X1 \sum_reg[0]  ( .D(low_bit_sum[0]), .CLK(enable), .RN(rst), .Q(
        sum[0]) );
  OAI21_X2 U45 ( .A1(rst), .A2(n99), .B(n101), .ZN(n139) );
  NAND2_X2 U46 ( .A1(rst), .A2(a[5]), .ZN(n101) );
  OAI21_X2 U47 ( .A1(rst), .A2(n98), .B(n102), .ZN(n140) );
  NAND2_X2 U48 ( .A1(a[6]), .A2(rst), .ZN(n102) );
  OAI21_X2 U49 ( .A1(rst), .A2(n97), .B(n103), .ZN(n141) );
  NAND2_X2 U50 ( .A1(a[7]), .A2(rst), .ZN(n103) );
  OAI22_X2 U51 ( .A1(rst), .A2(n96), .B1(n104), .B2(n153), .ZN(n142) );
  OAI21_X2 U52 ( .A1(n106), .A2(n153), .B(n107), .ZN(n143) );
  NAND2_X2 U53 ( .A1(low_bit_sum[1]), .A2(n153), .ZN(n107) );
  OAI21_X2 U54 ( .A1(n110), .A2(n153), .B(n111), .ZN(n144) );
  NAND2_X2 U55 ( .A1(low_bit_sum[2]), .A2(n153), .ZN(n111) );
  OAI21_X2 U56 ( .A1(n114), .A2(n153), .B(n115), .ZN(n145) );
  NAND2_X2 U57 ( .A1(low_bit_sum[3]), .A2(n153), .ZN(n115) );
  OAI21_X2 U58 ( .A1(rst), .A2(n95), .B(n118), .ZN(n146) );
  NAND2_X2 U59 ( .A1(b[4]), .A2(rst), .ZN(n118) );
  OAI21_X2 U60 ( .A1(rst), .A2(n94), .B(n119), .ZN(n147) );
  NAND2_X2 U61 ( .A1(b[5]), .A2(rst), .ZN(n119) );
  OAI21_X2 U62 ( .A1(rst), .A2(n93), .B(n120), .ZN(n148) );
  NAND2_X2 U63 ( .A1(b[6]), .A2(rst), .ZN(n120) );
  OAI21_X2 U64 ( .A1(rst), .A2(n92), .B(n121), .ZN(n149) );
  NAND2_X2 U65 ( .A1(b[7]), .A2(rst), .ZN(n121) );
  OAI22_X2 U66 ( .A1(rst), .A2(n91), .B1(n122), .B2(n153), .ZN(n150) );
  AOI22_X2 U67 ( .A1(b[3]), .A2(n123), .B1(n88), .B2(a[3]), .ZN(n122) );
  OAI22_X2 U68 ( .A1(a[2]), .A2(n89), .B1(b[2]), .B2(n124), .ZN(n117) );
  OAI22_X2 U69 ( .A1(a[1]), .A2(n90), .B1(b[1]), .B2(n125), .ZN(n113) );
  OAI22_X2 U70 ( .A1(b[0]), .A2(a[0]), .B1(cin), .B2(n126), .ZN(n109) );
  OAI21_X2 U71 ( .A1(rst), .A2(n100), .B(n127), .ZN(n151) );
  NAND2_X2 U72 ( .A1(a[4]), .A2(rst), .ZN(n127) );
  OAI22_X2 U73 ( .A1(n97), .A2(n128), .B1(n129), .B2(n92), .ZN(n152) );
  OAI22_X2 U74 ( .A1(temp_a[2]), .A2(n131), .B1(temp_b[2]), .B2(n132), .ZN(
        n128) );
  AOI22_X2 U75 ( .A1(n99), .A2(n134), .B1(n94), .B2(n135), .ZN(n131) );
  OAI22_X2 U76 ( .A1(temp_b[0]), .A2(temp_a[0]), .B1(temp_cin), .B2(n137), 
        .ZN(n134) );
  NOR2_X2 U77 ( .A1(n95), .A2(n100), .ZN(n137) );
  INV_X2 U79 ( .I(n117), .ZN(n88) );
  INV_X2 U80 ( .I(n113), .ZN(n89) );
  INV_X2 U81 ( .I(n109), .ZN(n90) );
  INV_X2 U82 ( .I(temp_cin), .ZN(n91) );
  INV_X2 U83 ( .I(temp_b[3]), .ZN(n92) );
  INV_X2 U84 ( .I(temp_b[2]), .ZN(n93) );
  INV_X2 U85 ( .I(temp_b[1]), .ZN(n94) );
  INV_X2 U86 ( .I(temp_b[0]), .ZN(n95) );
  INV_X2 U87 ( .I(low_bit_sum[0]), .ZN(n96) );
  INV_X2 U88 ( .I(temp_a[3]), .ZN(n97) );
  INV_X2 U89 ( .I(temp_a[2]), .ZN(n98) );
  INV_X2 U90 ( .I(temp_a[1]), .ZN(n99) );
  INV_X2 U91 ( .I(temp_a[0]), .ZN(n100) );
  XOR2_X1 U92 ( .A1(n105), .A2(a[0]), .Z(n104) );
  XNOR2_X1 U93 ( .A1(b[0]), .A2(cin), .ZN(n105) );
  XNOR2_X1 U94 ( .A1(n108), .A2(n109), .ZN(n106) );
  XNOR2_X1 U95 ( .A1(a[1]), .A2(b[1]), .ZN(n108) );
  XNOR2_X1 U96 ( .A1(n112), .A2(n113), .ZN(n110) );
  XNOR2_X1 U97 ( .A1(a[2]), .A2(b[2]), .ZN(n112) );
  XNOR2_X1 U98 ( .A1(n116), .A2(n117), .ZN(n114) );
  XNOR2_X1 U99 ( .A1(a[3]), .A2(b[3]), .ZN(n116) );
  OR2_X1 U100 ( .A1(a[3]), .A2(n88), .Z(n123) );
  AND2_X1 U101 ( .A1(a[2]), .A2(n89), .Z(n124) );
  AND2_X1 U102 ( .A1(a[1]), .A2(n90), .Z(n125) );
  AND2_X1 U103 ( .A1(b[0]), .A2(a[0]), .Z(n126) );
  AND2_X1 U104 ( .A1(n128), .A2(n97), .Z(n129) );
  XNOR2_X1 U105 ( .A1(n128), .A2(n130), .ZN(N18) );
  XNOR2_X1 U106 ( .A1(n92), .A2(temp_a[3]), .ZN(n130) );
  AND2_X1 U107 ( .A1(temp_a[2]), .A2(n131), .Z(n132) );
  XOR2_X1 U108 ( .A1(n131), .A2(n133), .Z(N17) );
  XNOR2_X1 U109 ( .A1(n93), .A2(temp_a[2]), .ZN(n133) );
  OR2_X1 U110 ( .A1(n99), .A2(n134), .Z(n135) );
  XNOR2_X1 U111 ( .A1(n134), .A2(n136), .ZN(N16) );
  XNOR2_X1 U112 ( .A1(n94), .A2(temp_a[1]), .ZN(n136) );
  XNOR2_X1 U113 ( .A1(n100), .A2(n138), .ZN(N15) );
  XNOR2_X1 U114 ( .A1(n91), .A2(temp_b[0]), .ZN(n138) );
  INV_X8 U115 ( .I(rst), .ZN(n153) );
endmodule


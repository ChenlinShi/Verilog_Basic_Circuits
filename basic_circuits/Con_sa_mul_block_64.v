`include "./C_select_a_block.v";

module top_16block (a,b,cin,sum,cout,clk,rst);

input [63:0]a,b;
input cin,clk,rst;
output reg [63:0]sum_r;
output reg cout_r;

wire [63:0]sum;
wire cout;

Con_sa_16_bit_block_64  csa (a,b,cin,sum,cout);

always @(posedge clk ) begin
    if (rst) begin
        sum_r <= 0;
        cout_r <= 0;
    end
    else begin
        sum_r <= sum;
        cout_r <= cout;
    end
end
endmodule

module top_8block (a,b,cin,sum,cout,clk,rst);

input [63:0]a,b;
input cin,clk,rst;
output reg [63:0]sum_r;
output reg cout_r;

wire [63:0]sum;
wire cout;

Con_sa_8_bit_block_64  csa (a,b,cin,sum,cout);

always @(posedge clk ) begin
    if (rst) begin
        sum_r <= 0;
        cout_r <= 0;
    end
    else begin
        sum_r <= sum;
        cout_r <= cout;
    end
end
endmodule


module Con_sa_16_bit_block_64 (    
    a,b,cin,sum,cout
);
input [63:0]a,b;
input cin;
output [63:0]sum;
output cout;
wire [2:0]bit_carry;

CSelectAdder_16bit csa_16_1 (.a(a[15:0]), .b(b[15:0]), .cin(cin), .sum(sum[15:0]), .cout(bit_carry[0]));
CSelectAdder_16bit csa_16_2 (.a(a[31:16]), .b(b[31:16]), .cin(bit_carry[0]), .sum(sum[31:16]), .cout(bit_carry[1]));
CSelectAdder_16bit csa_16_3 (.a(a[47:32]), .b(b[47:32]), .cin(bit_carry[1]), .sum(sum[47:32]), .cout(bit_carry[2]));
CSelectAdder_16bit csa_16_4 (.a(a[63:48]), .b(b[63:48]), .cin(bit_carry[2]), .sum(sum[63:48]), .cout(cout));

endmodule //Con_sa_8_bit_block_64

module Con_sa_8_bit_block_64 (    
    a,b,cin,sum,cout
);

input [63:0]a,b;
input cin;
output [63:0]sum;
output cout;
wire [6:0]bit_carry;

CSelectAdder_8bit csa_8_1 (.a(a[7:0]), .b(b[7:0]), .cin(cin), .sum(sum[7:0]), .cout(bit_carry[0]));
CSelectAdder_8bit csa_8_2 (.a(a[15:8]), .b(b[15:8]), .cin(bit_carry[0]), .sum(sum[15:8]), .cout(bit_carry[1]));
CSelectAdder_8bit csa_8_3 (.a(a[23:16]), .b(b[23:16]), .cin(bit_carry[1]), .sum(sum[23:16]), .cout(bit_carry[2]));
CSelectAdder_8bit csa_8_4 (.a(a[31:24]), .b(b[31:24]), .cin(bit_carry[2]), .sum(sum[31:24]), .cout(bit_carry[3]));
CSelectAdder_8bit csa_8_5 (.a(a[39:32]), .b(b[39:32]), .cin(bit_carry[3]), .sum(sum[39:32]), .cout(bit_carry[4]));
CSelectAdder_8bit csa_8_6 (.a(a[47:40]), .b(b[47:40]), .cin(bit_carry[4]), .sum(sum[47:40]), .cout(bit_carry[5]));
CSelectAdder_8bit csa_8_7 (.a(a[55:48]), .b(b[55:48]), .cin(bit_carry[5]), .sum(sum[55:48]), .cout(bit_carry[6]));
CSelectAdder_8bit csa_8_8 (.a(a[63:56]), .b(b[63:56]), .cin(bit_carry[6]), .sum(sum[63:56]), .cout(cout));

endmodule
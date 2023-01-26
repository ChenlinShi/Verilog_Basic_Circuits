module ext (
    input_imm,output_imm
);
input [15:0] input_imm;
output [31:0] output_imm;

assign output_imm=(input_imm[15])?{16'hFFFF,input_imm}:{16'h0000,input_imm};

endmodule //ext
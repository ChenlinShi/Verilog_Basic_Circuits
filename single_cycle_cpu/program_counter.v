module program_counter (
    current_addr_pc,results_addr, clk,rst
);
input   [31:0] current_addr_pc;
input clk, rst;
output reg [31:0]results_addr;  //cannot use current_addr as a output.
always @(posedge clk or negedge rst) begin
    if (~rst) begin
      results_addr<=0; // reset.
    end
    else begin
        results_addr <=current_addr_pc; //output the instruction address.
    end
end

endmodule //program_counter

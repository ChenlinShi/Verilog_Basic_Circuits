module multiplexer(output mux_out , input sel, a,b);

assign mux_out=(sel)?a:b;


endmodule
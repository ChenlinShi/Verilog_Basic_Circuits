module decoder (
    op,func,alu_func,ram_load,ram_write,jump,imm_enable
);
input [5:0]op;
input [3:0]func;

output reg [2:0]alu_func;
output ram_write,ram_load,jump,imm_enable;
reg ram_write_true, ram_load_true,jump_true,imm_enable_true;
wire add,sub,and_op,or_op,slt,addi,andi,ori,slti,lw,sw,jump_op;
wire alu_op_value;

wire [6:0]case_test; 
wire [4:0]r_case_test;

assign add   =~func[3]&~func[2]&~func[1]&~func[0];//0000
assign sub   =~func[3]&~func[2]& func[1]&~func[0];//0010
assign and_op=~func[3]& func[2]&~func[1]&~func[0];//0100
assign or_op =~func[3]& func[2]&~func[1]& func[0];//0101
assign slt   = func[3]&~func[2]& func[1]&~func[0];//1010


assign alu_op_value= ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]; //000000
assign addi=~op[5]&~op[4]& op[3]&~op[2]&~op[1]&~op[0];//001000
assign andi=~op[5]&~op[4]& op[3]& op[2]&~op[1]&~op[0];//001100
assign ori =~op[5]&~op[4]& op[3]& op[2]&~op[1]& op[0];//001101
assign slti=~op[5]&~op[4]& op[3]&~op[2]& op[1]&~op[0];//001010
assign sw  = op[5]&~op[4]& op[3]&~op[2]& op[1]& op[0];//101011
assign lw  = op[5]&~op[4]&~op[3]&~op[2]& op[1]& op[0];//100011
assign jump_op  = ~op[5]&~op[4]&~op[3]&~op[2]&op[1]&~op[0];//000010


assign r_case_test[4:0]={add,sub,and_op,or_op,slt};//for R type case
assign case_test[6:0]={addi,andi,ori,slti,sw,lw,jump_op};//for other type case

always @ (*) begin
    ram_write_true <=0; // before every new loop, set everyone to zero.
    jump_true      <=0; // before every new loop, set everyone to zero.
    ram_load_true  <=0; // before every new loop, set everyone to zero.
    alu_func       <=0; // before every new loop, set everyone to zero.
    imm_enable_true<=0; // before every new loop, set everyone to zero.
    if(alu_op_value)begin
        case (r_case_test)
        5'b10000  : alu_func <=3'b001 ;
        5'b01000  : alu_func <=3'b010 ;
        5'b00100  : alu_func <=3'b011 ;
        5'b00010  : alu_func <=3'b100 ;
        5'b00001  : alu_func <=3'b101 ;
        endcase
    end
        else if(case_test[6:3]) begin
        imm_enable_true     <=1;
        case (case_test)
        7'b1000000  : alu_func <=3'b001 ;
        7'b0100000  : alu_func <=3'b011 ;
        7'b0010000  : alu_func <=3'b100 ;
        7'b0001000  : alu_func <=3'b101 ;
        endcase
    end 
        else if(case_test[2:0]) begin 
        case (case_test)
        7'b0000100  : ram_write_true <=1 ;
        7'b0000010  : ram_load_true  <=1 ;
        7'b0000001  : jump_true      <=1 ;
        endcase
    end    
end

assign ram_load=(ram_load_true)?1:0; 
assign ram_write=(ram_write_true)?1:0;
assign jump=(jump_true)?1:0;
assign imm_enable=(imm_enable_true)?1:0;


endmodule //decoder
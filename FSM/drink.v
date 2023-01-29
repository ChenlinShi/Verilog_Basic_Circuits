// input coin :2 and 1  sell drink when input coin is 4 enough and give change automatically

module drink_FSM (
    coin,
    change,
    drink,
    clk,
    rst
);
input  clk,rst; 
input [1:0] coin;// 0 means 0 ,  1 means 1, 2 means 2.
output reg [1:0] change ; //0 means 0, 1 means 1, 2 means 2;
output reg drink;
parameter            init   = 3'd0 ;
parameter            GET_1  = 3'd1 ;
parameter            GET_2  = 3'd2 ;
parameter            GET_3  = 3'd3 ;

reg [2:0]current_state;
reg [2:0]next_state;

always @(posedge clk or negedge rst) begin
    if (~rst)begin
        current_state<=init;
    end
    else begin
        current_state<=next_state;
    end
end

always @(*) begin
   case (current_state)

      init : case (coin)
              1:next_state<= GET_1;
              2:next_state<= GET_2;
       default: next_state<= current_state; 
             endcase 
      GET_1 : case (coin)
              1:next_state<= GET_2;
              2:next_state<= GET_3;
       default: next_state<= current_state; 
              endcase 
      GET_2 : case (coin)
              1:next_state<= GET_3;
              2:next_state<= init;
       default: next_state<= current_state; 
              endcase 
      GET_3 : case (coin)
              1:next_state<= init;
              2:next_state<= init;
       default: next_state<= current_state; 
              endcase 
             
    default: next_state<=init;
   endcase
end
always @(posedge clk or negedge rst) begin
    change <=0;
    drink  <=0;
    if (~rst)begin
        change <=0;
        drink  <=0;
    end
    else if (current_state==GET_3&&coin==1) begin
        drink  <=1;
    end
    else if (current_state==GET_3&&coin==2)begin
        drink  <=1;
        change <=1;
    end
    else if (current_state==GET_2&&coin==2)begin
        drink  <=1;
    end
end


endmodule //drink
//==============================================================================
// Module      : gray_counter_fsm
// Description : 2-bit Gray code counter implemented as a Moore FSM.
//               States A->B->C->D->A step through the Gray sequence
//               00 -> 01 -> 11 -> 10 -> 00, so only one bit changes per
//               transition.
// Inputs      : clk, rst - asynchronous reset, active high
// Outputs     : y[1:0]   - current Gray code output
//==============================================================================
module gray_counter_fsm (
    input             clk,
    input             rst,
    output reg [1:0] y
);

  parameter [1:0] STATE_A = 2'b00, STATE_B = 2'b01, STATE_C = 2'b10, STATE_D = 2'b11;

  reg [1:0] current_state, next_state;

  // State register: asynchronous, active-high reset.
  always @(posedge clk or posedge rst) begin
    if (rst) current_state <= STATE_A;
    else current_state <= next_state;
  end

  // Next-state logic
  always @(*) begin
    case (current_state)
      STATE_A: next_state = STATE_B;
      STATE_B: next_state = STATE_C;
      STATE_C: next_state = STATE_D;
      STATE_D: next_state = STATE_A;
      default: next_state = STATE_A;
    endcase
  end

  // Output logic (Moore: depends only on current_state)
  always @(*) begin
    case (current_state)
      STATE_A: y = 2'b00;
      STATE_B: y = 2'b01;
      STATE_C: y = 2'b11;
      STATE_D: y = 2'b10;
      default: y = 2'b00;
    endcase
  end

endmodule

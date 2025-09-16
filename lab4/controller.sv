// Bohdan Purtell
// University of Florida
// Controller pour da Tingy

module controller #(
  parameter int width = 32
) (
  input logic clk,
  input logic rst,
  input logic en,

  output logic out_data,
  output logic en_addressgen1
);

typedef enum {
  idle,
  range0_to_50,
  range50_to_infinity,
  compute
} state_t;

state_t current_state, next_state;

logic [9:0] counter;
logic [9:0] counter_next;

// reg proc
always_ff @(posedge clk)
begin
  if (rst) begin
    counter <= 0;
    current_state <= idle;
  end else begin
    if (en) begin
      counter <= counter_next;
      current_state <= next_state;
    end
  end
end

// next state logic
always_comb
begin
  next_state = current_state;
  counter_next = counter;

  case (current_state)
    idle : begin
      next_state = range0_to_50;
    end

    range0_to_50 : begin
      if (counter == 'd10) begin
        next_state = range50_to_infinity;
      end else begin
        counter_next = counter + 1;
      end
    end

    range50_to_infinity : begin
      en_addressgen1 = 1;
    end

  endcase
end

endmodule


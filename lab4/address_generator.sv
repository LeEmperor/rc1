// Bohdan Purtell
// University of Florida
// Lab 4 Adresse Generators

module address_generator (
  input logic clk,
  input logic rst,
  input logic en,

  output logic [9:0] addr
);

logic [9:0] addr_counter;
logic [9:0] addr_counter_next;

assign addr = addr_counter;

always_ff @(posedge clk)
begin
  if (rst) begin
    addr_counter <= 0;
  end else begin
    addr_counter <= addr_counter_next;
  end
end

always_comb
begin
  if (en) begin
    addr_counter_next = addr_counter + 1;
  end else begin
    addr_counter_next = addr_counter;
  end
end

endmodule


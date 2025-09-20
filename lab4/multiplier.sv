// Bohdan Purtell
// Univeristy of Florida
// Description: Multiplier

module multiplier #(
  parameter int width = 16
) (
  input logic clk,
  input logic rst,
  input logic en,

  input logic [7:0] a,
  input logic [7:0] b,
  output logic [15:0] out
);

always_comb
begin
  out = { {8{1'b0}}, a} * { {8{1'b0}}, b};
end

endmodule


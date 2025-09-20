// Bohdan Purtell
// University of Florida
// Adder Module (17 bits)

module adder #(
  parameter int width = 16
) (
  input logic clk,
  input logic rst,
  input logic en,

  input logic [width - 1 : 0] a,
  input logic [width - 1 : 0] b,
  output logic [width : 0] out
);

// logic [width : 0] wide_a;
// logic [width : 0] wide_b;
// logic [width : 0] wide;

always_comb
begin
  out[width : 0] = {1'b0, a} + {1'b0, b};
end

endmodule


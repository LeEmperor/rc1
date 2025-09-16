// Bohdan Purtell
// University of Florida
// Adder Module (17 bits)

module adder #(
  parameter int width = 16
) (
  input logic clk,
  input logic rst,
  input logic en,

  output logic [width - 1 : 0] a,
  output logic [width - 1 : 0] b,
  output logic [width : 0] c 
);

always_comb
begin
  c[width - 1 : 0] = a + b;
  c[width] = 
end

endmodule


// Bohdan Purtell
// University of Florida
// reg

module reg_lmao #(
  parameter int width = 32
) (
  input logic clk, rst, en,
  input logic [width - 1 : 0] d,
  output logic [width - 1 : 0] q
);

always_ff @(posedge clk, posedge rst)
begin
  if (rst) begin
    q <= 0;
  end else if (en) begin
    q <= d;
  end
end

endmodule


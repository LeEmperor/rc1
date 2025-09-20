// Bohdan Purtell
// University of Florida
// Toplevel

module toplevel (
  input logic clk_hifreq,
  input logic rst, 
  input logic en,

  input logic [7:0] in1,
  input logic [7:0] in2,
  input logic [7:0] in3,
  input logic [7:0] in4,
  output logic [16:0] outdata
);

// wires
logic [7:0] wire_reg_in1;
logic [7:0] wire_reg_in2;
logic [7:0] wire_reg_in3;
logic [7:0] wire_reg_in4;

logic [15:0] wire_reg_mult1;
logic [15:0] wire_reg_mult2;

logic wire_en;
logic [9:0] wire_addr;

// assign outdata = wire_addr;

controller control (
  .clk(clk_hifreq),
  .rst(rst),
  .en(en),
  .out_data(),
  .en_addressgen1(wire_en)
);

address_generator addr_gen (
  .clk(clk_hifreq),
  .rst(rst),
  .en(wire_en),

  .addr(wire_addr)
);

multiplier mult1 (
  .clk(clk_hifreq),
  .rst(rst),
  .en(wire_en),
  .a(wire_reg_in1),
  .b(wire_reg_in2),
  .out(wire_reg_mult1)
);

multiplier mult2 (
  .clk(clk_hifreq),
  .rst(rst),
  .en(wire_en),
  .a(wire_reg_in3),
  .b(wire_reg_in4),
  .out(wire_reg_mult2)
);

adder add1 (
  .clk(clk_hifreq),
  .rst(rst),
  .en(wire_en),
  .a(wire_reg_mult1),
  .b(wire_reg_mult2),
  .out(outdata)
);

endmodule


// Bohdan Purtell
// University of Florida
// Toplevel

module toplevel (
  input logic clk_hifreq,
  input logic rst, 
  input logic en,

  output logic [9:0] outdata
);

// wires
logic wire_en;
logic [9:0] wire_addr;

assign outdata = wire_addr;

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

endmodule


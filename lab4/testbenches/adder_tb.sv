// Bohdan Purtell
// University of Florida
// Testbench Template

module adder_tb();
  // clocks
  logic t_clk1;
  logic clk1_en;
  logic t_clk2;
  logic clk2_en;
  logic t_clk3;
  logic clk3_en;

  // control
  logic t_rst;
  logic t_en;

  // monitor
  wire [16:0] t_dataout;

  // stim
  logic [15:0] t_a;
  logic [15:0] t_b;

adder dut (
    .clk(t_clk1),
    .rst(t_rst),
    .en(t_en),

    .a(t_a),
    .b(t_b),

    .out(t_dataout)
  );

  // clock proc
  initial begin : CLK_GEN
    t_clk1 = 0;
    forever #5 t_clk1 = ~t_clk1 & clk1_en;
  end

  // main
  initial begin : MAIN
    clk1_en = 1;
    t_rst = 1;
    t_a = 0;
    t_b = 0;
    #10

    t_rst = 0;
    #10

    // mettre les truc voici

    t_a = 16'h20;
    t_b = 16'h19;
    #10

    t_a = {16{1'b1}};
    t_b = {16{1'b1}};
    #10

    #50
    clk1_en = 0;
    disable CLK_GEN;
  end

endmodule


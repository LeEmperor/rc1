// Bohdan Purtell
// University of Florida
// Testbench Template

module template_tb();
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
  wire [31:0] t_dataout;

  // stim
  logic [31:0] t_datain;

  // test dut # (
  //   .width(32)
  // ) (
  //
  // );

  test dut (
    .clk_hifreq(t_clk1),
    .rst(t_rst),
    .en(t_en),

    .datain(t_datain),
    .dataout(t_dataout)
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
    t_datain = 0;
    #10

    t_rst = 0;
    #10

    // mettre les truc voici

    #50
    clk1_en = 0;
    disable CLK_GEN;
  end

endmodule


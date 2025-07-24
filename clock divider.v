module tb_clock_divider;
  reg clock_in;
  wire clock_out;
  clock_divider uut (.clock_in(clock_in), .clock_out(clock_out));
  initial begin
    clock_in = 0;
    forever #10 clock_in = ~clock_in;
  end
  initial begin
    $dumpfile("clock_divider.vcd");
    $dumpvars;
    #1000;
    $finish;
  end
endmodule
// Code your testbench here
// or browse Examples
module encoder_2_4_tb;
  reg x1,x2;
  wire y0,y1,y2,y3;
  encoder_2_4  encoder(x1,x2,y0,y1,y2,y3);
  initial begin
    $monitoer(*At time %0t;x1 =%b,x2 =%b,y0 =%b,y1= %b,y2 =%b,y3 =%b)
    ($ time,x1,x2,y0,y1,y2,y3);
    $dumpfile ("encoder_red");
    $dumpvars;
       x1=0; x2=0; #1;
       x1=0; x2=1; #1;
       x1=1; x2=0; #1;
       x1=1; x2=1; 
    end
endmodule
  

`timescale 1ns/1ns

module VGA_TB();

//assuming clock is running at 40MHz
logic clk;
always #1 clk=~clk;

logic r, g, b;
logic vsync, hsync;
logic reset;

VGA vga(
.clk(clk),
.reset(reset),
.vsync(vsync),
.hsync(hsync),
.red(r),
.grn(g),
.blu(b)
);

initial begin
$dumpfile("waves.vcd");
$dumpvars(0, vga);
clk=1'b0;
reset = 1;
#1
reset = 0;
#1




#663200

$stop; 
end

endmodule

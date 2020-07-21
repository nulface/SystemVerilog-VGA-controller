
module top(clk50hz, reset, vsync, hsync, red, grn, blu);

input logic clk50hz, reset;
logic clk40hz;
output logic vsync, hsync, red, grn, blu;


//PLL40hz pll (clk50hz, clk);

//PLL10647Hz pll(clk50hz, clk);

PLL234MHz(clk50hz, clk);

vga 
///* 1440x900 */ #(.width(1440), .h_front_porch(1520), .h_sync_pulse(1672), .h_back_porch(1904), .height(900), .v_front_porch(901), .v_sync_pulse(904), .v_back_porch(932))
/* 1920x1080 */#(.width(1920), .h_front_porch(2048), .h_sync_pulse(2256), .h_back_porch(2600), 
.height(1080), .v_front_porch(1081), .v_sync_pulse(1084), .v_back_porch(1500))
mvga(clk, ~reset, vsync, hsync, red, grn, blu);



endmodule

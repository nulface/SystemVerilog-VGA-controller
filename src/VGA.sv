
module vga
#(parameter width  = 800, h_front_porch = 840, h_sync_pulse = 968, h_back_porch = 1056,
	    height = 600, v_front_porch = 601, v_sync_pulse = 605, v_back_porch = 628  )

(clk, reset, vsync, hsync, red, grn, blu);
input logic clk, reset;
output logic vsync, hsync, red, grn, blu;

logic [10:0] h_count; //horizontal counter, 11 bits.
logic [10:0] v_count; //vertical   counter, 11 bits.

logic [10:0] x_pos;
logic [10:0] y_pos;
logic [31:0] counter;

frame #(.width(width), .height(height)) f(.*);

always_ff @ (posedge clk or posedge reset) begin

if(reset) begin
h_count <= 11'b0; v_count <= 10'b0; x_pos <= 0; y_pos <= 100; counter <= 0;
end else begin 

	
	if(counter == 106470000/100 ) begin
		counter <= 0;
		x_pos = x_pos + 1'b1;
		y_pos = y_pos + 1'b1;
	end else counter = counter + 1'b1;
	
	if(x_pos == 1440) begin
		x_pos <= 0;
	end
	
	if(y_pos == 500) begin
		y_pos <= 100;
	end
	
	
	h_count <= h_count + 1'b1;
		
	if(h_count >= h_front_porch && h_count < h_sync_pulse) hsync <= 1'b1; else hsync <= 1'b0;
		
	if(v_count >= v_front_porch && v_count < v_sync_pulse) vsync <= 1'b1; else vsync <= 1'b0;

	if( h_count >= h_back_porch ) begin
		h_count <= 0;
		v_count <= v_count + 1'b1;
	end

	if( v_count >= v_back_porch) v_count <= 0;

end //reset

end //always_ff

endmodule

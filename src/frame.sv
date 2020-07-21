
module frame

#(parameter width = 800, height = 600)

(clk, h_count, v_count, x_pos, y_pos, red, grn, blu);

input logic clk;
input logic [10:0] h_count, v_count, x_pos, y_pos; 

output red, grn, blu;

always_ff @ (posedge clk) begin


if( v_count >= 0 && v_count < height && h_count >= 0 && h_count < width) begin
//this is inside of the frame

		if( v_count > 100 && v_count < 200 && h_count > 100 && h_count < 200)begin
		red <= 1'b1;
		grn <= 1'b1;
		blu <= 1'b1;
		end 
		else if( v_count > 400 && v_count < 500 && h_count > 300 && h_count < 600)begin
		red <= 1'b1;
		grn <= 1'b1;
		blu <= 1'b1;
		end 
		else if((h_count - x_pos)**2 + (v_count - 300)**2 <= 300)begin
		red <= 1'b1;
		grn <= 1'b1;
		blu <= 1'b1;
		end 
		else begin
		red <= 1'b0;
		grn <= 1'b0;
		blu <= 1'b0;
		end
		
		
end else begin
//this is outside of the frame
		red <= 1'b0;
		grn <= 1'b0;
		blu <= 1'b0;
end




end //always_ff


endmodule

/*
//display multiple things at once
		if( v_count > 100 && v_count < 200 && h_count > 100 && h_count < 200)begin
		red <= 1'b1;
		grn <= 1'b1;
		blu <= 1'b1;
		end 
		else if( v_count > 400 && v_count < 500 && h_count > 300 && h_count < 600)begin
		red <= 1'b1;
		grn <= 1'b1;
		blu <= 1'b1;
		end 
		else if((h_count - x_pos)**2 + (v_count - 300)**2 <= 300)begin
		red <= 1'b1;
		grn <= 1'b1;
		blu <= 1'b1;
		end 
		else begin
		red <= 1'b0;
		grn <= 1'b0;
		blu <= 1'b0;
		end

*/




/*

//( (h_count - x_pos)**2 + (v_count - 300)**2 <= 300)
	if( 
		((h_count == 0 || h_count == width -1) && v_count >= 0 && v_count < height) 
	|| ((v_count == 0 || v_count == height-1) && h_count >= 0 && h_count < width )
	
	) begin
		red <= 1'b1;
		grn <= 1'b1;
		blu <= 1'b1;
	end else begin
		red <= 1'b0;
		grn <= 1'b0;
		blu <= 1'b0;
	end
*/
module	flip_flop
(
	input	wire	sys_clk,
	input	wire	sys_rst,
	input	wire	led_in ,
	
	output	reg		led_out
);
//always@(posedge sys_clk or negedge sys_rst) 
always@(posedge	sys_clk)
	begin
		if(sys_rst	==	1'b0)
			led_out <= 1'b0;
		else	
			led_out <= led_in;
	end	
	
endmodule
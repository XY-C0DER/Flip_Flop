`timescale  1ns/1ns
module  tb_d_flip_flop();

wire    	   	led_out;

reg             sys_clk;
reg             sys_rst;
reg             led_in ; 

initial begin
    sys_clk <= 1'b0;
    sys_rst <= 1'b0;
    led_in  <= 1'b0;
end

always #10	sys_clk	= ~sys_clk;
always #10  sys_rst <= {$random} % 2;	  
always #10  led_in 	<= {$random} % 2;

initial begin
    $timeformat(-9, 0, "ns", 6);
    $monitor("@time %t: clk=%b rst=%b in=%b out=%b", $time, sys_clk, sys_rst, led_in, led_out);
end

d_flip_flop  d_flip_flop_inst(
    .sys_clk    (sys_clk),  
    .sys_rst    (sys_rst),  
    .led_in     (led_in ),  

    .led_out    (led_out)   
);

endmodule
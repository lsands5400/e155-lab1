// Lindsey Sands
// lsands@g.hmc.edu
// 09-06-2026
// This is the top module for E155 Lab 1.
module lab1_ls(input logic reset, en,
				input logic[3:0] s,
				
				output logic[2:0] led, 
				output logic[6:0] seg);
				
	logic int_osc;
				
	// Internal high-speed oscillator
	HSOSC #(.CLKHF_DIV(2'b00))
		clk (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	// Seven Segment Display module instantiation
	sevenSegDP dp(s, seg);
	
	// led[0] = s[1] XOR s[0]
	assign led[0] = s[1] ^ s[0];
	
	// led[1] = s[3] AND s[2]
	assign led[1] = s[3] && s[2];
	
	// led[2] blinks at 2.4Hz
	counterLED counter(int_osc, reset, en, led[2]);
	
endmodule
	
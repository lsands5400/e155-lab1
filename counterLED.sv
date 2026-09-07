// Lindsey Sands
// lsands@g.hmc.edu
// 09-06-2026
// This is the counter module for E155 Lab 1. It blinks an LED at 2.4Hz. 
// The code is based on the demo at 
// https://hmc-e155.github.io/tutorials/tutorial-posts/lattice-radiant-ice40-ultraplus-project-setup/
module counterLED(input logic reset, en,
					output logic led);
	logic int_osc;
	logic [24:0] counter;
	logic max;
	
	assign max = $size(counter);
	
	// Internal high-speed oscillator
	HSOSC #(.CLKHF_DIV(2'b00))
		hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	// Counter
	always_ff@(posedge int_osc) begin
		
		// Reset count if reset button pushed or count gets to maximum value
		if((reset == 0)||(counter = max)) counter <= 0;
			
		// Increment counter the same if enable is on		
		else if(en)		   				  counter <= counter + 1;
	end
	
	// Assign LED output
	assign led = counter[24];

endmodule
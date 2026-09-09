// Lindsey Sands
// lsands@g.hmc.edu
// 09-06-2026
// This is the counter module for E155 Lab 1. It blinks an LED at 2.4Hz. 
// The code is based on the demo at 
// https://hmc-e155.github.io/tutorials/tutorial-posts/lattice-radiant-ice40-ultraplus-project-setup/
module counterLED #(parameter width = 25,
					parameter max = 24'd10_000_000)
					(input logic int_osc, reset, en,
					 output logic led);
					 
	logic [width-1:0] counter; 
	// Counter
	always_ff@(posedge int_osc, negedge reset) begin
		// Reset count if reset button pushed or count gets to maximum value
		// Reset is active LOW
		if((reset == 0)||(counter == max-1)) counter <= 0;
			
		// Increment counter the same if enable is on		
		else if(en)		   				  counter <= counter + 1;
		else							  counter <= counter;
	end
	
	// Assign LED output
	assign led = counter[width-1];

endmodule
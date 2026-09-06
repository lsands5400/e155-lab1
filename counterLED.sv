// Lindsey Sands
// lsands@g.hmc.edu
// 09-06-2026
// This is the counter module for E155 Lab 1. It blinks an LED at 2.4Hz. 
// The code is based on the demo at 
// https://hmc-e155.github.io/tutorials/tutorial-posts/lattice-radiant-ice40-ultraplus-project-setup/
module counterLED(input logic reset,
					output logic led)
	logic int_osc;
	logic [24:0] counter;
	
	// Internal high-speed oscillator
	HSOSC #(.CLKHF_DIV(2'b01) // TODO: adjust to 2.4 Hz
		hf_osc(.CLKHPU(1'b1), .CLKHF(int_osc));
	
	// Counter
	always_ff@(posedge int_osc) begin
		if(reset == 0) counter <=0;
		else		   counter <= counter + 1;
	end
	
	// Assign LED output
	assign led = counter[24];

endmodule
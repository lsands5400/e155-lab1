// Lindsey Sands
// lsands@g.hmc.edu
// 9/7/2026
// This is the testbench for the counter module.
`timescale 1 ns/1 ns

module counter_tb();
	logic			int_osc; 
    logic           reset;  // active high reset
    logic           en;     // enable
    logic           led;    // output LED
    logic [24:0]    counter; // counter
    logic [24:0]          max;    // max count
	
	assign max = 24'd10_000_000;

    counterLED dut(
		.int_osc(int_osc),
        .reset(reset),
        .en(en),
        .led(led)
    );

    // generate clock
    always begin
        int_osc = 0; #5;
        int_osc = 1; #5;
    end
	
	// Counter
	always_ff@(posedge int_osc, negedge reset) begin
		// Reset count if reset button pushed or count gets to maximum value
		// Reset is active LOW
		if((reset == 0)||(counter == max-1)) counter <= 0;
			
		// Increment counter the same if enable is on		
		else if(en)		   				  counter <= counter + 1;
		else							  counter <= counter;
	end

    // apply stimuli and check outputs
    initial begin
		// verify reset (Reset is active low)
		reset = 0;
		#22 reset = 1;            
		en = 1;
		#100;                        // wait required time
		assert (counter > 0)       // check outputs
		else 
			$error("Reset test 1 failed.");
		reset = 0;	
		#10;
		assert (counter == 0)       // check outputs
		else 
			$error("Reset test 2 failed."); 
		// verify enable
		reset = 0;
		en = 0;
		#22 reset = 1;              
		#50;
		assert (counter == 0)
		else 
			$error("Enable test 1 failed.");
		en = 1;
		#50;
		assert (counter != 0)
		else 
			$error("Enable test 2 failed."); 
		// verify max count
		reset = 0;
		#22 reset = 1;          
		en = 1;
		#100_000_000;
		assert (counter == 0)
		else 
			$error("Max count test failed."); 

        #100 $stop;
    end
endmodule
// Lindsey Sands
// lsands@g.hmc.edu
// 9/7/2026
// This is the testbench for the Lab 1 top module.
`timescale 1 ns/1 ns

module lab1_tb();
  logic           clk;    // system clock
  logic           reset;  // active high reset
  logic   [3:0]   s;      // 4-bit input switches
  logic   [2:0]   led;    // 3 output leds
  logic   [6:0]   seg;    // seven segment display
  logic 		  int_osc;
  logic			  counter;
  logic			  en;
 
 assign en = 1;

    lab1_ls dut (
        .reset(reset),
		.en(en),
        .s(s),
        .led(led),
		.seg(seg)
    );
	
	HSOSC #(.CLKHF_DIV(2'b00))
		dut2 (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

  // generate clock
  always begin
      clk = 0; #5;
      clk = 1; #5;
  end

  // apply stimuli and check outputs
  initial begin
    reset = 1;
    #22 reset = 0;

    // No-LED test
	s = 4'b0000;                // setup inputs
	#10;                        // wait required time
	assert (led == 2'b00)       // check outputs
	else 
		$error("No-LED test failed."); 
		
    // LED[0] test
	s = 4'b0001;
	#10;
	assert (led == 2'b01)
	else 
		$error("LED[0] test failed.", $time); 

    // LED[1] test
	s = 4'b1100;
	#10;
	assert (led == 2'b10)
	else 
		$error("LED[1] test failed.", $time); 
        
    // HSOSC test
	#22;
	assert (int_osc == 1)
	else 
		$error("HSOSC failed.", $time); 

    // Seven Segment Display integration test
    s = 4'b0000;
	#10;
	assert (seg == 7'b1000000)
	else 
		$error("Seven segment display integration failed.", $time); 

    // Counter integration test
	reset = 0;
    #50 reset = 1; 
	#80
	assert (led[2] == 1)
	else 
		$error("Counter integration failed.", $time); 

    #100 $stop;
  end
endmodule
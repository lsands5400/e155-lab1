// Lindsey Sands
// lsands@g.hmc.edu
// 9/7/2026
// This is the testbench for the Lab 1 top module.
`timescale 1 ns/1 ns

module lab1_led_controller_tb();
  logic           clk;    // system clock
  logic           reset;  // active high reset
  logic   [3:0]   s;      // 4-bit input switches
  logic   [1:0]   led;    // 2 output leds

    lab1_led_controller dut (
        .clk(clk),
        .reset(reset),
        .s(s),
        .led(led)
    );

  // generate clock
  always begin
      clk = 0; #5;
      clk = 1; #5;
  end

  // apply stimuli and check outputs
  initial begin
    reset = 1;
    #22 reset = 0;

    // No LED test
        s = 4'b0000;                // setup inputs
        #10;                        // wait required time
        assert (led == 2'b00)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
            
    // LED[0] test
        s = 4'b0001;
        #10;
        assert (led == 2'b01)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 

    // LED[1] test
        s = 4'b1100;
        #10;
        assert (led == 2'b10)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
        
    // HSOSC test
    // TODO

    // Seven Segment Display integration test
    // TODO

    // Counter integration test
    // TODO

    #100 $stop;
  end
endmodule
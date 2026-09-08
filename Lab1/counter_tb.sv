// Lindsey Sands
// lsands@g.hmc.edu
// 9/7/2026
// This is the testbench for the counter module.
`timescale 1 ns/1 ns

module counter_tb();
    logic           clk;    // system clock
    logic           reset;  // active high reset
    logic           en;     // enable
    logic           led;    // output LED
    logic [24:0]    counter; // counter
    logic           max;    // max count

    counter dut(
        .reset(reset),
        .en(en),
        .led(led)
    );

    // generate clock
    always begin
        clk = 0; #5;
        clk = 1; #5;
    end

    // apply stimuli and check outputs
    initial begin

        // verify reset
        reset = 1;
        #22 reset = 0;            
        counter = 0;
        en = 1;
        #10;                        // wait required time
        reset = 1;
        // TODO: Do I need wait time here?
        assert (counter = 0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
            
        // verify enable
        reset = 1;
        #22 reset = 0;              
        counter = 0;
        en = 0;
        #10;
        assert (counter = 0)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
        
        // verify max count
        reset = 1;
        #22 reset = 0;          
        en = 0;
        #10;
        assert (counter = 0)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
        en = 1;
        #10;
        assert (counter > 0)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
      
        #100 $stop;
    end
endmodule
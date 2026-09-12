// Lindsey Sands
// lsands@g.hmc.edu
// 09-06-2026
// This is the counter module for E155 Lab 1. It blinks an LED at 2.4Hz. 
// The code is based on the demo at 
// https://hmc-e155.github.io/tutorials/tutorial-posts/lattice-radiant-ice40-ultraplus-project-setup/
module counterLED #(
    parameter int width = 23,
    parameter int max   = 5_000_000
)(
    input  logic int_osc,
    input  logic reset,
    input  logic en,
    output logic led
);

    logic [width-1:0] counter;

    // Counter
    always_ff @(posedge int_osc, negedge reset) begin

        // Reset counter and LED when reset is pressed
        // Reset is active LOW
        if (!reset) begin
            counter <= '0;
            led     <= 1'b0;
        end

        // Toggle LED every 5,000,000 clock cycles
        else if (en) begin
            if (counter == max - 1) begin
                counter <= '0;
                led     <= ~led;
            end
            else begin
                counter <= counter + 1'b1;
            end
        end

    end

endmodule

// Lindsey Sands
// lsands@g.hmc.edu
// 9/7/2026
// This is the testbench for the seven segment display module.
`timescale 1 ns/1 ns
 
module ssdp_tb();
    logic   [3:0]   value;    // 4 input bits
    logic   [6:0]   led; // Seven segment display LEDs

    // instantiate device under test
    sevenSegDP dut(.value(value),
                    .led(led));

    // apply inputs one at a time
    // checking results
    initial begin
        s = 4'b0000; #10;
        assert (led === 7'b1000000) else $error("0000 (0) failed.");
        s = 4'b0001; #10;
        assert (led === 7'b1111001) else $error("0001(1) failed.");
        s = 4'b0010; #10;
        assert (led === 7'b0100100) else $error("0010(2) failed.");
        s = 4'b0011; #10;
        assert (led === 7'b0110000) else $error("0011(3) failed.");
        s = 4'b0100; #10;
        assert (led === 7'b0011001) else $error("0100(4) failed.");
        s = 4'b0101; #10;
        assert (led === 7'b0010010) else $error("0101(5) failed.");
        s = 4'b0110; #10;
        assert (led === 7'b0000010) else $error("0110(6) failed.");
        s = 4'b0111; #10;
        assert (led === 7'b0000111) else $error("0111(7) failed.");
        s = 4'b1000; #10;
        assert (led === 7'b0000000) else $error("1000(8) failed.");
        s = 4'b1001; #10;
        assert (led === 7'b0011000) else $error("1001(9) failed.");
        s = 4'b1010; #10;
        assert (led === 7'b0001000) else $error("1010(A) failed.");
        s = 4'b1011; #10;
        assert (led === 7'b0000011) else $error("1011(b) failed.");
        s = 4'b1100; #10;
        assert (led === 7'b1000110) else $error("1100(C) failed.");
        s = 4'b1101; #10;
        assert (led === 7'b0100001) else $error("1101(d) failed.");
        s = 4'b1110; #10;
        assert (led === 7'b0000110) else $error("1110(E) failed.");
        s = 4'b1111; #10;
        assert (led === 7'b0001110) else $error("1111(F) failed.");
    end
endmodule
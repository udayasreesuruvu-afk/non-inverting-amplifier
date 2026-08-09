`timescale 1ns/1ps

module tb_non_inverting_amplifier;

    real vin;
    wire real vout;

    // Device Under Test
    non_inverting_amplifier #(
        .GAIN(10.0)
    ) dut (
        .vin(vin),
        .vout(vout)
    );

    initial begin
        $display("==============================================");
        $display("       NON-INVERTING AMPLIFIER TEST");
        $display("==============================================");
        $display("Gain = 10");
        $display("----------------------------------------------");
        $display("Time(ns)\tVin(V)\t\tVout(V)");
        $display("----------------------------------------------");

        // Test 1
        vin = 0.0;
        #10;
        $display("%0t\t\t%0.2f\t\t%0.2f",
                 $time, vin, vout);

        // Test 2
        vin = 0.1;
        #10;
        $display("%0t\t\t%0.2f\t\t%0.2f",
                 $time, vin, vout);

        // Test 3
        vin = 0.2;
        #10;
        $display("%0t\t\t%0.2f\t\t%0.2f",
                 $time, vin, vout);

        // Test 4
        vin = 0.3;
        #10;
        $display("%0t\t\t%0.2f\t\t%0.2f",
                 $time, vin, vout);

        // Test 5
        vin = 0.5;
        #10;
        $display("%0t\t\t%0.2f\t\t%0.2f",
                 $time, vin, vout);

        // Test 6
        vin = -0.1;
        #10;
        $display("%0t\t\t%0.2f\t\t%0.2f",
                 $time, vin, vout);

        // Test 7
        vin = -0.2;
        #10;
        $display("%0t\t\t%0.2f\t\t%0.2f",
                 $time, vin, vout);

        $display("----------------------------------------------");
        $display("Simulation completed successfully.");
        $display("==============================================");

        $finish;
    end

endmodule
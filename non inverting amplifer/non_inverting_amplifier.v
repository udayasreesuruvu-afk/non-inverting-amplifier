`timescale 1ns/1ps

module non_inverting_amplifier #(
    parameter real GAIN = 10.0
)(
    input  real vin,
    output real vout
);

    always @(*) begin
        vout = GAIN * vin;
    end

endmodule
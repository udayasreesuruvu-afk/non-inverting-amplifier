# Non-Inverting Amplifier Using Verilog

## Overview

This project implements a **non-inverting operational amplifier (op-amp) model** using Verilog HDL.

The design uses a behavioral Verilog model to represent the voltage gain of a non-inverting amplifier.

The selected amplifier parameters are:

```text
R1 = 10 kΩ
Rf = 90 kΩ
Voltage Gain = 10
```

The theoretical voltage gain is:

```text
Av = 1 + Rf/R1
```

Therefore:

```text
Av = 1 + 90/10
Av = 10
```

---

## Circuit

```text
                         Rf = 90kΩ
                    +----/\/\/\/----+
                    |               |
                    |               |
Vin -----> (+)     [ OP-AMP ]------+
             \       |              |
              \      |              +---- Vout
               \     |
                \    |
                 (-)-+
                  |
                 R1 = 10kΩ
                  |
                 GND
```

---

## Working Principle

A non-inverting amplifier applies the input voltage to the positive terminal of the op-amp.

The feedback network is connected between the output and the inverting terminal.

The voltage gain is:

```text
Av = 1 + Rf/R1
```

For this project:

```text
Rf = 90 kΩ
R1 = 10 kΩ
```

Therefore:

```text
Av = 1 + 90/10
Av = 10
```

The output is:

```text
Vout = 10 × Vin
```

Because this is a non-inverting amplifier, the output has the same polarity as the input.

---

## Example

For an input of:

```text
Vin = 0.1 V
```

the output is:

```text
Vout = 10 × 0.1
Vout = 1.0 V
```

For:

```text
Vin = 0.5 V
```

the output is:

```text
Vout = 5.0 V
```

For a negative input:

```text
Vin = -0.2 V
```

the output is:

```text
Vout = -2.0 V
```

---

## Project Structure

```text
non-inverting-amplifier-verilog/
│
├── README.md
├── non_inverting_amplifier.v
├── tb_non_inverting_amplifier.v
│
└── output/
    └── simulation_output.txt
```

---

## Verilog Model

The amplifier is modeled using a parameterized gain:

```verilog
module non_inverting_amplifier #(
    parameter real GAIN = 10.0
)(
    input real vin,
    output real vout
);

    always @(*) begin
        vout = GAIN * vin;
    end

endmodule
```

The gain can be changed by modifying the `GAIN` parameter.

For example:

```text
GAIN = 2
GAIN = 5
GAIN = 10
GAIN = 20
```

---

## Testbench

The testbench applies several positive and negative input voltages and displays the corresponding output.

Test values include:

```text
0.0 V
0.1 V
0.2 V
0.3 V
0.5 V
-0.1 V
-0.2 V
```

---

## Expected Simulation Output

```text
==============================================
       NON-INVERTING AMPLIFIER TEST
==============================================
Gain = 10
----------------------------------------------
Time(ns)        Vin(V)          Vout(V)
----------------------------------------------
10              0.00            0.00
20              0.10            1.00
30              0.20            2.00
40              0.30            3.00
50              0.50            5.00
60             -0.10           -1.00
70             -0.20           -2.00
----------------------------------------------
Simulation completed successfully.
==============================================
```

---

## Simulation

### Requirements

The project can be simulated using a Verilog simulator that supports `real` variables, such as:

* Icarus Verilog
* Questa/ModelSim

This project is intended as a behavioral simulation model.

---

## Icarus Verilog

Compile:

```bash
iverilog -g2012 -o amplifier_sim \
non_inverting_amplifier.v \
tb_non_inverting_amplifier.v
```

Run:

```bash
vvp amplifier_sim
```

---

## Mathematical Verification

The amplifier gain is:

```text
Av = 1 + Rf/R1
```

Using:

```text
Rf = 90 kΩ
R1 = 10 kΩ
```

gives:

```text
Av = 1 + 90/10
Av = 10
```

Therefore:

```text
Vout = 10 × Vin
```

Simulation results agree with the theoretical gain.

---

## Input/Output Table

| Vin (V) | Expected Vout (V) |
| ------: | ----------------: |
|     0.0 |               0.0 |
|     0.1 |               1.0 |
|     0.2 |               2.0 |
|     0.3 |               3.0 |
|     0.5 |               5.0 |
|    -0.1 |              -1.0 |
|    -0.2 |              -2.0 |

---

## Important Note

A real op-amp has practical limitations such as:

* Supply-voltage limits
* Output saturation
* Gain-bandwidth limitations
* Slew rate
* Input offset voltage
* Input/output current limits

This Verilog model represents only the ideal voltage-gain relationship:

```text
Vout = Gain × Vin
```

It does not model those non-ideal effects.

---

## Applications

Non-inverting amplifiers are used in:

* Sensor signal conditioning
* Audio amplification
* Instrumentation systems
* Measurement circuits
* Analog signal processing
* Data acquisition systems
* Voltage amplification

---

## Learning Objectives

This project demonstrates:

* Non-inverting op-amp operation
* Voltage gain calculation
* Behavioral Verilog modeling
* Verilog `real` data types
* Parameterized designs
* Testbench development
* Simulation-based verification

---

## Future Improvements

The model can be extended to include:

* Positive and negative supply rails
* Output saturation
* Slew-rate limitation
* Gain-bandwidth limitation
* Input offset voltage
* Frequency-dependent gain
* AC/sine-wave input
* Transient response
* Low-pass and high-pass amplifier models

---

## License

This project is intended for educational and academic purposes.

---

## Author

**Your Name**

Non-Inverting Amplifier Using Verilog HDL

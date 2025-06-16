# 16-bit RISC-V Processor

This project involves the design and implementation of a simplified 16-bit RISC-V processor using Verilog HDL. Built on the Nexys A7-100T FPGA development board and synthesized using Vivado 2024.2, the processor supports core RISC-V instructions and demonstrates instruction decoding, control logic, data flow, memory access, and real-time output display.

Developed as a part of EE271: Digital System Design and Synthesis at San Jose State University, this processor serves as an educational platform to understand and implement the fundamental concepts of computer architecture.

## What it does

- Executes a subset of the RISC-V instruction set in 16-bit format
- Supports arithmetic, logic, immediate, and branch instructions
- Displays results using a 7-segment display with BCD conversion
- Modular design for ALU, control unit, register file, memory, and display
- Synthesized and deployed on the Nexys A7-100T FPGA board

## Why a 16-bit RISC-V?

RISC-V is commonly implemented in 32-bit and 64-bit architectures, but adapting it to 16 bits allows for:

- Simplified instruction formats suitable for teaching
- Reduced complexity for FPGA resource usage
- Greater accessibility for students to learn processor design

The custom 16-bit adaptation preserves key RISC-V concepts while providing a hands-on experience in digital logic design.

## How it works

- Instructions are fetched from instruction memory using the program counter
- The main control unit decodes the instruction and generates control signals
- ALU performs operations based on ALU control and instruction format
- Register file and data memory handle data access and storage
- Immediate generator and branch adder manage program flow
- Results are converted from binary to BCD and shown on a 5-digit 7-segment display

## Components Used

### Hardware
- Nexys A7-100T FPGA development board
- Onboard peripherals: switches, buttons, 7-segment displays

### Software
- Xilinx Vivado 2024.2 for design, simulation, and synthesis
- Verilog HDL for all hardware modules

## Major Modules

- **Main Control Unit**: Decodes opcodes and drives control signals  
- **ALU & ALU Control**: Performs arithmetic and logic operations  
- **Register File**: Stores operands and intermediate results  
- **Data Memory**: For load/store instructions  
- **Immediate Generator**: Sign-extends instruction fields  
- **Program Counter & Branch Adder**: Handles instruction flow and branching  
- **BCD Converter & 7-Segment Display**: Converts results for user display  

## Simulation & Testing

All modules were tested individually using Verilog testbenches and simulated in Vivado. Simulation covered instruction execution, ALU logic, memory read/write operations, and BCD output validation.

## Future Improvements

- Add pipeline stages to improve throughput  
- Implement hazard detection and forwarding  
- Support full RISC-V ISA including jump and system instructions  
- Integrate UART for serial communication  
- Expand memory size and support external memory interfaces  

## Team

- **Anish Sathaye** – Documentation, datapath design  
- **Sai Preeth Aduwala** – Immediate generator, BCD conversion, FPGA testing  
- **Soumya Guruvenkatesh Katti** – Data memory, MUX, branch adder, testbenches  
- **Siri Simpana Tiptur Shashidharamurthy** – ALU logic, display system, module integration

## Instructor

Prof. Binh Le  
San Jose State University – Department of Electrical Engineering

## Course

EE271: Digital System Design and Synthesis  
Spring 2025
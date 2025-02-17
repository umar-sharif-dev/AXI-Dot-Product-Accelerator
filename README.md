# AXI-Based Dot Product Accelerator

## Project Overview

This project implements a hardware accelerator for computing the dot product of two vectors stored in memory. The accelerator features:

- **AXI-Lite Slave Interface** for register configuration (input vector addresses, vector length, and output address).
- **AXI Master Interface** for reading input data from memory and writing the computed 32-bit dot product back to memory.

The accelerator multiplies corresponding elements of the two vectors and accumulates the results. The final 32-bit dot product is either stored in an internal register or written to a specified output memory address via the AXI master interface.

---

## Functional Requirements

### 1. AXI-Lite Slave Interface

The accelerator includes the following registers:

- **Control Register (REG0)**: Start bit.
- **Vector A Base Address (REG1)**: 32-bit address for the first vector.
- **Vector B Base Address (REG2)**: 32-bit address for the second vector.
- **Vector Length (REG3)**: Number of elements in each vector.
- **Output Address (REG4)**: 32-bit address for storing the dot product result.
- **Status Register (REG5)**: Indicates operation status (e.g., busy, done flags).

### 2. AXI Master Interface

- **Read Operations:**
  - Fetches elements of vector A and vector B from memory using the configured addresses.
  - Supports sequential read access.
- **Write Operation:**
  - Writes the computed 32-bit dot product to the output memory location.

### 3. Dot Product Calculation

For vectors A and B, where each element is an 8-bit signed integer:

\[ result = \sum_{i=0}^{N-1} (A[i] \times B[i]) \]

The internal calculations ensure proper bit-width management:
- Multiplication (int8 × int8) results in at least 16-bit values.
- The accumulated result is stored as a 32-bit integer.

### 4. Control Flow

- Control register (setting the start bit) initiates computation.
- A **Finite State Machine (FSM)** manages the control flow:
  - Reads configuration registers.
  - Initiates and completes AXI master read transactions.
  - Computes the dot product.
  - Writes the result (to an internal register or memory via AXI master write).
  - Updates the status register.

---

## Implementation Guidelines

- **HDL:** Verilog & SystemVerilog.
- **AXI Compliance:** Ensure adherence to AMBA AXI protocol specifications.
- **Modular Design:** Modules for:
  - AXI-Lite register interface
  - AXI master controller
  - Computation engine
  - Control FSM
- **Documentation:** Include a brief design document explaining:
  - Register map
  - FSM design
  - Assumptions about memory model and AXI transactions

---

## Simulation & Verification

### 1. Testbench Requirements

The testbench should:
- Instantiates the accelerator module.
- Simulate AXI-Lite transactions for configuring registers.
- Model memory for AXI master interface and initialize it with known values.
- Verify correct dot product computation.
- Ensure proper FSM operation (idle → busy → done transitions).

### 2. Simulation Tools

Vivado Simulator

---

---

## Project Hierarchy

```
AXI-Dot-Product-Accelerator/
│── diagrams/
│   ├── Block_Diagram.pdf  # Block diagrams and testbench simulation results
│   ├── testbench_sim_results.png  # Screenshot of simulation results
│
│── documentation/  # Contains design documentation
│
│── python_code/  # Python scripts related to verification
│   ├── accum.py  # Python script for computing dot product
│   ├── dot_product_output.txt  # Output file of computed dot product
│
│── src_code/  # Source files for the hardware implementation
│   ├── controller.sv  # Control logic for the accelerator
│   ├── counter.sv  # Counter module for iterations
│   ├── design_1.v  # Main design implementation
│   ├── design_1_wrapper.v  # Wrapper for top-level module
│   ├── dot_product_accel.sv  # Core computation module for dot product
│   ├── regn.sv  # Register handling module
│   ├── top_level.sv  # Top-level module integrating components
│   ├── ip_repo/  # IP repository
│
│── testbench/  # Testbench and related simulation files
│   ├── testbench.sv  # SystemVerilog testbench for verification
│   ├── testbench_behav.wcfg  # Waveform configuration file
│   ├── testbench_sim_results.png  # Screenshot of simulation results
│
└── The_Zynq_Book_ebook.pdf  # Reference book on Zynq architecture
```

---


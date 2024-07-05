# RISC-V 32-bit I-Type Processor

![Processor](processor_image.png)

## Overview

This project implements a complete RISC-V 32-bit I-type processor capable of executing all basic RISC-V instructions. It has been thoroughly tested using an IP tracer to ensure functionality and correctness.


## Features

- **Instruction Set Compatibility**: Supports all basic RISC-V I-type instructions.
- **Instruction Memory**: Includes an instruction memory unit for storing and fetching instructions.
- **Data Memory**: Implements data memory for storing and manipulating data.
- **Control Unit**: Manages instruction execution flow and control signals.
- **IP Tracer Testing**: Tested extensively using an IP tracer to verify instruction execution correctness.


### Installation

1. Clone the repository: `git clone https://github.com/theuppercaseguy/Complete-RISCV-Single-Cycle-Processor.git`
2. add all source and simulation files to Vivado.
3. set TOP_TB as your Top simulation module.
4. Run simulations.
5. use venus to write assembly code and dump it all to the instruction memory file located in rtl/Inst_mem.sv.

## Contributing

We welcome contributions to improve the processor. To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add new feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Create a new Pull Request.

Please ensure your code adheres to our coding standards.

## Contact

For questions or feedback, please contact Saad Khan at saadan060@gmail.com


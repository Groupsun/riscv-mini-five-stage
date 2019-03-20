# RISC-V mini five stage

**This branch contains a simple M-mode interrupt handling scheme**

This is my graduation project of a simple RISC-V 5 stage pipeline processor. I have implemented 38 instructions of the basic RV32I ISA, except the instructions support the operating system.

Instructions include arithmetic and logic instructions, load and store instructions, conditional branch instructions, jump and link instructions and LUI, AUIPC. No operation instruction is also support.

Features:

- 5 stage pipeline processor
- No structural hazards
- Resolve data hazards using forward and stall
- Branch predict unit using global 2-bit saturating counter scheme

The processor currently has no interrupt or exception scheme, this feature may be added in the future.

## Project structure

- src/main/scala/riscv_mini_five_stage: source code of the processor
    - Addr_Buffer.scala: a small register file recording the address that need to recover from branch predict failure.
    - ALU.scala: Arithmetic and logic unit of the processor.
    - Branch_Predict.scala: Branch predict unit of the processor.
    - Config.scala: Global config parameters of the processor, not the actual hardware component.
    - Control.scala: Main control unit of the processor.
    - DataCache.scala: Data cache of the processor.
    - Datapath.scala: Datapath of the processor, include all the logic gates out of the functional unit.
    - Encoding.scala: A simple program translates the assembly code to binary code, not the actual hardware component.
    - EX_MEM_Register.scala: Pipeline register between EX and MEM stage.
    - Forward.scala: Forward unit fo the processor.
    - Hazard_Detection.scala: Detect the hazards that need to stall the processor.
    - ID_EX_Register.scala: Pipeline register between ID and EX stage.
    - IF_ID_Regsiter.scala: Pipeline register between IF and ID stage.
    - ImmGen.scala: Generate the immediate from the instructions.
    - InstCache.scala: Instruction cache of the processor.
    - Instructions.scala: Define the instructions and their bitpat of RV32I, not the actual hardware component.
    - MEM_WB_Register.scala: Pipeline register between MEM and WB stage.
    - PC.scala: Program counter of the processor.
    - RegFile.scala: Register file of the processor.
    - Tile.scala: Top level of the processor, connects all the functional component.
- src/test/scala/riscv_mini_five_stage_test: unit test of the processor.
    - Tile_Test.scala generates the test result of the program written in initmem/asm_input.txt.

### Generate verilog

Running src/main/scala/riscv_mini_five_stage/Tile.scala Tile object

### Input test program

Write your assembly code in initmem/asm_input.txt.

Format:

- Op must be upper case
- Register name must start with 'x'
- Immediate must start with "0x", Hex format

```
R-type :   Op    rd , rs1, rs2
I-type :   Op    rd , rs1, imm
S-type :   Op    rs2, rs1, imm
U-type :   Op    rd , imm
SB-type:   Op    rs1, rs2, imm
UJ-type:   Op    rd , imm
No operation just type "NOP"
```

The output file is initmem/instcache.txt, Hex format. Each line represents a Byte in instruction cache.

## Simple M-mode interrupt handling

The scheme is showed in src/main/scala/riscv_mini_five_stage/CSR.scala

Under the branch pridict scheme, the interrupt handling seems to be very difficult, so I wait till pipeline is stable then enable the interrupt.

But the implementation is not good enough. Also, the implementation may contains a lot of bugs.

[Chinese Version]: ./README_zh.md

[Chinese Version]

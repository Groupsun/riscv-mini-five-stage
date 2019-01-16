# Test instructions
Here are some sample programs that could test some instructions of the processor

### simple test

```
SW	x2, 0x06(x1)	
SW	x3, 0x0A(x1)	
ADD	x3, x1, x2	
LW	x6, 0x06(x1)	
BEQ	x4, x5, 0x12
```

### Immediate arithmetic instructions I

```
ADDI x6, x1, 10
ANDI x7, x2, 20
XORI x8, x3, 13
```

### Immediate arithmetic instructions II

```
ADDI x10, x1, 0x-64
SLL  x6, x1, x2
SRLI x7, x2, 0x01
SRAI x8, x3, 0x02
SLLI x9, x4, 0x05
SRAI x11, x10, 0x02
```

### Immediate arithmetic instructions III

```
ADDI  x10, x1, 0x-64
SLTI  x8, x2, 0x14
SLTIU x9, x3, 0x-0A
ADDI  x11, x2, 0x0C
SLLI  x12, x3, 0x04
SLT   x6, x10, x1
SLTU  x7, x10, x1
```

### Store instructions

```
SW    x20, x3, 0x00
SH    x21, x3, 0x04
SB    x22, x3, 0x08
```

### Load instructions

```
LW    x10, x0, 0x14
LHU   x11, x0, 0x18
LBU   x12, x0, 0x1C
LH    x13, x0, 0x14
LB    x14, x0, 0x18
```

### Jump and link instructions

```
JALR x6, x1, 0x0E
NOP
NOP
NOP
NOP
ADD x7, x1, x2
```

```
JAL  x6, 0x0A
NOP
NOP
NOP
NOP
AUIPC x7, 0xC2B
```

### RAW dependence test

```
ADDI x1, x0, 0x01
ADDI x2, x0, 0x02
ADDI x3, x0, 0x03
ADD x1, x1, x2
ADD x2, x1, x3
ADD x3, x1, x2
ADD x4, x1, x3
```

The correct status after running this program is:

- x1 = 0x03
- x2 = 0x06
- x3 = 0x09
- x4 = 0x0C

### simple program 1

The program is written in C:

```
void f()
{
    int a[5];
    for(int i = 0;i < 5;i++)
        a[i] = i + 1;
}
```

The assembly code represented by RV32I such as:

```
; x1 as the sp register, which indicate the address of array a
; x2 as the indicator i
; x3 as the upper bound 5

NOP
ADDI x3, x0, 0x05
ADDI x2, x2, 0x01
SW   x2, x1, 0x00
ADDI x1, x1, 0x04
BLT  x2, x3, 0x-06
NOP
NOP
```

The program above contains data hazard:

- x2: between ADDI and SW

This hazard could resolve by forward.

The correct status after running this program is:

- x1 = 0x14
- x2 = 0x05
- x3 = 0x05
- Mem[sp] ~ Mem[sp + 0x14] = 0x01 ~ 0x05

### data hazard test program

```
NOP
ADDI x1, x0, 0x0A
SW   x1, x0, 0x04
LW   x2, x0, 0x04
ADDI x3, x2, 0x10
ADD  x4, x1, x3
ADD  x5, x1, x3
NOP
NOP
```

The program above contains data hazards:

- x1: between ADDI and SW
- x2: between LW and ADDI
- x3: between ADDI and ADD(write x4 and x5)

The first and third data hazards could resolve by forward, the second data hazard must stall a cycle and then resolve by forward


```
NOP
ADDI x1, x0, 0x04
ADDI x2, x0, 0x08
JALR x3, x0, 0x14
ADDI x1, x1, 0x01
BLT  x1, x2, 0x-02
ADDI x1, x1, 0x1C
ADDI x2, x2, 0x1E
NOP
NOP
```
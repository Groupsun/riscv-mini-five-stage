# Test instructions
Here are some sample programs that could test some instructions of the processor

## init data

### register
```
x1 = 0x0A = 10
x2 = 0x0B = 11
x3 = 0x0C = 12
x4 = 0x0F = 15
x5 = 0x0F = 15
x20 = 0xC20E135
x21 = 0xC20E136
x22 = 0xC20E137
x23 = 0xC20E138
x24 = 0xC20E139
```

### data cache
```
d$(0x00) = 0xA50B2C0
d$(0x04) = 0xA50B2C1
d$(0x08) = 0xA50B2C2
d$(0x0C) = 0xA50B2C3
d$(0x10) = 0xA50B2C5
d$(0x14) = 0xFFFECF6
d$(0x18) = 0xFFFECF5
d$(0x1C) = 0xFFFECF4
d$(0x20) = 0xFFFECF3
d$(0x24) = 0xFFFECF2
```

### simple test

```
0x04: SW	x2, 0x06(x1)	
0x08: SW	x3, 0x0A(x1)	
0x0C: ADD	x3, x1, x2	
0x10: LW	x6, 0x06(x1)	
0x14: BEQ	x4, x5, 0x12
```

### Immediate arithmetic instructions I

```
0x04: ADDI x6, x1, 10
0x08: ANDI x7, x2, 20
0x0C: XORI x8, x3, 13
```

### Immediate arithmetic instructions II

```
0x04: ADDI x10, x1, 0x-64
0x08: SLL  x6, x1, x2
0x0C: SRLI x7, x2, 0x01
0x10: SRAI x8, x3, 0x02
0x14: SLLI x9, x4, 0x05
0x18: SRAI x11, x10, 0x02
```

### Immediate arithmetic instructions III

```
0x04: ADDI  x10, x1, 0x-64
0x08: SLTI  x8, x2, 0x14
0x0C: SLTIU x9, x3, 0x-0A
0x10: ADDI  x11, x2, 0x0C
0x14: SLLI  x12, x3, 0x04
0x18: SLT   x6, x10, x1
0x1C: SLTU  x7, x10, x1
```

### Store instructions

```
0x04: SW    x20, x3, 0x00
0x08: SH    x21, x3, 0x04
0x0C: SB    x22, x3, 0x08
```

### Load instructions

```
0x04: LW    x10, x0, 0x14
0x08: LHU   x11, x0, 0x18
0x0C: LBU   x12, x0, 0x1C
0x10: LH    x13, x0, 0x14
0x14: LB    x14, x0, 0x18
```

### Jump and link instructions

```
0x04: JALR x6, x1, 0x0E
0x08: NOP
0x0C: NOP
0x10: NOP
0x14: NOP
0x18: ADD x7, x1, x2
```

```
0x04: JAL  x6, 0x0A
0x08: NOP
0x0C: NOP
0x10: NOP
0x14: NOP
0x18: AUIPC x7, 0xC2B
```

### RAW dependence test

```
0x04: ADD x1, x1, x2
0x08: ADD x2, x1, x3
0x0C: ADD x3, x1, x2
0x10: ADD x4, x1, x3
```

### simple program 1

The program is written in C:

```
void f()
{
    int a[5];
    for(int i = 0;i < 5;i++)
        a[i] = i;
}
```

The assembly code represented by RV32I such as:

```
; x1 as the sp register, which indecate the address of array a
; x2 as the indicator i
; x3 as the upper bound 5

ADDI x3, x0, 0x05
SW   x2, x1, 0x00
ADDI x2, x2, 0x01
ADDI x1, x1, 0x04
BLT  x2, x3, 0x-06
```

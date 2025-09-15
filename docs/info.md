<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

# MULTI CYCLE PIPELINED RISCv BASED PROCESSOR

## 1. Problem Statement

- The aim of this project is to design a simple MULTI CYCLE PIPELINED RISC CPU with the below given instruction sets.
- CPU is working at a clock of 50 MHz.
- This document outlines the specifications for the design and implementation of a multi-cycle pipelined RISC-V based processor.

## 2. Specification

### a) Register Set
- 16 general purpose registers labelled 0 to F.
- Each of 8 bits width.

### b) PC
- Program Counter

### c) Memory
- 128 x 8 bits of Program memory (PROG)

### d) Instruction Format

| FUNC7 | RS2 | RS1 | FUNC3 | RD | OPCODE |
|-------|-----|-----|-------|----|--------|
| 7 BITS | 5 BITS | 5 BITS | 3 BITS | 5 BITS | 7 BITS |

> Note: Not all fields will be used in each instruction.

### e) Instruction Set

#### Arithmetic Instructions

**ADDI (Add immediate)**

| OPERATION | IMMEDIATE VALUE (8 BITS) | RS1 (5 BITS) | FUNC3 (3 BITS) | RD (5 BITS) | OPCODE (7 BITS) |
|-----------|---------------------------|-------------|---------------|------------|----------------|
| ADD-I | 0000_0010 | 00000 | 000 | 00010 | 0010011 |

`Reg (RD) = R1 + IMME_VALUE`

---

**ADD**

| OPERATION | FUNC7 | RS2 | RS1 | FUNC3 | RD | OPCODE |
|-----------|-------|-----|-----|-------|----|--------|
| ADD | 0000000 | 01001 | 01000 | 000 | 00110 | 0110011 |

`Reg (RD) = RS1 + RS2`

---

**SUB**

| OPERATION | FUNC7 | RS2 | RS1 | FUNC3 | RD | OPCODE |
|-----------|-------|-----|-----|-------|----|--------|
| SUB | 0100000 | 01011 | 01000 | 000 | 00100 | 0110011 |

`Reg (RD) = RS1 - RS2`

---

#### Logic Instructions

**AND**

| OPERATION | FUNC7 | RS2 | RS1 | FUNC3 | RD | OPCODE |
|-----------|-------|-----|-----|-------|----|--------|
| AND | 0000000 | 01001 | 01000 | 111 | 00110 | 0110011 |

`Reg (RD) = RS1 & RS2`

---

**OR**

| OPERATION | FUNC7 | RS2 | RS1 | FUNC3 | RD | OPCODE |
|-----------|-------|-----|-----|-------|----|--------|
| OR | 0000000 | 01001 | 01000 | 110 | 00110 | 0110011 |

`Reg (RD) = RS1 | RS2`

---

**NOT**

| OPERATION | FUNC7 | RS2 | RS1 | FUNC3 | RD | OPCODE |
|-----------|-------|-----|-----|-------|----|--------|
| NOT | 0100000 | 01001 | 01000 | 111 | 00110 | 0110011 |

`Reg (RD) = ~ (RS1)`

---

**XOR**

| OPERATION | FUNC7 | RS2 | RS1 | FUNC3 | RD | OPCODE |
|-----------|-------|-----|-----|-------|----|--------|
| XOR | 0000000 | 01001 | 01000 | 100 | 00110 | 0110011 |

`Reg (RD) = RS1 ^ RS2`

---

#### Relational Instructions

**CMP**

| OPERATION | FUNC7 | RS2 | RS1 | FUNC3 | RD | OPCODE |
|-----------|-------|-----|-----|-------|----|--------|
| CMP | 0000000 | 01001 | 01000 | 010 | 00110 | 0110011 |

`Reg (RD) = RS1 > RS2`

---

**EQ**

| OPERATION | FUNC7 | RS2 | RS1 | FUNC3 | RD | OPCODE |
|-----------|-------|-----|-----|-------|----|--------|
| EQ | 0000000 | 01001 | 01000 | 000 | 00110 | 1100011 |

`Reg (RD) = RS1 == RS2`

---

#### Flow Instructions

**JUMP**

| OPERATION | Direct_Add (7 BITS) | OPCODE (7 BITS) |
|-----------|---------------------|----------------|
| JUMP | 001_0100 | 110_1111 |

`PC = PROG[ADDR]`  
(Direct_Add - Starting from MSB 7 bits)

---

**JUMP_IF**

| OPERATION | Direct_Add (7 BITS) | FUNC3 (3 BITS) | RS1 (5 BITS) | OPCODE (7 BITS) |
|-----------|---------------------|---------------|-------------|----------------|
| JUMP_IF | 001_0100 | 000 | 01000 | 110_0011 |

`If REG, Then PC = PROG[ADDR]`

---

**JUMP_IF_NOT_EQUAL**

| OPERATION | Direct_Add (7 BITS) | FUNC3 (3 BITS) | RS1 (5 BITS) | OPCODE (7 BITS) |
|-------------|---------------------|---------------|-------------|----------------|
| JUMP_IF_NOT | 001_0100 | 001 | 01000 | 110_0011 |

`If !REG, Then PC = PROG[ADDR]`

---

**NOP**

| OPERATION | OPCODE (7 BITS) |
|-----------|----------------|
| NOP | 0000000 |

`No operation`

---

**HALT**

| OPERATION | OPCODE (7 BITS) |
|-----------|----------------|
| HALT | 1111111 |

`End of the program.`

> Note: The above register addresses are given for reference and can be altered in the project as required.


## How to test

By driving the Clk, Reset and giving the address and insturction to Program memory

## External hardware

No

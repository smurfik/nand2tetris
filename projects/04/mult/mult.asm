// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// set variable sum to 0
  @sum
  M=0

// set variable counter to 0
  @counter
  M=0

// if R0 is 0 go to END
  @R0
  D=M
  @STOP
  D;JEQ

// if R1 is 0 go to END
  @R1
  D=M
  @STOP
  D;JEQ

  (LOOP)
    @counter
    D=M
    @R1
    D=D-M
    @STOP
    D;JEQ // if i == R1 goto STOP

    @sum
    D=M
    @R0
    D=D+M
    @sum
    M=D // sum = sum + RAM[0]
    @counter
    M=M+1 // counter = counter + 1
    @LOOP
    0;JMP

  (STOP)
    @sum
    D=M
    @R2
    M=D // RAM[2] = sum

  (END)
    @END
    0;JMP

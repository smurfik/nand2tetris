// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
MD=M-1
A=M
D=M
A=A-1
D=M-D
@LABEL.1
D;JEQ
@SP
A=M-1
M=0
@LABEL.2
0;JMP
(LABEL.1)
@SP
A=M-1
M=-1
(LABEL.2)
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
MD=M-1
A=M
D=M
A=A-1
D=M-D
@LABEL.3
D;JEQ
@SP
A=M-1
M=0
@LABEL.4
0;JMP
(LABEL.3)
@SP
A=M-1
M=-1
(LABEL.4)
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
MD=M-1
A=M
D=M
A=A-1
D=M-D
@LABEL.5
D;JEQ
@SP
A=M-1
M=0
@LABEL.6
0;JMP
(LABEL.5)
@SP
A=M-1
M=-1
(LABEL.6)
// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
MD=M-1
A=M
D=M
A=A-1
D=M-D
@LABEL.7
D;JLT
@SP
A=M-1
M=0
@LABEL.8
0;JMP
(LABEL.7)
@SP
A=M-1
M=-1
(LABEL.8)
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
MD=M-1
A=M
D=M
A=A-1
D=M-D
@LABEL.9
D;JLT
@SP
A=M-1
M=0
@LABEL.10
0;JMP
(LABEL.9)
@SP
A=M-1
M=-1
(LABEL.10)
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
MD=M-1
A=M
D=M
A=A-1
D=M-D
@LABEL.11
D;JLT
@SP
A=M-1
M=0
@LABEL.12
0;JMP
(LABEL.11)
@SP
A=M-1
M=-1
(LABEL.12)
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
MD=M-1
A=M
D=M
A=A-1
D=M-D
@LABEL.13
D;JGT
@SP
A=M-1
M=0
@LABEL.14
0;JMP
(LABEL.13)
@SP
A=M-1
M=-1
(LABEL.14)
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
MD=M-1
A=M
D=M
A=A-1
D=M-D
@LABEL.15
D;JGT
@SP
A=M-1
M=0
@LABEL.16
0;JMP
(LABEL.15)
@SP
A=M-1
M=-1
(LABEL.16)
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
MD=M-1
A=M
D=M
A=A-1
D=M-D
@LABEL.17
D;JGT
@SP
A=M-1
M=0
@LABEL.18
0;JMP
(LABEL.17)
@SP
A=M-1
M=-1
(LABEL.18)
// push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 53
@53
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
MD=M-1
A=M
D=M
A=A-1
M=M+D
// push constant 112
@112
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
MD=M-1
A=M
D=M
A=A-1
M=M-D
// neg
@SP
A=M-1
M=-M
// and
@SP
MD=M-1
A=M
D=M
A=A-1
M=M&D
// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
MD=M-1
A=M
D=M
A=A-1
M=M|D
// not
@SP
A=M-1
M=!M
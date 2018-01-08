// push constant 3030
@3030
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3040
@3040
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
// push pointer 0
@3
D=A
R13
M=D
R13
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push pointer 1
@4
D=A
R13
M=D
R13
A=M
D=M
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
// push this 2
@THIS
D=M
@2
D=A+D
R13
M=D
R13
A=M
D=M
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
// push that 6
@THAT
D=M
@6
D=A+D
R13
M=D
R13
A=M
D=M
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

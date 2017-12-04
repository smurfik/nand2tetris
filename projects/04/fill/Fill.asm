// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(READ_INPUT)
	@KBD
	D=M

	@color
	M=0

	@FILL_SCREEN
	D;JEQ // if keyboard = 0, goto FILL_SCREEN

	@COLOR_BLACK
	0;JMP // else, goto COLOR_BLACK
@READ_INPUT
0;JMP

(COLOR_BLACK)
@color
M=-1

(FILL_SCREEN)
	// if @color = -1 then screen becomes black,
	// else if @color = 0, screen becomes white

	@SCREEN
	D=A
	@screen
	M=D // screen = SCREEN

	(FILL_LOOP)
		@color
		D=M
		@screen
		A=M
		M=D

		@screen
		M=M+1

		@24576
		D=A
		@screen
		D=D-M
	@FILL_LOOP
	D;JGT // if D > 0 goto FILL_LOOP

@READ_INPUT
0;JMP

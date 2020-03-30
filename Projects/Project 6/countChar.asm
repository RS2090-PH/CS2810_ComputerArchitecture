;	countChar.asm
; 	Program to count occurrences of a character in a string.
; 	R0 - Character input from the keyboard.
;	R1 - Character loaded from memory
;	R2 - Count of occurrences, start at 0
;	R3 - Pointer to block of characters
; 	Result displayed on the console.
; 	Program only works if no more than 9 occurrences are found. 

		.ORIG	x3000
		BR START
ASCII	.FILL x30			; offset to convert to ascii
INSTAT	.FILL xFE00			; label keyboard status registry
INREG	.FILL xFE02			; label keyboard data registry
OUTSTAT	.FILL xFE04			; label monitor status registry
OUTREG	.FILL xFE06			; label monitor data registry
STRING	.STRINGZ "Now is the time for all good men to come to the aid of their country."
CTMESS	.STRINGZ " occurances of your selected character appear in the string."

CIN	LDI R7, INSTAT		; Gets character from keyboard
		BRzp CIN			; and saves to R0
		LDI R0, INREG
		BRnzp x04

START	AND	R2, R2, #0		; R2 is counter, initially 0
		LEA	R3, STRING		; R3 is pointer to string
		LEA R4, CTMESS
		BRnzp CIN			; R0 gets character input
		NOT R0, R0			; Calculate two's complement
		ADD R0, R0, #1
		LDR	R1, R3, #0		; R1 gets first character in string 

TEST	BRz	OUTPUT			; If R1=0, prepare the output
		ADD R1, R1, R0		; Compare characters
		BRnp	GETCHAR		; If no match, do not increment
		ADD	R2, R2, #1		; Otherwise, increment count

GETCHAR	ADD	R3, R3, #1		; Point to next character.
		LDR	R1, R3, #0		; R1 gets next char to test
		BR	TEST

SOUT	LDI R7, OUTSTAT		; Gets character from R0 and
		BRzp SOUT			; outputs to monitor when the
		LD R0, ASCII
		ADD R0, R0, R4
		STI R0, OUTREG		; monitor is ready.
		ADD R4, R4, #1
		BRnp SOUT
		BR x03

COUT	LDI R7, OUTSTAT		; Gets character from R0 and
		BRzp COUT			; outputs to monitor when the
		STI R0, OUTREG		; monitor is ready.
		LDI R0, CTMESS
		BRnzp SOUT
	
OUTPUT	LD	R0, ASCII		; Load the ASCII offset
		ADD	R0, R0, R2		; Covert binary count to ASCII
		BRnzp COUT				; ASCII code in R0 is displayed.
		HALT			 	; Halt machine
		.END

	
;	countChar.asm
; 	Program to count occurrences of a character in a string.
; 	R0 - Character input from the keyboard.
;	R1 - Character loaded from memory
;	R2 - Count of occurrences, start at 0
;	R3 - Pointer to block of characters
; 	Result displayed on the console.
; 	Program only works if no more than 9 occurrences are found. 

		.ORIG	x3000
		BR Start
ASCII	.FILL x30			; offset to convert to ascii
STRING	.STRINGZ "Now is the time for all good men to come to the aid of their country."

Start	AND	R2, R2, #0		; R2 is counter, initially 0
		LEA	R3, STRING		; R3 is pointer to string
		IN					; R0 gets character input
		NOT R0, R0			; Calculate two's complement
		ADD R0, R0, #1
		LDR	R1, R3, #0		; R1 gets first character in string 

TEST	BRz	OUTPUT			; If R1=0, prepare the output
		ADD R1, R1, R0		; Compare characters
		BRnp	GETCHAR		; If no match, do not increment
		ADD	R2, R2, #1		; Otherwise, increment count

GETCHAR	ADD	R3, R3, #1	; Point to next character.
		LDR	R1, R3, #0	; R1 gets next char to test
		BR	TEST

OUTPUT	LD	R0, ASCII	; Load the ASCII offset
		ADD	R0, R0, R2	; Covert binary count to ASCII
		OUT		; ASCII code in R0 is displayed.
		HALT		; Halt machine
		.END
;	test.asm
;	Bruce Embry (Modified by Robby)
;	A program to test my Multi subroutine. Limits input up to 
;	3 since any return value over 9 would require another subroutine
;	to convert the larger numbers to multiple ascii values.
;   Arguments:  none, this is a standalone program
;	Return value:  none, this is a standalone program

		.ORIG X3000
		BR Start
Prompt1	.STRINGZ "\nPlease enter a decimal digit (0-3) "
Prompt2	.STRINGZ "\nPlease enter a second decimal digit (0-3) "
Output	.STRINGZ "\nThe result of this multiplication is "
Char1	.FILL #0
Char2	.FILL #0

Value	.FILL #0
toValue	.FILL x-30				; offset to convert ascii digit to value
toAscii	.FILL x30				; offset to convert value to ascii digit

Start	LEA 	R0, Prompt1		; point R0 to beginning of prompt1
		PUTS					; output the prompt
		GETC					; get a character in R0
		OUT						; echo the character
		LD 		R1, toValue		; get offset to convert to value
		ADD 	R0, R0, R1		; convert R0 to value
		ST 		R0, Char1		; store character
		BRN 	Start			; if < 0
		ADD 	R2, R0, #-3		; check if > 3
		BRP 	Start			; if >  3

Second	LEA 	R0, Prompt2		; point R0 to beginning of prompt2
		PUTS					; output the prompt
		GETC					; get a character in R0
		OUT						; echo the character
		LD 		R1, toValue		; get offset to convert to value
		ADD 	R0, R0, R1		; convert R0 to value
		ST 		R0, Char2		; store character
		BRN 	Second			; if < 0
		ADD 	R2, R0, #-3		; check if > 3
		BRP 	Second			; if >  3

		;LD R3, 2sComp
		LD 		R1, Char1		; loads char1 value into R1
		LD 		R2, Char2		; loads char2 value into R2
		LEA 	R3, Multi		; load subroutine address into register
		JSRR 	R3				; execute subroutine
		ST 		R0, Value		; store value of result

		LEA 	R0, Output		; point r0 to beginning of output message
		PUTS		
		LD 		R0, Value		; retrieve value of result
		LD 		R1, toAscii
		ADD 	R0, R0, R1
		OUT

		HALT


Multi   ST      R1, SAVER1
        ST      R2, SAVER2
        ST      R7, SAVER7
        AND     R0, R0, #0
Loop    ADD     R2, R2, #1
        ADD     R2, R2, #-1
        BRnz    Cont
        ADD     R0, R0, R1
        ADD     R2, R2, #-1
        BRp     Loop  
Cont    LD      R1, SAVER1
        LD      R2, SAVER2
	    LD      R7, SAVER7
        RET
SAVER1  .FILL x0000
SAVER2  .FILL x0000
SAVER7  .FILL x0000



        .END
		
		
		
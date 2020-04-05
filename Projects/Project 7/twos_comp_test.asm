;	test.asm
;	Bruce Embry
;	A program to test my 2sComp.asm subroutine
;   Arguments:  none, this is a standalone program
;	Return value:  none, this is a standalone program

		.ORIG X3000
		BR Start
Prompt	.STRINGZ "\nPlease enter a decimal digit (0-9) "
Output	.STRINGZ "\nThe negative of this digit is "
Char	.FILL #0
Value	.FILL #0
toValue	.FILL x-30				; offset to convert ascii digit to value
toAscii	.FILL x30				; offset to convert value to ascii digit
;2sComp	.FILL X4000				; address of subroutine
Minus	.FILL x2D				; ascii code for minus sign

Start	LEA R0, Prompt			; point R0 to beginning of prompt
		PUTS					; output the prompt
		GETC					; get a character in R0
		OUT						; echo the character
		ST R0, Char				; store character
		LD R1, toValue			; get offset to convert to value
		ADD R0, R0, R1			; convert R0 to value
		BRN Start				; if < 0
		ADD R2, R0, #-9			; check if > 9
		BRP Start				; if >  9
		;LD R3, 2sComp
		LEA R3, 2sComp			; load subroutine address into register
		JSRR R3					; execute subroutine
		ST R0, Value			; store value of digit
		LEA R0, Output			; point r0 to beginning of output message
		PUTS		
		LD R0, Value			; retrieve value of digit
		BRZ Result				; if r0 = 0
		LD R0, Minus
		OUT						; output minus sign
Result	LD R0, Char				; retrieve original character
		OUT						; output the character
		BR Start


2sComp  ST  R7, SAVER7
    	NOT R0, R0
        ADD R0, R0, #1
		LD  R7, SAVER7
        RET
SAVER7  .FILL x0000
        .END
		
		
		
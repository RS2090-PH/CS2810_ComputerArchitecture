@ nano countChar.s
@ Bruce Embry
@ demonstrate input and output

		.global _start
		.data
prompt1:	.asciz "Enter string to be searched> "
prompt2:	.asciz "Enter character to search> "
output:		.asciz "The times the character occurs: "
character:	.space 1
count:		.space 2, '\n'
string:		.space 78
		.text
_start:		MOV R0, #1			@ screen
		LDR R1, =prompt1		@ pointer
		MOV R2, #prompt2-prompt1	@ maxsize
		MOV R7, #4			@ write
		SVC 0
		MOV R5, R0			@ save answer length

		MOV R0, #0
		LDR R1, =string
		MOV R2, #78			@buffer size
		MOV R7, #3			@read
		SVC 0

		MOV R0, #1			@ screen
		LDR R1, =prompt2		@ pointer
		MOV R2, #output-prompt2		@ maxsize
		MOV R7, #4			@ write
		SVC 0

		MOV R0, #0
		LDR R1, =character
		MOV R2, #2			@buffer size
		MOV R7, #3			@read
		SVC 0

		MOV R0, #0			@initialize count
		LDR R1, =string			@set pointer
		LDR R3, =character		@set base register to location of character
		LDRB R3, [R3]			@retrieve search character
Loop:		LDRB R2, [R1]			@retrieve next character from string
		SUBS R4, R2, #10		@check for newline
		BEQ Done			@if zero, branch to Done
		SUBS R4, R2, R3			@compare with search character
                BNE Skip			@if not zero, skip next instruction
		ADD R0, R0, #1			@increment count
Skip:		ADD R1, R1, #1			@increment pointer
		B Loop				@unconditional branch
Done:		ADD R4, R0, #0x30		@convert count to ASCII
		LDR R0, =count			@set base register to addres of count
		STRB R4, [R0]			@store at count

		MOV R0, #1			@std output
		LDR R1, =output			@set pointer
		MOV R2, #character-output	@set length of output messsage
		MOV R7, #4			@output
		SVC 0
		
		MOV R0, #1			@reset to std.out
		LDR R1, =count			@set pointer
		MOV R2, #2 			@output a single character plus newline
		MOV R7, #4			@write
		SVC 0

		MOV R7, #1			@exit
		SVC 0
		.end

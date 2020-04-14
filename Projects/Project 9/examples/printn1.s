@ printn.s
@ a subroutine to convert a decimal value to an zero-terminated ascii string
@ PARAMETERS:
@ R0 - the decimal value to convert
@ R1 - the address of the buffer where the string will be stored
@ R2 - length of buffer
@ RETURN VALUES:
@ R0 - address of beginning of converted string
@ R1 - number of characters in converted string
@ ERROR CHECKING:
@ Only works on non-negative numbers
@ Returns -1 if decimal value is negative
@ DEPENDENCIES:
@ Makes use of divide subroutine

.extern divide
.globl printn
printn:		
	push {r2-r4,lr}		// save registers and return address
	mov r3, #0		// initialize counter
	movs r0, r0		// check r0 value
	bmi error		// if number < 0, error
	add r4, r1, r2		// r4 points past end of buffer
	sub r4, r4, #1		// point to end of buffer
	beq done		// if number = 0, done
again:		
	sub r4, r4, #1		// move pointer to previous character
	mov r1, #10		// setup divisor
	bl divide		// divide by 10
	add r1, r1, #0x30	// convert remainder to ascii
	strb r1, [r4]		// store character
	add r3, r3, #1		// count characters
	movs r0, r0		// check number
	beq done		// if number = 0, done
	b again
error:
	mov r0, #-1		// set error code
	b return
done:
	mov r0, r4		// address of beginning of string
	mov r1, r3		// count of characters
return:
	pop {r2-r4,pc}	// recover registers and return address
	.end

@ convert.s
@ a subroutine to convert an ascii string to a binary value
@ Parameters:
@ r0 - beginning address of string
@ r1 - length of string
@ Return value:
@ r0 - binary value

.globl convert
convert:
	// save registers, stack grows downward
	push {r1,r2,r3,r4,r10,lr}
	// begin code
	mov r2, r0		@ copy address to r2
	mov r0, #0		@ clear sum
	mov r10, #10		// setup multiplier
getChar:	
	ldrb r3, [r2]		@ get a character
	subs r3, r3, #0x30	@ convert to value
	bmi error		@ error if negative
	subs r4, r3, #10
	bpl error		@ error if > 9
	add r0, r0, r3		@ add value to sum
	subs r1, r1, #1		@ decrement count
	beq exit		@ exit if zero
	mul r0, r10, r0		@ multiply by ten
	add r2, r2, #1
	b getChar		@ get another character
error:
	mov r0, #-1		@ error code
exit:
	// restore registers, stack contracts upward
	pop {r1,r2,r3,r4,r10,pc}
.end
		
